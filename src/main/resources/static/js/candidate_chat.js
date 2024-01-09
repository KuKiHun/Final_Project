$(document).ready(function () {});

//참가버튼을 눌렀을 때
function joinRoom() {
  var roomNameValue = $(".roomName").text();
  //encodeURIComponent : uri 구성요소를 안전하게 인코딩하기 위해 사용
  var url = "candidate_chat?roomName=" + encodeURIComponent(roomNameValue);
  window.location.href = url;
}
