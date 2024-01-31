$(function() {
    $("#passCheckForm").validate({
        rules: {
            user_id: {
                required: true,
                email: true
            },
            user_name: {
                required: true,
                rangelength: [2, 15]
            },
            user_birth: {
                required: true
            },
        },
        messages: {
            user_id: {
                required: "아이디는 필수 입력입니다.",
                email: "이메일 형식을 확인하세요."
            },
            user_name: {
                required: "이름은 필수 입력입니다.",
                rangelength: "이름은 {0}자에서 {1}자까지 사용 가능합니다."
            },
            user_birth: {
                required: "생년월일은 필수 입력입니다."
            },
        },
        errorPlacement: function (error, element) {
            error.addClass("text-danger"); // 오류 메시지에 텍스트 빨간색 스타일 추가
            error.insertAfter(element); // 오류 메시지를 입력 요소 다음에 삽입
            error.appendTo(element.parent());
        },
        submitHandler: function (form) {
            // 유효성 검사가 통과된 경우 폼을 제출하고 확인 팝업을 띄웁니다.
            alert("확인되었습니다.");
            form.submit();
        }
    });
});