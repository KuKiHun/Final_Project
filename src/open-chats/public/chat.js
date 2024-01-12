const chatBox = document.getElementById("chats");
const addChat = (message, didIsend) => {
  const row = document.createElement("div");
  row.classList.add("chat");
  row.classList.add(didIsend ? "mychat" : "yourchat");
  const text = document.createElement("div");
  text.classList.add("text");
  text.innerText = message;
  row.append(text);
  chatBox.append(row);
  chatBox.scrollTop = chatBox.scrollHeight;
};

const pathname = window.location.pathname; // '/chat/:roomId'
const ws = new WebSocket(`ws://localhost:8003/${pathname}`);
ws.onopen = function () {
  console.log("chat connect!");

  const enterMessage = `입장했습니다`;
  ws.send(enterMessage);
};

ws.onmessage = function (event) {
  const message = event.data;
  console.log("chat connection message: " + message);
  addChat(message, false);
};

const type = document.getElementById("type");
const input = type.childNodes[0];
type.addEventListener("submit", (e) => {
  e.preventDefault();
  const message = input.value;
  ws.send(message);
  input.value = "";
  addChat(message, true);
});

ws.onclose = function () {
  const outMessage = `퇴장했습니다.`;
  ws.send(outMessage);
};

// function showAlert() {
//   alert("방에서 나가사겠습니까?");
// }

const deleteBtn = document.getElementById("deleteBtn");
deleteBtn.addEventListener("click", () => {
  const roomId = "<%= roomId %>";
  const deleteRooms = "true";
  const formData = new FormData();
  formData.append("roomId", roomId);
  formData.append("deleteRooms", deleteRooms);

  fetch("/", {
    method: "POST",
    body: formData,
  })
    .then((response) => {
      if (response.ok) {
        // 삭제 성공 시 홈으로 이동
        window.location.href = "/";
      } else {
        // 삭제 실패 시 오류 처리
        console.error("방 삭제 실패");
      }
    })
    .catch((error) => {
      console.error("방 삭제 실패:", error);
    });
});
