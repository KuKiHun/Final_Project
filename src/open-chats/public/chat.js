jQuery(($) => {
  let name;
  let id;
  let auth = sessionStorage.getItem("auth_idx");
  let auth_level = ["님", "변호사님"];
  let fileName;
  let filePath;
  let roomCreated;
  let roomIdx;

  const pathname = window.location.pathname; // '/chat/:roomId'
  const ws = new WebSocket(`ws://localhost:3000${pathname}`);

  console.log("chat.js >> auth : " + auth);

  if (auth == 0) {
    name = sessionStorage.getItem("user_name");
    id = sessionStorage.getItem("user_id");
    $("#title_username").text(`의뢰인 : ${name}`);
    $("input#userId").val(`${id}`);
  } else if (auth == 1) {
    name = sessionStorage.getItem("lawyer_name");
    id = sessionStorage.getItem("lawyer_id");
    $("#title_lawyername").text(`변호사 : ${name}`);
    $("input#userId").val(`${id}`);
  }

  // if (auth == 0) {
  //   name = sessionStorage.getItem("user_name");
  //   id = sessionStorage.getItem("user_id");
  //   $("#title_username").text(`의뢰인 : ${name}(${id})`);
  //   $("input#userId").val(`${id}`);

  // db에서 파일 저장 경로 받아오기
  // var sql = "select * from chat where user_id = ? and lawyer_id = ?";
  // var userName = $("h3#title_username").text().split("(")[1];
  // var lawyerName = $("h3#title_lawyername").text().split("(")[1];
  // var value = [
  //   userName.substring(0, userName.length - 2),
  //   lawyerName.substring(0, lawyerName.length - 2),
  // ];

  // const executeQuery = (sql, values) => {
  //   return new Promise((resolve, reject) => {
  //     conn.query(sql, values, (err, result, fields) => {
  //       if (err) {
  //         reject(err);
  //       } else {
  //         resolve(result);
  //       }
  //     });
  //   });
  // };

  //   const getFilePath = async () => {
  //     try {
  //       const result = await executeQuery(sql, value);
  //       console.log(result[0]["chat_idx"]);
  //       roomIdx = result[0]["chat_idx"];
  //       roomCreated = result[0]["chat_created"]
  //         .split(" ")[0]
  //         .split("-")
  //         .join("");
  //       fileName = `${roomCreated}_${roomIdx}.json`;

  //       const filePathResult = await executeQuery(
  //         "select system_path from system where system_name = 'chat_log'"
  //       );
  //       filePath = filePathResult[0];
  //       console.log(filePath);
  //     } catch (err) {
  //       console.error(err);
  //     }
  //   };

  //   getFilePath();
  // } else if (auth == 1) {
  //   name = sessionStorage.getItem("lawyer_name");
  //   id = sessionStorage.getItem("lawyer_id");
  //   $("#title_lawyername").text(`변호사 : ${name}`);
  //   $("input#userId").val(`${id}`);
  // }

  // console.log(`${name}(${id}) ${auth_level[auth]}이 입장하셨습니다.`)

  const chatBox = document.getElementById("chats");
  const addChat = (message, didIsend) => {
    const row = document.createElement("div");
    row.classList.add("chat");
    row.classList.add(didIsend ? "mychat" : "yourchat");

    const text = document.createElement("div");
    text.classList.add("name");
    text.classList.add("text");
    // text.innerHTML = lawyerName;
    text.innerText = message;

    const today = new Date();
    const hours = ("0" + today.getHours()).slice(-2);
    const minutes = ("0" + today.getMinutes()).slice(-2);
    const timeString = `${hours}:${minutes}`;
    const time = document.createElement("div");
    time.classList.add("time");
    time.classList.add(didIsend ? "mychat" : "yourchat");
    time.innerText = timeString;

    row.append(text);
    chatBox.append(row);
    chatBox.append(time);
    chatBox.scrollTop = chatBox.scrollHeight;
  };

  // let name = 'mose';
  ws.onopen = function () {
    console.log("chat connect!");
    if (auth == 1) {
      $.ajax({
        url: `http://175.114.130.3:8080/lawyerConnect/${id}`,
        success: (result) => {
          const data = {
            type: "enter",
            data: `[enter]${result["lawyer_name"]} 님이 입장했습니다`,
          };
          ws.send(JSON.stringify(data));
        },
      });
    }
  };

  ws.onmessage = async function (event) {
    const data = JSON.parse(event.data);
    console.log("data");
    console.log(data);
    if (data.type === "enter") {
      const welcome = data.data;
      console.log(welcome);
      if (welcome.substr(0, 7) === "[enter]") {
        // 의뢰인 페이지의 변호사 이름 지정
        $("h3#title_lawyername").text(
          `변호사 : ${welcome.split(" ")[0].substr(7)}`
        );
        const lawyerName = welcome.substr(7);
        console.log(lawyerName);
        addChat(lawyerName, false);
        const userName = $("#title_username").text();
        ws.send(JSON.stringify({ type: "name", data: `[client] ${userName}` }));
      }
    } else if (data.type === "name") {
      const clientName = data.data;
      if (clientName.substr(0, 8) === "[client]") {
        // 변호사 페이지 의뢰인 이름 지정
        $("h3#title_username").text(`의뢰인 : ${clientName.substr(14)}`);
        return;
      }
    } else if (data.type === "chat") {
      const message = data.data;
      console.log(message);
      addChat(message, false);
    } else if (data.type === "delete") {
      console.log("delete >>>> ");
      setTimeout(function () {
        window.location.href = "/";
      }, 2000);
    }
  };
  // ws.onmessage = function (event) {
  //   let message = event.data;
  //   if (message.substr(0, 7) === "[enter]") {
  //     // 의뢰인 페이지의 변호사 이름 지정
  //     $("h3#title_lawyername").text(
  //       `변호사 : ${message.split(" ")[0].substr(7)}`
  //     );

  //     // 파일 생성 -> 변호사 참가 시간 기준으로 연월일시분초#의뢰인아이디.포탈#변호사아이디.포탈
  //     // #으로 3 값 연결, @ 대신 . 으로 연결

  //     message = message.substr(7);
  //     ws.send(`[client] ${name}`);
  //   } else if (message.substr(0, 8) === "[client]") {
  //     // 변호사 페이지 의뢰인 이름 지정
  //     $("h3#title_username").text(`의뢰인 : ${message.substr(8)}`);
  //     return;
  //   } else if (data.type === "delete") {
  //     console.log("delete >>>> ");
  //     setTimeout(function () {
  //       window.location.href = "/videoIndex";
  //     }, 2000);
  //   } else if (data.type === "chat") {
  //     const message = data.data;
  //     console.log(message);
  //     addChat(message, false);
  //   }

  // console.log("chat connection message: " + message);
  // if (auth == 0) {
  //   console.log(`유저 아이디 : ${id}`);
  // } else if (auth == 1) {
  //   console.log(`변호사 아이디 : ${id}`);
  // }
  // addChat(message, false);
  // };

  // ws.onclose = function (event) {
  //   let message = event.message;
  //   console.log(message);
  //   addChat(`${name}님이 퇴장했습니다.`);
  // };

  const type = document.getElementById("type");
  const input = type.childNodes[0];
  type.addEventListener("submit", (e) => {
    e.preventDefault();
    const message = input.value;
    ws.send(JSON.stringify({ type: "chat", data: message }));
    input.value = "";
    addChat(message, true);
  });

  const deleteBtn = document.getElementById("deleteBtn");
  deleteBtn.addEventListener("click", () => {
    const roomTitleInput = document.querySelector('input[name="title"]');
    const title = roomTitleInput.value;

    fetch("/leave-room", {
      method: "POST",
      body: JSON.stringify({ title: title, auth: auth }),
      headers: {
        "Content-Type": "application/json",
      },
    })
      .then((response) => {
        if (response.ok) {
          alert("메인화면으로 이동합니다.");

          if (auth == 0) {
            const message =
              "의뢰인이 퇴장했습니다. 잠시후 메인으로 이동합니다.";
            ws.send(JSON.stringify({ type: "chat", data: message }));
            addChat(message, false);
            // window.location.href = "/";
            ws.send(JSON.stringify({ type: "delete", data: title }));
          } else {
            const lawyerName = $("#title_lawyername").text().substr(6);
            const message = `${lawyerName} 님이 퇴장했습니다.`;
            ws.send(JSON.stringify({ type: "chat", data: message }));
            addChat(message, false);
            // window.location.href = "/";
          }
        }
      })
      .catch((error) => {
        console.error("방 삭제 실패:", error);
      });
  });
});
