const ws = require("ws");

//모듈을 내보내는 데 사용되는 특수한 객체
//다른 파일에서 해당 모듈을 가져와 사용 가능(require() 이용)
module.exports = (server, app) => {
  //ws 모듈의 Server 클래스(WebSocket 서버를 생성하고 관리)를 사용하여 WebSocket 서버를 생성하는 구문
  const wss = new ws.Server({ server });
  // for sending a rooms data when a new room is created
  // used at app.post('newroom') on app.js
  app.set("wss", wss);

  // Backend에서 socket을 사용할 준비 완료
  wss.on("connection", (ws, req) => {
    if (req.url === "/rooms") {
      ws.location = "index";
      // get a data when into index
      ws.send(JSON.stringify(app.get("dummyDb").rooms));
    } else if (req.url.startsWith("/chat/")) {
      ws.location = req.url.split("/")[2];
      ws.on("message", (message) => {
        // send message to open sockets in my room without me
        //현재 반복 중인 클라이언트가 현재 메시지를 보낸 클라이언트(ws)와 같지 않고,
        //상태가 OPEN인 경우, 그리고 같은 방(location)에 있는 경우에만 조건이 참
        wss.clients.forEach((client) => {
          if (
            client !== ws &&
            client.readyState === ws.OPEN &&
            client.location === ws.location
          )
            client.send(message.toString());
          // send message to
          // open sockets (client.readyState === ws.OPEN)
          // in my room (client.roomId === ws.roomId)
          // without me (client !== ws)
        });
      });
    }
    // else if (req.url.startsWith("http://localhost:8080/lawyerConnect/")) {
    //   ws.on("message", (message) => {
    //     // 서버로부터 메시지를 받았을 때의 처리
    //     console.log("Received message from client:", message);

    //     // 서버에서 클라이언트로 데이터 전송
    //     const dataToSend = {
    //       lawyerId: req.url.split("/")[1],
    //       lawyerName: req.url.split("/")[2],
    //       authIdx: req.url.split("/")[3],
    //     };

    //     ws.send(JSON.stringify(dataToSend));
    //   });
    // }

    ws.on("error", (error) => {
      console.error(error);
      app.locals.message = error.message;
      app.locals.error = process.env.NODE_ENV !== " production" ? error : {};
      app.render("error");
    });

    ws.on("close", () => console.log(`${req.url} connection close`));
  });
};
