jQuery(($) => {
  window.parent.postMessage({ hello: "parent" }, "*");
  window.parent.localStorage.getItem("url");
});

window.addEventListener("message", function (event) {
  console.log("child window");
  console.log(event.data);
  $.ajax({
    url: event.data,
    success: (result) => {
      // const parent_data = event.data;
      $("input#user").val(result["user_name"]);
    },
  });
});

const roomList = document.getElementById("room_list");
const drawRooms = (rooms) => {
  //기존의 방 목록 비우기
  roomList.innerHTML = "";
  // reduce()는 배열의 '각 요소'에 대해 주어진 콜백 함수를 실행하고, 하나의 결과값을 반환
  rooms.reduce((tbody, { title, roomId }) => {
    //새로운 <tr> 엘리먼트 생성
    const tr = document.createElement("tr");

    //방 제목을 담은 <td> 엘리먼트 생성
    const tdTitle = document.createElement("td");
    tdTitle.innerText = title;

    //참여하기 버튼을 담은 <td> 엘리먼트 생성
    const tdJoin = document.createElement("td");
    const form = document.createElement("form");
    form.action = `/chat/${roomId}`;
    form.method = "get";
    const button = document.createElement("button");
    button.type = "submit";
    button.innerText = "참여하기";
    button.id = "btn";
    button.class = "join";

    //버튼을 폼에 추가하고 폼을 <td>에 추가
    form.appendChild(button);
    tdJoin.appendChild(form);

    //<tr>에 <td>들을 추가
    tr.append(tdTitle, tdJoin);

    //<tr>을 테이블의 tbody에 추가
    tbody.appendChild(tr);

    // 최종적으로 업데이트된 tbody를 반환
    return tbody;
  }, roomList);

  console.log(roomList);
  // console.log(roomList);
};

// window.addEventListener('message', event => {
//   if(event.origin !== 'http://localhost:8080') return;
//   console.log("event data : "+event.data)
// }, false);

const buttons = document.getElementById("btn");

//Array.from(buttons) :  유사 배열 객체를 JavaScript 배열로 변환
// Array.from(buttons).forEach((button) => {
//   button.addEventListener("click", () => {
//     // if (auth_idx === 1) {
//     //버튼을 클릭할 때 버튼을 비활성화(disabled) 상태로 설정
//     button.disabled = ture;
//     // } else {
//     //   alert("변호사만 참여가 가능합니다.");
//     // }
//   });
// });

const ws = new WebSocket("ws://localhost:3000/rooms");
ws.onopen = function () {
  console.log("rooms connect!");
  window.addEventListener("message", (event) => {
    if (event.origin !== "http://localhost:8080") return;

    console.log("receive message : " + event.data);

    $.ajax({
      url: event.data,
      success: (result) => {
        console.log("openchat success");
        console.log("lawyer_name : " + result["lawyer_id"]);
        console.log("lawyer_name : " + result["auth_idx"]);
        console.log("lawyer_name : " + result["lawyer_name"]);
      },
    });
  });
};

ws.onmessage = function (event) {
  console.log(`rooms connection sent message: ${event.data}`);
  const rooms = JSON.parse(event.data);
  console.log(rooms);
  drawRooms(rooms);
};

// console.log("session -> user_id : "+sessionStorage.getItem("user_id"));
// console.log("session -> lawyer_id : "+sessionStorage.getItem("lawyer_id"));

// if ($('h2#auth_check').val().split(' ')[-1] ==='회원님'){
//   $('form > button').attr('disabled', true);
// }
