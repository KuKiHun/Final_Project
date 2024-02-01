// pw_auth.jsp

$(document).ready(function () {
    // 인증번호 확인
    $("#contactForm").submit(function () {
        var emailInjeung = $("#emailInjeung").val();
        var num = $("#num").val();

        // AJAX를 이용하여 서버로 인증번호 확인 요청
        $.ajax({
            type: "POST",
            url: "/member/pw_set", // 실제 서버 엔드포인트로 변경
            data: { emailInjeung: emailInjeung, num: num },
            success: function (data) {
                // 서버로부터의 응답 처리
                if (data === "success") {
                    // 인증 성공 시 페이지 이동
                    window.location.href = "follaw/pw_new";
                } else {
                    // 인증 실패 처리
                    alert("인증번호가 일치하지 않습니다. 다시 확인해주세요.");
                }
            },
            error: function () {
                // AJAX 오류 처리
                alert("인증되었습니다.");
            }
        });
    });
});
