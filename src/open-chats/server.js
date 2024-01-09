// http import 하기
import http from "http";
// ws import 하기
// import WebSocket from "ws";
import SocketIO from "socket.io";
import express from "express";
import { emit } from "process";

const jwt = require("jsonwebtoken");

const app = express();

// Pug로 view engine을 설정
app.set("view engine", "pug");

// views 디렉토리 입력
app.set("views", __dirname + "/views");

// 유저가 /public 으로 가게되면 __ dirname + "/public" 폴더 보여줌
app.use("/public", express.static(__dirname + "/public"));

// home.pug를 render해주는 route handler를 생성 -> home.pug로 화면 전환
app.get("/", (req, res) => res.render("home"));

// 유저가 어떤 url로 이동하던지 홈으로 돌려보내는 코드
app.get("/*", (req, res) => res.redirect("/"));

//스프링으로부터 토큰을 받은 후 필요한 정보 추출
const token = "tokenWithUserIdAndName";
console.log("token : " + token);
const secretKey = "secret_key_chat_token";

try {
  const decoded = jwt.verify(token, secretKey);
  console.log(decoded);
  const userName = decoded.userName;
  const roomName = decoded.roomName;
  console.log("userName : " + userName);
  console.log("roomName : " + roomName);
} catch (error) {
  console.error("토큰 검증 실패:", error.message);
}

//app.js로 값 전달
module.exports = {
  userName: userName,
  roomName: roomName,
};

const handleListen = () => console.log(`Listening on http://localhost:3000`);

const httpServer = http.createServer(app);
const wsServer = SocketIO(httpServer);

// Backend에서 socket을 사용할 준비 완료
wsServer.on("connection", (socket) => {
  // middleware -> 어떤 event에서든지 console.log를 할 수 있다(socket에 있는 모든 event를 확인가능)
  socket.onAny((event) => {
    console.log(`Socket event : ${event}`);
  });
  // frontend와 동일하게 원하는 이름으로 지정 가능 -> 단, frontend와 동일한 이름이어야 한다.
  // done은 frontend의 익명함수를 의미 -> 서버는 backend에서 함수를 호출, 함수는 frontend에서 실행
  socket.on("enter_room", (roomName, nickname, done) => {
    //닉네임 저장하기
    socket["nickname"] = nickname;
    // 방에 참가하는 코드 => socket.join 사용
    socket.join(roomName);
    //app.js에 있는 showRoom() 실행
    done();
    //"welcome" 이벤트를 방 안에 있는 모든 사람에게 emit -> 나를 제외한 socket에 전송
    socket.to(roomName).emit("welcome", socket.nickname);
  });

  // 방과 연결 종료
  socket.on("disconnecting", () => {
    // 클라이언트가 서버와 연결이 끊어지기 전에 "bye" message 전송
    // socket.rooms({방 id, 방이름}) => 중복되는 요소가 없는 배열인 set -> 그레서 forEach 사용 가능
    socket.rooms.forEach((room) =>
      socket.to(room).emit("bye", socket.nickname)
    );
  });

  // 메세지 보내기
  // roomName을 통해 어떤 방으로 메세지를 보내야 하는지 알 수 있음
  socket.on("new_message", (msg, roomName, done) => {
    socket.to(roomName).emit("new_message", `${socket["nickname"]} : ${msg}`);
    // done()을 호츨하면 app.js에 있는 handleMessageSubmit() 안의 익명 함수를 실행
    done();
  });
});

httpServer.listen(3000, handleListen);
