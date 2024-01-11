const express = require("express");
const path = require("path");
const morgan = require("morgan");
const session = require("express-session");

const mysql = require("mysql");

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
app.set("port", process.env.PORT || 8003);

app.set("views", path.join(__dirname, "views"));
app.set("view engine", "pug");
app.use(morgan("dev"));
app.use(express.static(path.join(__dirname, "public")));
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

// DB 연결
app.set("db", conn);

//검색
app.get("/", async (req, res) => {
  const query = "select * from sessionStorage";
  const sessionStorage = await mysql.query(query);
  console.log(userId);
  res.send(userId);
});

app.get("/", (req, res) => {
  // TODO: add user
  return res.render("index");
});

app.post("/newroom", (req, res) => {
  const { title } = req.body;
  const roomId = req.sessionID + Date.now();
  const { rooms } = app.get("db");
  rooms.push({ title, roomId });

  // 채팅방 새로 생성시 홈에 있는 사람들에게 새로은 방 목록 전송
  // Q?: 본인은 왜 제외될까?
  // A!: 나는 현재 연결된 소켓이 없는상태임 home에서 newroom 으로 갈때 connection이 끊어지고
  //     redirect로 /chat/:roomId로 보내져야 chat.js에서 connection을 연결함
  app.get("wss").clients.forEach((client) => {
    if (client.location === "index" && client.readyState === client.OPEN)
      client.send(JSON.stringify(rooms));
  });
  return res.redirect(`/chat/${roomId}`);
});

app.get("/chat/:roomId", (req, res) => {
  const { title } = app
    .get("db")
    .rooms.find((room) => room.roomId === req.params.roomId);
  //res.locals는 응답 객체(res)의 속성으로, 해당 응답에 대한 로컬 변수를 설정하고 사용할 수 있게 해줌
  res.locals.title = title;
  //chat 파일을 렌더링하여 해당 파일에서 title 변수를 사용할 수 있음
  res.render("chat");
});

// Error Exeption
app.use((req, res, next) => {
  const notFoundError = new Error(`${req.method} ${req.url} NotFound`);
  notFoundError.status = 404;
  next(notFoundError);
});
app.use((err, req, res, next) => {
  res.locals.message = err.message;
  res.locals.error = process.env.NODE_ENV !== " production" ? err : {};
  res.status(err.status || 500).render("error");
});

const expressServer = app.listen(app.get("port"), () =>
  console.log("ws module server is running on port " + app.get("port"))
);

// socket
require("./socket")(expressServer, app);
