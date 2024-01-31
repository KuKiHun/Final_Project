jQuery(($) => {
  let auth;
  window.addEventListener("message", function (event) {
    // console.log("child window");
    console.log("event.data : " + event.data);
    $.ajax({
      url: event.data,
      success: (result) => {
        // const parent_data = event.data;
        auth = result["auth_idx"];
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
      },
    });
  });

  $(".new").on("click", function (e) {
    const authInput = document.querySelector("input[name='auth']");
    const auth = authInput.value;
    // alert(auth);
    if (auth == 1) {
      e.preventDefault();
      alert("의뢰인만 가능한 기능입니다.");
      $("#block").innerText = "";
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
    form.action = `/video/${roomId}`;
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

const ws = new WebSocket("ws://localhost:3001/videoIndex");
ws.onopen = function () {
  console.log("rooms connect!");
};

ws.onmessage = function (event) {
  console.log(`rooms connection sent message: ${event.data}`);
  const rooms = JSON.parse(event.data);

  drawRooms(rooms);
};
