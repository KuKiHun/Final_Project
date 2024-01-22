$(function () {
  //글 수정하기 버튼 클릭 시
  $("#updateContentBtn").click(function () {
    var board_content = $("#updateContent").val().trim();
    // alert(board_content);
    var user_id = $("#user_id").val();
    // alert(user_id);
    var board_idx = $("#board_idx").val();
    // alert(board_idx);

    // var url = `http://localhost:8080/follaw/updateCounselContent/${board_content}/${user_id}/${board_idx}`;
    var url = "/follaw/updateCounselContent";

    $.ajax({
      url: url,
      method: "POST",
      data: {
        board_content: board_content,
        user_id: user_id,
        board_idx: board_idx,
      },
      success: function (result) {
        console.log(result);
      },
      error: function () {
        console.error("error");
      },
    });
  });

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
    // alert(board_idx);
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
      // alert(board_idx);

      //유저 아이디
      var user_id = $("#user_id").val();
      // alert(user_id);

      //변호사 아이디
      // var lawyer_id = $(".lawyer_id").val();
      var lawyer_id = $(this).siblings(".lawyer_id").val();
      // alert(lawyer_id);

      //버튼
      var isSelected = $(".isSelected");

      $.ajax({
        url: `http://localhost:8080/follaw/isSelected/${board_idx}/${user_id}/${lawyer_id}`,
        success: function (data) {
          console.log(data);
          isSelected.hide();
          location.href = `../view/${board_idx}`;
        },
        error: function () {
          console.log("error");
        },
      });
    });
  });

  //답변 수정하기 버튼 클릭 시
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
      // alert(replyContent);

      CKEDITOR.instances.board_content.setData(replyContent);

      $("#reply")
        .off("click") //기존 클릭 이벤트 핸들러(작성)가 제거되고 새로운 클릭 이벤트 핸들러 등록
        .click(function () {
          var board_reply_content = CKEDITOR.instances.board_content.getData();

          board_reply_content = board_reply_content
            .replace(/<\/?div[^>]*>/g, "")
            .trim();

          var board_idx = parseInt($("#board_idx").val());
          // alert("board_idx : " + board_idx);

          var lawyer_id = replyContainer.find(".lawyer_id").val();
          // alert("lawyer_id : " + lawyer_id);

          var url = `http://localhost:8080/follaw/updateCounselReply/${board_idx}/${board_reply_content}/${lawyer_id}`;

          $.ajax({
            url: url,
            data: {
              board_reply_content: board_reply_content,
              board_idx: board_idx,
              lawyer_id: lawyer_id,
            },
            success: function (result) {
              console.log(result);
            },
            error: function () {
              console.log("error");
            },
          });
        });
    });
  });

  //채택 취소하기 버튼 클릭시
  $("#isSelectedAuth2").click(function () {
    var board_idx = $("#board_idx").val();

    $.ajax({
      url: `http://localhost:8080/follaw/cancelSelected/${board_idx}`,
      success: function (result) {
        console.log(result);
        location.href = `../view/${board_idx}`;
      },
      error: function () {
        console.error("error");
      },
    });
  });
});
