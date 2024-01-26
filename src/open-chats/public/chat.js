jQuery(($) => {
  let name;
  let id;
  let auth = sessionStorage.getItem("auth_idx");
  let auth_level = ["님", "변호사님"];

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
        url: `http://localhost:8080/lawyerConnect/${id}`,
        success: (result) => {
          ws.send(`[enter]${result["lawyer_name"]} 님이 입장했습니다`);
          // $('#title_lawyername').text($('#title_lawyername').text()+result['lawyer_name'])
        },
      });
    }
  };

  ws.onmessage = function (event) {
    let message = event.data;
    if (message.substr(0, 7) === "[enter]") {
      // 의뢰인 페이지의 변호사 이름 지정
      $("h3#title_lawyername").text(
        `변호사 : ${message.split(" ")[0].substr(7)}`
      );
      message = message.substr(7);
      ws.send(`[client] ${name}`);
    } else if (message.substr(0, 8) === "[client]") {
      // 변호사 페이지 의뢰인 이름 지정
      $("h3#title_username").text(`의뢰인 : ${message.substr(8)}`);
      return;
    }
    // $('h3#title_lawyername').text("변호사 : "+)

    console.log("chat connection message: " + message);
    if (auth == 0) {
      console.log(`유저 아이디 : ${id}`);
    } else if (auth == 1) {
      console.log(`변호사 아이디 : ${id}`);
    }
    addChat(message, false);
  };

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
    ws.send(message);
    input.value = "";
    addChat(message, true);
  });

  let count = 0;
  const deleteBtn = document.getElementById("deleteBtn");
  deleteBtn.addEventListener("click", () => {
    const roomTitleInput = document.querySelector('input[name="title"]');
    const title = roomTitleInput.value;

    let message = `${name}님이 퇴장했습니다.`;
    addChat(message, true);

    console.log("deleteBtn >>> name : " + name);

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
        }
      })
      .catch((error) => {
        console.error("방 삭제 실패:", error);
      });
  });
});
