$(function() {
    $("#changeUserInfo").on("click", function(e) {
       //e.preventDefault();

        // 사용자 정보 수집
        var user_id = $("#user_id").val();
        var user_name = $("#user_name").val();
        var user_tel = $("#user_tel").val();
        var user_birth = $("#user_birth").val();

        // Ajax 요청 전송
        $.ajax({
            url: "/member/mypage/update",
            data: {
                user_id: user_id,
                user_name: user_name,
                user_tel: user_tel,
                user_birth: user_birth
            },
            success: function(response) {
                // 서버 응답 처리
                // 필요한 동작 수행
                alert("회원님의 개인정보가 성공적으로 수정되었습니다.");
                
               // 수정된 정보를 화면에 바로 반영
                $("#user_name").val(user_name);
                $("#user_tel").val(user_tel);
                $("#user_birth").val(user_birth);
               console.log("response",response);
            },
            error: function(xhr, status, error) {
                // 에러 처리
                console.log(error);
            }
        });
    });
});