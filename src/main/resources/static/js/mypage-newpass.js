$(document).ready(function () {

    $("#user_newpass").validate({
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

    $('#user_newpass').submit(function (e) {
        e.preventDefault();

        // 비밀번호 검증 로직
        if ($("#user_newpass").valid()) {
            var userPass = $('#new_user_pw').val();
            var userPassconfirm = $('#new_user_pw_confirm').val();

            if (userPass === userPassconfirm) {
                alert('성공적으로 비밀번호가 변경되었습니다.');
                // 여기에 추가 동작을 작성하세요 (예: 폼 제출)
                // $('#pass-confirm').submit(); // 폼 제출
            } else {
                alert('비밀번호 확인과 일치하지 않습니다.');
            }
        }
    });
});