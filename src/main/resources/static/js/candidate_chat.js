$(document).ready(function () {});

//방 생성버튼 눌렀을 때
function userGenerateTokenAndRedirect() {
  //입력된 방 이름 가져오기
  var chat_title = $("#roomName").val();
  console.log("roomName : " + chat_title);
  alert("roomName : " + chat_title);

  //기존 토큰에서 아이디와 이름 추출
  var existingToken = getAccessToken();
  var existingTokenData = parseExistingToken(existingToken);
  var user_id = existingTokenData.user_id;
  var user_name = existingTokenData.user_name;
  var auth_idx = existingTokenData.auth_idx;

  //토큰 생성 및 리다이렉트
  generateToken(chat_title, user_id, user_name, auth_idx, function (token) {
    redirectWithToken(token);
  });
}

//참가버튼 눌렀을 때
function lawyerGenerateTokenAndRedirect() {
  //입력된 방 이름 가져오기
  var chat_title = $(".roomName").text();
  console.log("roomName : " + chat_title);
  alert("roomName : " + chat_title);

  //기존 토큰에서 아이디와 이름 추출
  var existingToken = getAccessToken();
  console.log("existingToken : " + existingToken);
  var existingTokenData = parseExistingToken(existingToken);
  var user_id = existingTokenData.user_id;
  var user_name = existingTokenData.user_name;
  var auth_idx = existingTokenData.auth_idx;

  //토큰 생성 및 리다이렉트
  generateToken(chat_title, user_id, user_name, auth_idx, function (token) {
    redirectWithToken(token);
  });
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

function redirectWithToken(token) {
  // 토큰을 쿼리 매개변수로 추가하여 리다이렉트
  //encodeURIComponent : uri 구성요소를 안전하게 인코딩하기 위해 사용
  var redirectUrl =
    "candidate_chat?token=" + encodeURIComponent(token.chat_title);
  alert(redirectUrl);
  window.location.href = redirectUrl;
}
