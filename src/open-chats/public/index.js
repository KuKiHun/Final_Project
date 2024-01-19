jQuery(($ =>{
  window.parent.postMessage({hello : "parent"}, '*');
  window.parent.localStorage.getItem('url');
}))


window.addEventListener('message', function (event){
  console.log("child window");
  console.log(event.data)
  $.ajax({
    url : event.data,
    success : result => {
      // const parent_data = event.data;
      $("input#user").val(result['user_name']);
    }
  })
})

const roomList = document.getElementById("room_list");

const drawRooms = (rooms) => {
  roomList.innerHTML = "";
  // reduce()는 배열의 '각 요소'에 대해 주어진 콜백 함수를 실행하고, 하나의 결과값을 반환
  rooms.reduce((tbody, { title, roomId }) => {
    const tr = document.createElement("tr");
    const tdTitle = document.createElement("td");
    tdTitle.innerText = title;
    const tdJoin = document.createElement("td");
    const form = document.createElement("form");
    form.action = `/chat/${roomId}`;
    form.method = "get";
    const button = document.createElement("button");
    button.type = "submit";
    button.innerText = "참여하기";
    button.id = "btn";
    button.class = "join"

    form.appendChild(button);
    tdJoin.appendChild(form);
    tr.append(tdTitle, tdJoin);
    tbody.appendChild(tr);
    return tbody;
  }, roomList);
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
  window.addEventListener('message', event => {
    if(event.origin !== 'http://localhost:8080') return;

    console.log('receive message : '+event.data);

    $.ajax({
      url : event.data,
      success : result =>{
        console.log("openchat success")
        console.log("lawyer_name : "+result['lawyer_id'])
        console.log("lawyer_name : "+result['auth_idx'])
        console.log("lawyer_name : "+result['lawyer_name'])
      }
    })
  })
};

ws.onmessage = function (event) {
  console.log(`rooms connection sent message: ${event.data}`);
  const rooms = JSON.parse(event.data);
  drawRooms(rooms);
};

// console.log("session -> user_id : "+sessionStorage.getItem("user_id"));
// console.log("session -> lawyer_id : "+sessionStorage.getItem("lawyer_id"));

// if ($('h2#auth_check').val().split(' ')[-1] ==='회원님'){
//   $('form > button').attr('disabled', true);
// }

