$(document).ready(function () {
  // const lawyerId = encodeURIComponent($("#lawyer_id").val());
  // const lawyerName = encodeURIComponent($("#lawyer_name").val());
  // const authIdx = encodeURIComponent($("#auth_idx").val());
  // const userId = encodeURIComponent($("#user_id").val());
  // const userName = encodeURIComponent($("#user_name").val());

  // const lawyerId = $("#lawyer_id").val();
  // const lawyerName = $("#lawyer_name").val();
  // const authIdx = $("#auth_idx").val();
  // const userId = $("#user_id").val();
  // const userName = $("#user_name").val();

  let userdata = $("#auth_check").text().trim().split(" ");
  // alert("userdata : " + userdata);
  let id = userdata[0];
  let auth = userdata[1] === "회원님" ? 0 : 1;
  console.log(`id : ${id} / auth : ${auth}`);
  const auth_list = ["userConnect", "lawyerConnect"];

  if (id != null) {
    () => {
      //contentWindow : 내부 프레임에 접근 가능(프레임간 통신 가능)
      var iframe = document.getElementById("chat").contentWindow;
      //postMessage : 메시지를 해당 프레임으로 전송
      iframe.postMessage(
        { message: `http://localhost:8080/${auth_list[auth]}/${id}` },
        "http://localhost:3000"
      );
    };
    let userdata = `http://localhost:8080/${auth_list[auth]}/${id}`;
    // localStorage.setItem('url', userdata);
    //userdata : 전송하려는 데이터, * : 어떤 출처에도 메세지 수신 가능
    document.getElementById("chat").contentWindow.postMessage(userdata, "*");
  }
});

//방 생성버튼 눌렀을 때
function userGenerateTokenAndRedirect() {
  // 입력된 방 이름 가져오기
  var chat_title = $("#roomName").val();
  console.log("chat_title : " + chat_title);

  // 기존 토큰에서 아이디와 이름 추출
  var existingToken = getAccessToken();
  var existingTokenData = parseExistingToken(existingToken);

  generateTokenAndRedirect(chat_title, existingTokenData);
}

function generateTokenAndRedirect(chat_title, existingTokenData) {
  // if (
  //   existingTokenData.user_id === undefined ||
  //   existingTokenData.user_name === undefined ||
  //   existingTokenData.auth_idx === undefined
  // ) {
  //   alert("로그인이 필요합니다.");
  // } else {
  var user_id = existingTokenData.user_id;
  var user_name = existingTokenData.user_name;
  var auth_idx = existingTokenData.auth_idx;

  //토큰 생성 및 리다이렉트
  generateToken(chat_title, user_id, user_name, auth_idx, function (token) {
    redirectWithToken(chat_title, token);
    // window.location.href = "/follaw/candidate_chat/" + chat_title;
  });
}

//참가버튼 눌렀을 때
function lawyerGenerateTokenAndRedirect(button) {
  //클릭된 버튼 요소를 변수에 저장
  var clickedButton = $(button);

  //입력된 방 이름 가져오기
  var chat_title = clickedButton
    .closest(".twm-jobs-grid-style1")
    .find(".roomName")
    .text()
    .trim();
  console.log("chat_title : " + chat_title);

  //기존 토큰에서 아이디와 이름 추출
  var existingToken = getAccessToken();
  var existingTokenData = parseExistingToken(existingToken);

  generateTokenAndRedirect(chat_title, existingTokenData);
}

function getAccessToken() {
  // "Authorization" 헤더에서 토큰을 가져오는 로직 작성
  var headers = new Headers();
  var authorizationHeader = headers.get("Authorization");

  //헤더에서 토큰 파싱
  var token = ""; //토큰 저장할 변수
  if (authorizationHeader && authorizationHeader.startsWith("Bearer ")) {
    token = authorizationHeader.substring(7);
  }

  return token;
}

function parseExistingToken(existingToken) {
  // 기존 토큰에서 아이디와 이름을 추출하는 로직 작성
  // 실제로는 토큰을 해석하여 필요한 정보를 추출해야 합니다.
  var user_id = existingToken.user_id;
  var user_name = existingToken.user_name;
  var auth_idx = existingToken.auth_idx;
  return {
    user_id: user_id,
    user_name: user_name,
    auth_idx: auth_idx,
  };
}

function generateToken(chat_title, user_id, user_name, auth_idx, callback) {
  //AJAX 요청을 사용하여 서버에서 토큰 생성
  //여기에 토큰 생성을 위한 서버 요청 코드 작성
  console.log("chat_title : " + chat_title);
  console.log("user_id : " + user_id);
  console.log("user_name : " + user_name);
  console.log("auth_idx : " + auth_idx);

  alert("chat_title : " + chat_title);
  alert("user_id : " + user_id);
  alert("user_name : " + user_name);
  alert("auth_idx : " + auth_idx);

  $.ajax({
    url: "../follaw/createToken",
    type: "post",
    contentType: "application/json", // JSON 형식으로 데이터 전송
    data: JSON.stringify({
      user_id: user_id,
      user_name: user_name,
      chat_title: chat_title,
      auth_idx: auth_idx,
    }),
    success: function (data) {
      console.log(data);
      // 서버에서 생성된 토큰을 콜백 함수로 전달
      callback(data);
    },
    error: function (data) {
      console.log("error");
    },
  });
}

function redirectWithToken(chat_title, token) {
  // 토큰을 쿼리 매개변수로 추가하여 리다이렉트
  var redirectUrl = "candidate_chat?roomName=" + encodeURIComponent(chat_title);
  alert("redirectUrl :" + redirectUrl);
  console.log("redirectUrl :" + redirectUrl);
  window.location.href = redirectUrl;
}
