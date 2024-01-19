$(function () {
  //답변 작성하기 버튼 클릭 시
  $("#lawyerReply").click(function () {
    var isHidden = $("#lawyerReplyEditor").is(":hidden");
    if (isHidden) {
      $("#lawyerReplyEditor").removeAttr("hidden");
    } else {
      $("#lawyerReplyEditor").attr("hidden", true);
    }
  });

  //답글 작성하기
  $("#reply").click(function () {
    //textarea의 값을 가져오기
    var board_content = CKEDITOR.instances.board_content.getData();

    //입력된 값에 있는 <div>태그 없애기 위한 작업
    board_content = board_content.replace(/<\/?div[^>]*>/g, "").trim();
    // alert(board_content);

    //글 인덱스 가져오기
    var board_idx = parseInt($("#board_idx").val());
    alert(board_idx);
    // alert(typeof board_idx);

    let url = `http://localhost:8080/follaw/insertCounselReply/${board_content}/${board_idx}`;
    // alert(url);

    $.ajax({
      url: url,
      success: function (result) {
        console.log(result);
      },
      error: function () {
        console.log("error");
      },
    });
  });

  //채택하기 버튼 클릭 시
  $(".isSelected").each(function () {
    $(this).on("click", function () {
      //글 인덱스 가져오기
      var board_idx = parseInt($("#board_idx").val());
      alert(board_idx);

      //유저 아이디
      var user_id = $("#user_id").val();
      alert(user_id);

      //변호사 아이디
      // var lawyer_id = $(".lawyer_id").val();
      var lawyer_id = $(this).siblings(".lawyer_id").val();
      alert(lawyer_id);

      //버튼
      var isSelected = $(".isSelected");

      $.ajax({
        url: `http://localhost:8080/follaw/isSelected/${board_idx}/${user_id}/${lawyer_id}`,
        data: {
          board_idx: board_idx,
          user_id: user_id,
          lawyer_id: lawyer_id,
        },
        success: function (data) {
          console.log(data);
          isSelected.hide();
        },
        error: function () {
          console.log("error");
        },
      });
    });
  });

  //수정하기 버튼 클릭 시
  $(".updateReply").each(function () {
    $(this).on("click", function () {
      $("#lawyerReply").text("[수정하기]");
      var isHidden = $("#lawyerReplyEditor").is(":hidden");
      if (isHidden) {
        $("#lawyerReplyEditor").removeAttr("hidden");
      }
      $("#reply").text("수정하기");

      //해당 수정 버튼이 속한 댓글 컨테이너 찾기
      var replyContainer = $(this).closest(".replyContainer");

      //댓글 내용 가져오기
      var replyContent = replyContainer.find(".replyContent").text();

      $("#board_content").text("");
    });
  });
});
