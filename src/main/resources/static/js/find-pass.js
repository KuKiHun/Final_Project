// find-pass.jsp

$(document).ready(function () {
    // 이메일 입력 후 인증 요청
    $("#findPassForm").submit(function (e) {
        //e.preventDefault();
        var user_id = $("#user_id").val();

        // AJAX를 이용하여 서버로 이메일 전송
        $.ajax({
            //type: "POST",
            url: "/member/pw_auth", // 실제 서버 엔드포인트로 변경
            data: { user_id: $('#user_id').val() },
            success: function (data) {
                // 서버로부터의 응답 처리
                if (data === "success") {
                    // 인증 이메일 발송 성공 시 페이지 이동
                    window.location.href = "follaw/pw_auth";
                    alert("인증 이메일 발송에 성공했습니다.");
                } else {
                    // 인증 이메일 발송 실패 처리
                    alert("인증 이메일 발송에 성공했습니다.");
                }
            },
            error: function (e) {
                // AJAX 오류 처리
                alert("인증 이메일 발송에 성공했습니다.");
                e.preventDefault();
            }
        });
    });
});
