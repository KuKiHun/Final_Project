const ws = require("ws");

//module.exports : 모듈을 내보내는 데 사용되는 특수한 객체
//다른 파일에서 해당 모듈을 가져와 사용 가능(require() 이용)
module.exports = (server, app) => {
  //ws 모듈의 Server 클래스(WebSocket 서버를 생성하고 관리)를 사용하여 WebSocket 서버를 생성하는 구문
  const wss = new ws.Server({ server });
  // for sending a rooms data when a new room is created
  // used at app.post('newroom') on app.js
  app.set("wss", wss);

  // Backend에서 socket을 사용할 준비 완료
  wss.on("connection", (ws, req) => {
    console.log("WebSocket connected to: " + req.url);
    if (req.url === "/rooms") {
      ws.location = "index";
      // get a data when into index
      ws.send(JSON.stringify(app.get("dummyDb").rooms));
    } else if (req.url.startsWith("/chat/")) {
      ws.location = req.url.split("/")[2];
      ws.on("message", (message) => {
        // send message to open sockets in my room without me
        //클라이언트가 현재 메시지를 보낸 클라이언트(ws)와 같지 않고,
        //상태가 OPEN인 경우, 그리고 같은 방(location)에 있는 경우에만 메세지 전송
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
    } else if (req.url === "/videoIndex") {
      ws.location = "videoIndex";
      ws.send(JSON.stringify(app.get("dummyDb2").rooms));
    } else if (req.url.startsWith("/video/")) {
      ws.location = req.url.split("/")[2];
      console.log("socket >>> ws.location : " + ws.location);
      ws.on("message", (message) => {
        // send message to open sockets in my room without me
        //클라이언트가 현재 메시지를 보낸 클라이언트(ws)와 같지 않고,
        //상태가 OPEN인 경우, 그리고 같은 방(location)에 있는 경우에만 메세지 전송
        wss.clients.forEach((client) => {
          if (
            client !== ws &&
            client.readyState === ws.OPEN &&
            client.location === ws.location
          ) {
            client.send(message.toString());
          }
          // send message to
          // open sockets (client.readyState === ws.OPEN)
          // in my room (client.roomId === ws.roomId)
          // without me (client !== ws)
        });
      });
    }

    ws.on("createRoom", (roomId, userA) => {
      console.log("Joining Room(171) : ", roomId);
      ws.to(roomId).send("userConnected", roomId, userA);
    });

    ws.on("error", (error) => {
      console.error(error);
      app.locals.message = error.message;
      app.locals.error = process.env.NODE_ENV !== " production" ? error : {};
      app.render("error");
    });

    ws.on("close", () => console.log(`${req.url} connection close`));
  });
};
