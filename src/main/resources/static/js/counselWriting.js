$(function () {
  $("#insertCounselBtn").on("click", () => {
    //채크박스 checked확인
    var isChecked = document.getElementById("noticeAgreement").checked;

    //글 제목
    var board_title = $("#counselTitle").val();
    console.log("title : " + board_title);
    // alert("title : " + board_title);

    //글 내용
    var board_content = $("#counselContent").val();
    console.log("content : " + board_content);
    // alert("content : " + board_content);

    if (board_content.length < 200) {
      alert("200자 이상 작성해주세요.");
    }

    //select의 선택된 옵션의 value를 가져오기
    var field_idx = document.querySelector("#j-category").value;
    console.log("field_idx : " + field_idx);

    if (field_idx === "카테고리") {
      alert("카테고리를 선택해주세요.");
    }

    if (isChecked === true) {
      $.ajax({
        url: "insertCounselBoard",
        type: "POST",
        data: {
          board_title: board_title,
          board_content: board_content,
          field_idx: field_idx,
        },
        success: (data) => {
          console.log(data);
          window.location.href = "/follaw/counsel/counsel";
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
