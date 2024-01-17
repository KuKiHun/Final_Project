const chatBox = document.getElementById("chats");
const addChat = (message, didIsend) => {
  const row = document.createElement("div");
  row.classList.add("chat");
  row.classList.add(didIsend ? "mychat" : "yourchat");

  const text = document.createElement("div");
  text.classList.add("name");
  text.classList.add("text");
  text.innerHTML = lawyerName;
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

const pathname = window.location.pathname; // '/chat/:roomId'
const ws = new WebSocket(`ws://localhost:3000${pathname}`);
let name = 'mose';
ws.onopen = function () {
  console.log("chat connect!");
  $.ajax({
    url : `http://localhost:8080/lawyerConnect/${name}`,
    success : result =>{
      ws.send(`${result['lawyer_name']}님이 입장했습니다`);
    }
  })
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

let count = 0;
const deleteBtn = document.getElementById("deleteBtn");
let isDeleting = false; // 중복 클릭 여부를 나타내는 변수
deleteBtn.addEventListener("click", () => {
  const roomTitleInput = document.querySelector('input[name="title"]');
  const title = roomTitleInput.value;
  // alert("chat.js/title : " + title);

  count++;
  // alert("chat.js/count : " + count);

  fetch("/leave-room", {
    method: "POST",
    body: JSON.stringify({ title: title, count: count }),
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
