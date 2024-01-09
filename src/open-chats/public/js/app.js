// frontend와 backend를 연결
const socket = io();

// home.pug에서 welcome 가져오기
const welcome = document.getElementById("welcome");
// welcome에서 form 가져오기
const form = welcome.querySelector("form#room");
const chat = document.getElementById("chat");

chat.hidden = true;

let roomName;

// 메세지를 많이 보낼테니 함수로 만들어 사용
function addMessage(message) {
  // chat에서 ul 가져오기
  const ul = chat.querySelector("ul");
  // li 요소 생성
  const li = document.createElement("li");
  // li에 message 지정하기
  li.innerText = message;
  // ul의 자식으로 li 붙이기
  ul.appendChild(li);
}

// 방에서 메세지를 보낼 때 수행되는 함수(각 form의 id에 기반해 input 가져옴)
function handleMessageSubmit(event) {
  event.preventDefault();
  const input = chat.querySelector("#msg input");
  const value = input.value;
  // server.js 로 이벤트(new_message)를 첫번째 인자인 input.value와 함께 보냄
  // roomName 은 어떤방으로 보내야 하는지 알려주는 변수
  // 마지막 인자는 server.js에서 실행시킬 수 있는 함수 작성 -> 자신의 대화창에 보낸 메세지가 보이도록 하는 함수
  socket.emit("new_message", input.value, roomName, () => {
    addMessage(`You : ${value}`);
  });
  input.value = "";
}

// 방에서 닉네임을 저장할 때 수행되는 함수(각 form의 id에 기반해 input 가져옴)
function handleNicknameSubmit(event) {
  event.preventDefault();
  const input = welcome.querySelector("#name input");
  const value = input.value;
  socket.emit("nickname", value);
  input.value = "";
}

// 방에 입장했을 때 수행되는 함수
function showRoom() {
  welcome.hidden = true;
  chat.hidden = false;
  const h3 = chat.querySelector("h3");
  h3.innerText = `Room ${roomName}`;

  // 메세지 보내기
  const msgForm = chat.querySelector("#msg");
  msgForm.addEventListener("submit", handleMessageSubmit);
}

// submit 클릭 시 수행하는 함수
function handleRoomSubmit(event) {
  event.preventDefault();
  // 닉네임 보내기
  const nickname = welcome.querySelector("#name input");
  // input 박스 내용 가져오기
  const input = form.querySelector("input");
  // socketIO에서는 정보를 보낼때 socket.emit() 함수 사용
  // [1] 항상 메세지를 보낼 필요 없이 특정한 어떤 이름이든 상관없이 emit 가능
  // [2] object 전송 가능(JSON.stringify / JSON.parser 사용 안해도 됨)
  socket.emit("enter_room", input.value, nickname, showRoom);
  roomName = input.value;
  // submit 클릭시 input 박스 내용 초기화
  nickname.value = "";
  input.value = "";
}

// submit 이벤트 생성
form.addEventListener("submit", handleRoomSubmit);

// 누군가가 방에 입장했을 때 출력되는 코드
socket.on("welcome", (user) => {
  // addmessage() 호출
  addMessage(`${user} arrived`);
});

// 누군가가 방에서 퇴장했을 때 출력되는 코드
socket.on("bye", (left) => {
  // addmessage() 호출
  addMessage(`${left} left`);
});

// 방에서 메세지를 보냈을 때 출력되는 코드
socket.on("new_message", (msg) => {
  // addmessage() 호출
  addMessage(msg);
  //(msg)=>{addMessage(msg);} = addMessage
});

//********************************** */
//토큰을 이용하여 방이름과 닉네임 추출 후 방 생성

//parseJwt : JWT를 분석하여 json데이터를 추출하는 역할(2번째 부분인 payload)
function parseJwt(token) {
  //주어진 JWT 토큰을 점(.)으로 분리하여 배열로 나눔 > 페이로드부분 선택
  const base64Url = token.split(".")[1];
  //페이로드에서 URL-safe Base64 형식을 일반 Base64 형식으로 변환(URL-safe Base64는 -을 +로, _를 /로 바꾸는 작업)
  const base64 = base64Url.replace(/-/g, "+").replace(/_/g, "/");
  //변환된 Base64 문자열을 디코딩하여 이진 데이터로 변환
  //이진 데이터를 UTF-8 형식으로 디코딩하고, 특수 문자를 정상적인 문자로 변환
  //변환된 문자열을 JSON.parse를 사용하여 JSON 객체로 파싱
  //JSON 객체를 반환
  const jsonPayload = decodeURIComponent(
    atob(decodeURIComponent(base64))
      .split("")
      .map((c) => "%" + ("00" + c.charCodeAt(0).toString(16)).slice(-2))
      .join("")
  );
  return JSON.parse(jsonPayload);
}

document.addEventListener("DOMContentLoaded", () => {
  const token = "tokenWithUserIdAndName";
  const decodedToken = parseJwt(token);
  const nicknameInput = document.querySelector("#name input");
  const roomNameInput = document.querySelector("#room input");

  roomNameInput.value = decodedToken.roomName;
  nicknameInput.value = decodedToken.userName;

  const enterRoomButton = document.querySelector("#room button");
  enterRoomButton.click();
});
