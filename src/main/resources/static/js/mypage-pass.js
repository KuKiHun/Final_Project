$(function() {
    $("#changeUserPassword").on("click", function(e) {
        //e.preventDefault();

        // 비밀번호 정보 수집
        var user_pw = $("#user_pw").val();
        var new_user_pw = $("#new_user_pw").val();
        var new_user_pwck = $("#new_user_pwck").val();

        // 비밀번호 일치 여부 확인
        if (user_pw !== user_pw) {
            alert("현재 비밀번호가 일치하지 않습니다.");
            return;
        }

        // 새로운 비밀번호 일치 여부 확인
        if (new_user_pw !== new_user_pwck) {
            alert("새로운 비밀번호가 일치하지 않습니다.");
            return;
        }

        // Ajax 요청 전송
        $.ajax({
            url: "/member/mypage/mypage-pass",
            type: "POST",
            data: {
                user_pw: user_pw,
                new_user_pw: new_user_pw
            },
            success: function(response) {
                // 서버 응답 처리
                // 필요한 동작 수행
                alert("회원님의 비밀번호가 성공적으로 수정되었습니다.");

                // 비밀번호 필드 초기화
                $("#user_pw").val("");
                $("#new_user_pw").val("");
                $("#new_user_pwck").val("");

                console.log("response", response);
            },
            error: function(xhr, status, error) {
                // 에러 처리
                console.log(error);
            }
        });
    });
});