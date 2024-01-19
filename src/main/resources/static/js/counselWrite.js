$(function () {
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
      // alert(typeof board_idx);

      //유저 아이디
      var user_id = $("#user_id").val();
      // alert(user_id);

      //변호사 아이디
      var lawyer_id = $(".lawyer_id").val();
      // var lawyer_id = $(this).siblings(".lawyer_id").val();
      // alert(lawyer_id);

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
          isSelected = hide();
          location.href = `/follaw/view/${board_idx}`;
        },
        error: function () {
          console.log("error");
        },
      });
    });
  });
});
