$(function () {
    // 폼 유효성 검사 초기화
    $("#updateUserPassword").validate({
        rules: {
            user_pw: {
                required: true,
                rangelength: [4, 15],
                remote: {
                    url: "/member/insertMember", // 비밀번호 일치 여부를 확인하는 서버 API 경로
                    type: "post",
                    data: {
                        user_pw: function() {
                            return $("#user_pw").val(); // 현재 비밀번호 입력 값 전달
                        }
                    }
                }
            },
            new_user_pw: {
                required: true,
                rangelength: [4, 15]
            },
            new_user_pwck: {
                required: true,
                equalTo: "#new_user_pw" // 새 비밀번호와 동일한지 확인
            }
        },
        messages: {
            user_pw: {
                required: "현재 비밀번호를 입력하세요.",
                rangelength: "비밀번호는 {0}자에서 {1}자까지 사용 가능합니다.",
                remote: "현재 비밀번호가 일치하지 않습니다."
            },
            new_user_pw: {
                required: "새 비밀번호를 입력하세요.",
                rangelength: "새 비밀번호는 {0}자에서 {1}자까지 사용 가능합니다."
            },
            new_user_pwck: {
                required: "새 비밀번호를 확인하세요.",
                equalTo: "새 비밀번호와 일치하지 않습니다."
            }
        },
        errorPlacement: function (error, element) {
            error.addClass("text-danger"); // 오류 메시지에 텍스트 빨간색 스타일 추가
            error.insertAfter(element); // 오류 메시지를 입력 요소 다음에 삽입
        },
        // submitHandler: function (form) {
        //     alert("개인정보가 성공적으로 수정되었습니다.")
        //     form.submit(); // 폼 제출
        // }
    });
    // '변경 내용 저장' 버튼 클릭 시 이벤트 처리
    $('#changeUserPasswordBtn').click(function () {
        // 폼이 유효한지 검사
        if ($("#updateUserPassword").valid()) {
            alert("비밀번호가 성공적으로 수정되었습니다.")
            location.reload();
        } else {
            // 폼이 유효하지 않은 경우 메시지 표시
            alert('폼이 유효하지 않습니다.');
        }
    });

});
  