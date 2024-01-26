jQuery(($) => {
  let auth;
  window.addEventListener("message", function (event) {
    // console.log("child window");
    console.log("event.data : " + event.data);
    $.ajax({
      url: event.data,
      success: (result) => {
        // const parent_data = event.data;
        console.log("result : " + result);
        auth = result["auth_idx"];
        console.log(auth);
        if (auth == 0) {
          //sessionStorage : 세션동안 데이터 저장(브라우저나 탭을 닫으면 데이터 삭제)
          //localStorage : 데이터를 영구적으로 저장
          sessionStorage.setItem("user_name", result["user_name"]);
          sessionStorage.setItem("user_id", result["user_id"]);
          sessionStorage.setItem("auth_idx", result["auth_idx"]);
          $("input#user").val(result["user_name"]);
          $("input#auth").val(result["auth_idx"]);
          $("input.userId").val(result["user_id"]);
        } else if (auth == 1) {
          sessionStorage.setItem("lawyer_name", result["lawyer_name"]);
          sessionStorage.setItem("lawyer_id", result["lawyer_id"]);
          sessionStorage.setItem("auth_idx", result["auth_idx"]);
          $("input#user").val(result["lawyer_name"]);
          $("input#auth").val(result["auth_idx"]);
          $("input.userId").val(result["lawyer_id"]);
        }

        /*if (result['user_name'] != null){
          let user_name = sessionStorage.getItem('user_name');
          let user_id = sessionStorage.getItem('user_id');
          let auth_idx = sessionStorage.getItem('auth_idx');
          console.log(`line 24 : ${user_name} / ${user_id} / ${auth_idx}`)
        } else if(result['lawyer_name'] != null){
          sessionStorage.getItem('lawyer_name');
          sessionStorage.getItem('lawyer_id');
          sessionStorage.getItem('auth_idx');
        }*/
      },
    });
    /*    let auth = sessionStorage.getItem('auth_idx')

    if (auth == 0){
      let user_name = sessionStorage.getItem('user_name');
      let user_id = sessionStorage.getItem('user_id');
      console.log(`line 37 : ${user_name} / ${user_id} / 일반 유저`)
    } else if(auth == 1){
      let lawyer_name = sessionStorage.getItem('lawyer_name');
      let lawyer_id = sessionStorage.getItem('lawyer_id');
      console.log(`${lawyer_name} / ${lawyer_id} / 변호사 유저`)
    }*/
  });

  $(".new").on("click", function (e) {
    const authInput = document.querySelector("input[name='auth']");
    const auth = authInput.value;
    // alert(auth);
    if (auth == 1) {
      e.preventDefault();
      alert("의뢰인만 가능한 기능입니다.");
      // const input = document.querySelector("input[name='title']");
      $("#block").innerText = "";
      // input.innertext = "";
      // return false;
    }
  });

  $("#room_list").on("click", ".join", function (e) {
    // alert(auth);
    if (auth == 0) {
      e.preventDefault();
      alert("변호사만 가능한 기능입니다.");
    }
  });
});

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
    const input = document.createElement("input");
    input.setAttribute("type", "hidden");
    input.setAttribute("name", "user");
    input.setAttribute("class", "userId");
    const button = document.createElement("button");
    button.type = "submit";
    button.innerText = "참여하기";
    button.setAttribute("class", "join");
    button.setAttribute("id", "btn");

    form.appendChild(button);
    form.appendChild(input);
    tdJoin.appendChild(form);
    tr.append(tdTitle, tdJoin);
    tbody.appendChild(tr);
    return tbody;
  }, roomList);
};

//Array.from(buttons) :  유사 배열 객체를 JavaScript 배열로 변환
// Array.from(buttons).forEach((button) => {
//   button.addEventListener("click", () => {
//     alert("111");
//     if (auth === 1) {
//       //버튼을 클릭할 때 버튼을 비활성화(disabled) 상태로 설정
//       button.disabled = ture;
//     } else {
//       alert("변호사만 참여가 가능합니다.");
//     }
//   });
// });

const ws = new WebSocket("ws://localhost:3000/rooms");
ws.onopen = function () {
  console.log("rooms connect!");
  /*  window.addEventListener('message', event => {
      if(event.origin !== 'http://localhost:8080') return;

      console.log('receive message : '+event.data);

      $.ajax({
        url : event.data,
        success : result =>{
          console.log("openchat success");
          console.log("lawyer_id : "+result['lawyer_id']);
          console.log("auth_idx : "+result['auth_idx']);
          console.log("lawyer_name : "+result['lawyer_name']);
        }
      })
    })*/
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
