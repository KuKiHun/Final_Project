import express from "express";
import session from "express-session";
import http from "http";
import { Server } from "socket.io";
import path from "path";
const mysql = require("mysql");
const cors = require("cors");

const conn = mysql.createConnection({
  host: "175.198.206.137",
  port: 3306,
  user: "q",
  password: "q",
  database: "follaw",
});

conn.connect((err) => {
  if (err) {
    console.error("MySQL 연결 오류");
    return;
  }
  console.log("MySQL에 성공적으로 연결되었습니다.");
});

const app = express();
app.set("port", process.env.PORT || 3001);
// app.set("views", __dirname + "/views");
app.set("views", path.join(__dirname, "/views"));
app.set("view engine", "pug");
// app.use("/public", express.static(__dirname + "/public"));
app.use("/public", express.static(path.join(__dirname, "/public")));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(
  session({
    resave: false,
    saveUninitialized: false,
    //COOKIE_SECRET 환경 변수가 설정되어 있다면 그 값을 사용하고,
    //설정되어 있지 않다면 "secret"이라는 기본값을 사용하여 세션 데이터를 암호화
    secret: process.env.COOKIE_SECRET || "secret",
    cookie: {
      //httpOnly: true는 클라이언트에서 세션 쿠키에 접근할 때 JavaScript를 통한 접근을 막는 옵션
      httpOnly: true,
      //secure: false는 세션 쿠키를 안전한 연결(HTTPS)을 통해서만 전송해야 하는지 여부를 설정하는 옵션
      secure: false,
    },
  })
);
app.use((req, res, next) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.header(
    "Access-Control-Allow-Headers",
    "Origin, X-Requested-With, Content-Type, Accept"
  );
  next();
});

const corsOptions = {
  origin: "http://localhost:3001/videoIndex",
  optionsSuccessStatus: 200,
};

app.use(cors(corsOptions));

const ioPath = path.resolve(__dirname, "./node_modules/socket.io-client/dist");
app.use("/socket.io", express.static(ioPath));

app.get("/", (req, res) => {
  // TODO: add user
  return res.render("index");
});

//************** 화상 시작 **************/
app.set("dummyDb2", { rooms: new Array() });

app.get("/videoIndex", (req, res) => {
  // TODO: add user
  return res.render("videoIndex");
});

app.post("/videoIndex", (req, res) => {
  // TODO: add user
  return res.render("videoIndex");
});

app.post("/videoIndex/newRoom", (req, res) => {
  const { title, auth, user } = req.body;
  const roomId = req.sessionID + Date.now();
  let totalCount = 0;
  const { rooms } = app.get("dummyDb2");

  if (auth == 0) {
    totalCount += 1;
  }

  console.log("app.js / user :" + user);

  rooms.push({ title, roomId, totalCount });
  console.log("app.js / newRoom : " + rooms);

  const sql =
    "INSERT INTO chat(chat_type, chat_title, user_id, chat_created) VALUES(1, ?, ?, now())";
  const value = [title, user];

  conn.query(sql, value, (err, result, fields) => {
    if (err) throw err;
    console.log(result);
  });

  app.get("wss").clients.forEach((client) => {
    if (client.location === "index" && client.readyState === client.OPEN)
      client.send(JSON.stringify(rooms));
  });
  return res.redirect(`/video/${roomId}`);
});

app.get("/video/:roomId", (req, res) => {
  const { user } = req.query;
  console.log("/video/:roomId  >>> user : " + user);
  const { title } = app
    .get("dummyDb2")
    .rooms.find((room) => room.roomId === req.params.roomId);

  //res.locals는 응답 객체(res)의 속성으로, 해당 응답에 대한 로컬 변수를 설정하고 사용할 수 있게 해줌
  console.log("app.js/title :" + title);
  res.locals.title = title;

  const targetRoom = app
    .get("dummyDb2")
    .rooms.find((room) => room.roomId === req.params.roomId);

  console.log("app.js/targetRoom1 :" + targetRoom.totalCount);
  targetRoom.totalCount += 1;

  console.log("app.js/targetRoom2 :" + targetRoom.totalCount);

  const sql = "UPDATE chat SET lawyer_id=? WHERE chat_title = ?";
  const value = [user, title];

  conn.query(sql, value, (err, result, fields) => {
    if (err) throw err;
    console.log(result);
  });

  //chat 파일을 렌더링하여 해당 파일에서 title 변수를 사용할 수 있음
  res.render("video");
});

app.post("/videoIndex/leave-room", (req, res) => {
  const { title, auth } = req.body;
  console.log("app.js/title :" + title);
  console.log("app.js/auth :" + auth);
  let { rooms } = app.get("dummyDb2");
  console.log(rooms);
  console.log("--------------------");

  // rooms.totalCount += count;
  // console.log("totalCount : " + totalCount);

  const foundRoom = rooms.find((room) => room.title === title);
  console.log("app.js/foundRoom.totalCount :" + foundRoom.totalCount);

  if (foundRoom) {
    if (auth == 1) {
      foundRoom.totalCount -= 1;
      console.log("app.js/totalCount111 : " + foundRoom.totalCount);
    } else if (auth == 0) {
      foundRoom.totalCount = 0;
      console.log("app.js/totalCount111 : " + foundRoom.totalCount);
    }

    if (foundRoom.totalCount == 0) {
      const index = rooms.indexOf(foundRoom);
      console.log("app.js/index : " + index);
      if (index !== -1) {
        rooms.splice(index, 1);

        const sql =
          "UPDATE chat SET chatting_closed=now() WHERE chat_title = ?";
        const value = [title];

        conn.query(sql, value, (err, result, fields) => {
          if (err) throw err;
          console.log(result);
        });
      }
    }
    console.log("app.js/totalCount222 : " + foundRoom.totalCount);
    console.log(rooms);
  }

  return res.render("videoIndex", { rooms });
});

//************** 화상 끝 **************/

app.use((err, req, res, next) => {
  res.locals.message = err.message;
  res.locals.error = process.env.NODE_ENV !== " production" ? err : {};
  res.status(err.status || 500).render("error");
});

const expressServer = app.listen(app.get("port"), () =>
  console.log(`Listening on http://localhost:3001`)
);

// socket
require("./socket")(expressServer, app);
