


$(document).ready(function () {
    $("#updateUserPassword").submit(function (event) {
        event.preventDefault(); // 폼의 기본 동작을 중단

        // 폼 데이터를 가져오기
        var formData = {
            'user_pw': $('#user_pw').val(),
            'new_user_pw': $('#new_user_pw').val(),
            'new_user_pwck': $('#new_user_pwck').val()
        };

        // Ajax 요청
        $.ajax({
            type: 'POST',
            url: '/member/mypage-pass', // 수정이 필요한 URL로 변경
            data: formData,
            dataType: 'json',
            encode: true
        })
        .done(function (data) {
            // 서버로부터 응답이 성공적으로 돌아왔을 때 실행되는 부분
            if (data.success) {
                // 성공 메시지 처리 또는 리다이렉트 등
                alert('비밀번호가 성공적으로 변경되었습니다.');
            } else {
                // 오류 메시지 처리
                alert('비밀번호 변경에 실패했습니다. 다시 시도해주세요.');
            }
        })
        .fail(function (data) {
            // Ajax 요청이 실패했을 때 실행되는 부분
            console.log(data);
            alert('서버와의 통신 중 오류가 발생했습니다.');
        });
    });
});






// $(function() {
//     $("#changeUserPassword").on("click", function(e) {
//         //e.preventDefault();

//         // 비밀번호 정보 수집
//         var user_pw = $("#user_pw").val();
//         var new_user_pw = $("#new_user_pw").val();
//         var new_user_pwck = $("#new_user_pwck").val();

//         // 비밀번호 일치 여부 확인
//         if (user_pw !== current_user_pw) {
//             alert("현재 비밀번호가 일치하지 않습니다.");
//             return;
//         }

//         // 새로운 비밀번호 일치 여부 확인
//         if (new_user_pw !== new_user_pwck) {
//             alert("새로운 비밀번호가 일치하지 않습니다.");
//             return;
//         }

//         // Ajax 요청 전송
//         $.ajax({
//             url: "/member/mypage/mypage-pass",
//             type: "POST",
//             data: {
//                 user_pw: user_pw,
//                 new_user_pw: new_user_pw
//             },
//             success: function(response) {
//                 // 서버 응답 처리
//                 // 필요한 동작 수행
//                 alert("회원님의 비밀번호가 성공적으로 수정되었습니다.");

//                 // 비밀번호 필드 초기화
//                 $("#user_pw").val("");
//                 $("#new_user_pw").val("");
//                 $("#new_user_pwck").val("");

//                 console.log("response", response);
//             },
//             error: function(xhr, status, error) {
//                 // 에러 처리
//                 console.log(error);
//             }
//         });
//     });
// });
// $("#changeUserPassword").click(function(event) {
//     var currentPassword = $("#user_pw").val();

//     // 여기에서 현재 비밀번호가 맞는지 확인하는 코드를 작성

//     // 예시: 비밀번호가 맞지 않으면 경고창을 띄우고 작업 중단
//     if (!isCurrentPasswordValid(currentPassword)) {
//         alert("현재 비밀번호가 일치하지 않습니다.");
//         event.preventDefault();
//     }
// });
// $("#changeUserPassword").click(function(event) {
//     var newPassword = $("#new_user_pw").val();

//     // 여기에서 새 비밀번호의 길이가 4자 이상 15자 이하인지 확인하는 코드를 작성

//     if (!isNewPasswordValid(newPassword)) {
//         alert("새 비밀번호는 4자 이상 15자 이하로 설정해야 합니다.");
//         event.preventDefault();
//     }
// });

// function isNewPasswordValid(password) {
//     return password.length >= 4 && password.length <= 15;
// }
// $("#changeUserPassword").click(function(event) {
//     var newPassword = $("#new_user_pw").val();
//     var newPasswordConfirm = $("#new_user_pwck").val();

//     // 여기에서 새 비밀번호와 새 비밀번호 확인이 일치하는지 확인하는 코드를 작성

//     if (newPassword !== newPasswordConfirm) {
//         alert("새 비밀번호와 새 비밀번호 확인이 일치하지 않습니다.");
//         event.preventDefault();
//     }
// });