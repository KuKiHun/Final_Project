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
    if (req.url === "/videoIndex") {
      ws.location = "videoIndex";
      ws.send(JSON.stringify(app.get("dummyDb2").rooms));
    } else if (req.url.startsWith("/video/")) {
      ws.location = req.url.split("/")[2];
      console.log("socket >>> ws.location : " + ws.location);
      ws.on("message", (message) => {
        const data = JSON.parse(message);
        wss.clients.forEach((client) => {
          if (
            client !== ws &&
            client.readyState === ws.OPEN &&
            client.location === ws.location &&
            data.type === "enter"
          ) {
            const welcome = data.data;
            console.log("welcome *********************");
            console.log(welcome);
            client.send(JSON.stringify({ type: "enter", data: welcome }));
          } else if (
            client !== ws &&
            client.readyState === ws.OPEN &&
            client.location === ws.location &&
            data.type === "name"
          ) {
            const clientName = data.data;
            console.log("clientName ******************");
            console.log(clientName);
            client.send(JSON.stringify({ type: "name", data: clientName }));
          } else if (
            client !== ws &&
            client.readyState === ws.OPEN &&
            client.location === ws.location &&
            data.type === "offer"
          ) {
            const offerA = data.data;
            console.log("offerA ************************");
            console.log(offerA);
            client.send(JSON.stringify({ type: "offer", data: offerA }));
          } else if (
            client !== ws &&
            client.readyState === ws.OPEN &&
            client.location === ws.location &&
            data.type === "answer"
          ) {
            const answer = data.data;
            console.log("answer ************************");
            console.log(answer);
            client.send(JSON.stringify({ type: "answer", data: answer }));
          } else if (
            client !== ws &&
            client.readyState === ws.OPEN &&
            client.location === ws.location &&
            data.type === "ice"
          ) {
            const ice = data.data;
            console.log("ice ************************");
            console.log(ice);
            client.send(JSON.stringify({ type: "ice", data: ice }));
          } else if (
            client !== ws &&
            client.readyState === ws.OPEN &&
            client.location === ws.location &&
            data.type === "chat"
          ) {
            const message = data.data;
            console.log("message ************************");
            console.log(message);
            client.send(JSON.stringify({ type: "chat", data: message }));
          } else if (
            client !== ws &&
            client.readyState === ws.OPEN &&
            client.location === ws.location &&
            data.type === "delete"
          ) {
            const title = data.data;
            console.log("title ************************");
            console.log(title);
            client.send(JSON.stringify({ type: "delete", data: title }));
          }
        });
      });
    }

    ws.on("error", (error) => {
      console.error(error);
      app.locals.message = error.message;
      app.locals.error = process.env.NODE_ENV !== " production" ? error : {};
      app.render("error");
    });

    ws.on("close", () => console.log(`${req.url} connection close`));
  });
};
