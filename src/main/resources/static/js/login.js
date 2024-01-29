$(function () {
    // 로그인 폼 유효성 검사 초기화
    $("#userLoginForm").validate({
        rules: {
            user_id: {
                required: true,
                email: true
            },
            user_pw: {
                required: true,
                rangelength: [4, 15]
            }
        },
        messages: {
            user_id: {
                required: "아이디(이메일)는 필수 입력입니다.",
                email: "이메일 형식을 확인하세요."
            },
            user_pw: {
                required: "비밀번호는 필수 입력입니다.",
                rangelength: "비밀번호는 {0}자에서 {1}자까지 사용 가능합니다."
            }
        },
        errorPlacement: function (error, element) {
            error.addClass("text-danger"); // 오류 메시지에 텍스트 빨간색 스타일 추가
            error.insertAfter(element); // 오류 메시지를 입력 요소 다음에 삽입
        }
    });

    // 로그인 버튼 클릭 시 이벤트 처리
    $('#userLoginButton').click(function () {
        if ($('#userLoginForm').valid()) {
            // 유효성 검사 통과한 경우에만 서버로 로그인 요청
            var userData = {
                user_id: $('#user_id').val(),
                user_pw: $('#user_pw').val()
            };

            $.ajax({
                type: 'POST',
                data: userData,
                url: '/member/login', // 실제 서버 경로로 수정
                success: function (result) {
                    console.log(result);
                    if (result === 'Success') {
                        alert('로그인 성공');
                        // 로그인 성공 시 리다이렉션 또는 추가 작업 수행
                    } else {
                        alert('로그인 실패: 아이디 또는 비밀번호를 확인해주세요.');
                    }
                },
                error: function (err) {
                    alert('로그인 실패: 서버 오류');
                    console.log(err);
                }
            });
        } else {
            alert('아이디와 비밀번호를 확인해주세요.');
        }
    });
});
