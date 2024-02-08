$(document).ready(function () {
  let userdata = $("#auth_check").val().trim().split(" ");
  // alert("userdata : " + userdata);
  let id = userdata[0];
  let auth = userdata[1] === "회원님" ? 0 : 1;
  console.log(`id : ${id} / auth : ${auth}`);
  const auth_list = ["userConnect", "lawyerConnect"];

  if (id != null) {
    () => {
      //contentWindow : 내부 프레임에 접근 가능(프레임간 통신 가능)
      var iframe = document.getElementById("video").contentWindow;
      //postMessage : 메시지를 해당 프레임으로 전송
      iframe.postMessage(
        {
          message: `http://localhost:8080/videoIndex/${auth_list[auth]}/${id}`,
        },
        "http://localhost:3001"
      );
    };
    let userdata = `http://localhost:8080/videoIndex/${auth_list[auth]}/${id}`;
    //userdata : 전송하려는 데이터, * : 어떤 출처에도 메세지 수신 가능
    document.getElementById("video").contentWindow.postMessage(userdata, "*");
  }
});
