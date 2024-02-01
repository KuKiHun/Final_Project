$(function() {
    $("#pass-confirm").validate({
        rules: {
            pass: {
                required: true,
                rangelength: [4, 15]
            },
        },
        messages: {
            pass: {
                required: "비밀번호는 필수 입력입니다.",
                rangelength: "비밀번호는 {0}자에서 {1}자까지 사용 가능합니다."
            },
        },
        errorPlacement: function (error, element) {
            error.addClass("text-danger"); // 오류 메시지에 텍스트 빨간색 스타일 추가
            error.insertAfter(element); // 오류 메시지를 입력 요소 다음에 삽입
        }
    });

    $('#pass-confirm').submit(function (event) {
        alert("비밀번호가 확인되었습니다.");
    });
});