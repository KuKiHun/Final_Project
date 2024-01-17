$(function () {
  $("#insertCounselBtn").on("click", () => {
    //채크박스 checked확인
    var isChecked = document.getElementById("noticeAgreement").checked;
    if (isChecked === true) {
      var title = $("#counselTitle").val();
      console.log(title);

      var content = $("#counselContent").val();
      console.log(content);

      $.ajax({
        url: "../board/insertCounselBoard",
        type: "get",
        contentType: "application/json",
        data: {
          title: title,
          content: content,
        },
        success: (data) => {
          console.log(data);
        },
        error: () => {
          console.error("error");
        },
      });
    } else {
      alert("동의하셔야 글 작성이 가능합니다");
    }
  });
});
