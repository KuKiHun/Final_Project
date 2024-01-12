const roomList = document.getElementById("room_list");
const drawRooms = (rooms) => {
  roomList.innerHTML = "";
  // reduce()는 배열의 각 요소에 대해 주어진 콜백 함수를 실행하고, 하나의 결과값을 반환
  rooms.reduce((tbody, { title, roomId }) => {
    console.log(tbody);
    const tr = document.createElement("tr");
    const tdTitle = document.createElement("td");
    tdTitle.innerText = title;
    const tdJoin = document.createElement("td");
    const form = document.createElement("form");
    form.action = `/chat/${roomId}`;
    form.method = "get";
    const button = document.createElement("button");
    button.type = "submit";
    button.innerText = "Join";
    button.id = "btn";

    form.appendChild(button);
    tdJoin.appendChild(form);
    tr.append(tdTitle, tdJoin);
    tbody.appendChild(tr);
    return tbody;
  }, roomList);
};

const buttons = document.querySelectorAll("button");

buttons.forEach((button) => {
  //버튼이 클릭되었는지 여부를 저장하는 변수
  let clicked = false;

  button.addEventListener("click", () => {
    if (!clicked) {
      const input = button.parentNode.querySelector("input");
      if (input) {
        //입력필드를 읽기 전용으로 설전
        input.readOnly = true;
      }
      //버튼이 클릭되었음을 표시
      clicked = ture;
    }
  });
});

const ws = new WebSocket("ws://localhost:8003/rooms");
ws.onopen = function () {
  console.log("rooms connect!");
};
ws.onmessage = function (event) {
  console.log(`rooms connection sent message: ${event.data}`);
  const rooms = JSON.parse(event.data);
  console.log(rooms);
  drawRooms(rooms);
};
