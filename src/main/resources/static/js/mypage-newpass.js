$(document).ready(function () {
    $("#user_newpass_form").validate({
        rules: {
            new_user_pw: {
                required: true,
                rangelength: [4, 15]
            },
            new_user_pw_confirm: {
                required: true,
                rangelength: [4, 15],
                equalTo: "#new_user_pw" // new_user_pw와 일치해야 함
            },
        },
        messages: {
            new_user_pw: {
                required: "비밀번호는 필수 입력입니다.",
                rangelength: "비밀번호는 {0}자에서 {1}자까지 사용 가능합니다."
            },
            new_user_pw_confirm: {
                required: "비밀번호는 필수 입력입니다.",
                rangelength: "비밀번호는 {0}자에서 {1}자까지 사용 가능합니다.",
                equalTo: "비밀번호와 일치하지 않습니다."
            },
        },
        errorPlacement: function (error, element) {
            error.addClass("text-danger"); // 오류 메시지에 텍스트 빨간색 스타일 추가
            error.insertAfter(element); // 오류 메시지를 입력 요소 다음에 삽입
        }
    });

    $('#user_newpass_btn').click(function () {
        // 비밀번호 검증 로직
        if ($("#user_newpass_form").valid()) {
            var userPass = $('#new_user_pw').val();
            var userPassconfirm = $('#new_user_pw_confirm').val();

            if (userPass === userPassconfirm) {
                // 검증 성공 시 폼을 제출
                $('#user_newpass_form')[0].submit();
            } else {
                alert('비밀번호 확인과 일치하지 않습니다.');
            }
        }
    });
});