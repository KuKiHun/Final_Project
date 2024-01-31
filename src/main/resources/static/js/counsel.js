$(function () {
  //상담글 쓰기 클릭시
  console.log("user_id : " + user_id);
  $("#insertCounselBtn").click(function () {
    if (user_id === "null") {
      alert("로그인이 필요한 기능입니다.");
    } else {
      location.href = "/follaw/counsel/counselWriting";
    }
  });

  //페이징
  let path = window.location.pathname.split("/");
  if (path.length === 4) {
    $("li.page-1").addClass("active");
  } else if (path.length === 5) {
    $("li.page-" + path[4]).addClass("active");
  }

  //카테고리 선택시
  $(".dropdown-toggle.btn-light").on("click", function () {
    $(".inner.show .dropdown-item").on("click", function () {
      var selectedText = $(this).find(".text").text();
      if (selectedText != "카테고리") {
        window.location.href = `/follaw/counsel/counsel/${selectedText}/1`;
      } else {
        window.location.href = `/follaw/counsel/counsel`;
      }
    });
  });

  $(window).on("load", function () {
    var currentPath = decodeURIComponent(window.location.pathname); // pathname : /follaw/counsel/counsel
    var selectedText = currentPath.split("/")[4];
    //isNaN : 숫자일 경우 false, 아니면 true
    if (isNaN(selectedText)) {
      $(".filter-option-inner-inner").text(selectedText);
    }
  });

  $(".dropdown-toggle").on("click", function () {
    var selectedText = $(".filter-option-inner-inner").text(); // 현재 선택된 텍스트

    $(".dropdown-menu .dropdown-item").each(function () {
      var categoryText = $(this).find(".text").text(); // 각 카테고리 텍스트

      if (selectedText === categoryText) {
        $(this).addClass("selected active");
        $(this).closest("li").addClass("active selected");
      } else {
        $(this).removeClass("selected active");
        $(this).closest("li").removeClass("active selected");
      }
    });
  });
});
