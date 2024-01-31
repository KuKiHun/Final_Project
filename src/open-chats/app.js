const express = require("express");
const session = require("express-session");
const cors = require("cors");

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
app.set("port", process.env.PORT || 3000);
app.set("views", __dirname + "/views");
app.set("view engine", "pug");
app.use("/public", express.static(__dirname + "/public"));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

const corsOptions = {
  origin: "http://your-client-domain:your-client-port",
  methods: "GET,HEAD,PUT,PATCH,POST,DELETE",
  credentials: true,
};

app.use(cors(corsOptions));

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

//************** 채팅 시작 **************/
app.set("dummyDb", { rooms: new Array() });

app.get("/", (req, res) => {
  // TODO: add user
  return res.render("index");
});

app.post("/", (req, res) => {
  // TODO: add user
  return res.render("index");
});

app.post("/newRoom", (req, res) => {
  const { title, auth, user } = req.body;
  const roomId = req.sessionID + Date.now();
  let totalCount = 0;
  const { rooms } = app.get("dummyDb");

  if (auth == 0) {
    totalCount += 1;
  }

  console.log("app.js / user :" + user);

  rooms.push({ title, roomId, totalCount });
  console.log("app.js / newRoom >>> title : " + title);

  const sql =
      "INSERT INTO chat(chat_type, chat_title, user_id, chat_created) VALUES(0, ?, ?, now())";
  const value = [title, user];

  const fs = require('fs').promises; // 프로미스 기반의 fs 모듈 사용

  const executeQuery = (sql, values) => {
    return new Promise((resolve, reject) => {
      conn.query(sql, values, (err, result, fields) => {
        if (err) {
          reject(err);
        } else {
          resolve(result);
        }
      });
    });
  };

  const saveChatHistory = async (title, user) => {
    try {
      const result = await executeQuery(sql, value);
      console.log(result);

      const getChatIdx = 'select * from chat where chat_title = ? and chatting_closed is null order by chat_idx desc limit 1';
      const chatResult = await executeQuery(getChatIdx, title);
      console.log(chatResult);
      const chat_idx = chatResult[0]['chat_idx'];
      console.log(`가져온 chat_idx : ${chat_idx}`);

      const getChatFolderPathQuery = "select * from system where system_name = 'chat_log'";
      const folderPathResult = await executeQuery(getChatFolderPathQuery);
      const chatLogPath = folderPathResult[0]['system_path'];
      console.log(chatLogPath);

      const today = new Date();
      const year = today.getFullYear();
      const month = String(today.getMonth() + 1).padStart(2, '0');
      const day = String(today.getDate()).padStart(2, '0');
      const dateInfo = `${year}${month}${day}`;

      const data = {
        created: today,
        user: user
      };
      const jsonData = JSON.stringify(data);
      const fileName = `${dateInfo}_${chat_idx}.json`;
      const filePath = `${chatLogPath}/${fileName}`;

      await fs.writeFile(filePath, jsonData, 'utf8');
      console.log('Json 파일이 생성되었습니다.');

      const insert_chat_history_sql = 'insert into chat_history (chat_history_file, chat_history_path, chat_idx) VALUES (?, ?, ?)';
      const insertValues = [fileName, chatLogPath, chat_idx];
      await executeQuery(insert_chat_history_sql, insertValues);
      console.log('DB에 chat_history 테이블과 연동되었습니다.');
    } catch (err) {
      console.error(err);
    }
  };

  saveChatHistory(title, user);


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
  const { user } = req.query;
  console.log("/chat/:roomId >>> user : " + user);
  const { title } = app
      .get("dummyDb")
      .rooms.find((room) => room.roomId === req.params.roomId);

  //res.locals는 응답 객체(res)의 속성으로, 해당 응답에 대한 로컬 변수를 설정하고 사용할 수 있게 해줌
  console.log("app.js/title :" + title);
  res.locals.title = title;

  const targetRoom = app
      .get("dummyDb")
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
  res.render("chat");
});

// let totalCount = 0;

app.post("/leave-room", (req, res) => {
  const { title, auth } = req.body;
  console.log("app.js/title :" + title);
  console.log("app.js/auth :" + auth);
  let { rooms } = app.get("dummyDb");
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

  return res.render("index", { rooms });
});

//************** 채팅 끝 **************/

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

  // 채팅방 새로 생성시 홈에 있는 사람들에게 새로은 방 목록 전송
  // Q?: 본인은 왜 제외될까?
  // A!: 나는 현재 연결된 소켓이 없는상태임 home에서 newroom 으로 갈때 connection이 끊어지고
  //     redirect로 /chat/:roomId로 보내져야 chat.js에서 connection을 연결함
  app.get("wss").clients.forEach((client) => {
    if (client.location === "videoIndex" && client.readyState === client.OPEN)
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
    console.log(`Listening on http://localhost:3000`)
);

// socket
require("./socket")(expressServer, app);