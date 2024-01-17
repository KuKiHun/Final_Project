$(function () {
  console.log("user_id : " + user_id);
  // $("#insertCounselBtn").click(function () {
  //   if (user_id != "null") {
  //     alert("!!!!!!!!!!!");
  //     // location.href = "/follaw/counselWriting";
  //     $.ajax({
  //       url: "/inserCounselBoard",
  //       type: "get",
  //       data: {
  //         user_id: user_id,
  //       },
  //       success: function (result) {
  //         //   console.log(result);
  //         location.href = "/follaw/counselWriting";
  //       },
  //       error: function (error) {
  //         console.log(error);
  //       },
  //     });
  //   } else {
  //     alert("로그인이 필요한 기능입니다.");
  //   }
  // });
  $("#insertCounselBtn").click(function () {
    if (user_id === "null") {
      alert("로그인이 필요한 기능입니다.");
      location.href = "/follaw/counsel";
    } else {
      location.href = "/follaw/counselWriting";
    }
  });
});
