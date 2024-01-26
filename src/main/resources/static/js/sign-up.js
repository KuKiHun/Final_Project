$(function () {
    // 폼 유효성 검사 초기화
    $("#normal").validate({
        rules: {
            user_name: {
                required: true,
                rangelength: [3, 15]
            },
            user_id: {
                required: true,
                email: true
            },
            user_pw: {
                required: true,
                rangelength: [4, 15]
            },
            user_birth: {
                required: true
            },
            user_tel: {
                required: true,
                phoneKR: true
            },
            agree1: {
                required: true
            }
        },
        messages: {
            user_name: {
                required: "이름은 필수 입력입니다.",
                rangelength: "이름은 {0}자에서 {1}자까지 사용 가능합니다."
            },
            user_id: {
                required: "아이디는 필수 입력입니다.",
                email: "이메일 형식을 확인하세요."
            },
            user_pw: {
                required: "비밀번호는 필수 입력입니다.",
                rangelength: "비밀번호는 {0}자에서 {1}자까지 사용 가능합니다."
            },
            user_birth: {
                required: "생년월일은 필수 입력입니다."
            },
            user_tel: {
                required: "전화번호는 필수 입력입니다.",
                phoneKR: "올바른 전화번호 형식이 아닙니다. (예: 02-1234-5678)"
            },
            agree1: {
                required: "약관 동의를 해야 가입이 완료됩니다."
            }
        },
        errorPlacement: function (error, element) {
            error.addClass("text-danger"); // 오류 메시지에 텍스트 빨간색 스타일 추가
            error.insertAfter(element); // 오류 메시지를 입력 요소 다음에 삽입
        }
    });

    // 사용자 정의 규칙을 추가
    $.validator.addMethod("phoneKR", function (value, element) {
        // 대한민국 전화번호 정규 표현식
        var phonePattern = /^(\d{2,3})-(\d{3,4})-(\d{4})$/;
        return this.optional(element) || phonePattern.test(value);
    }, "올바른 전화번호 형식이 아닙니다. (예: 02-1234-5678)");

 // '가입완료' 버튼 클릭 시 이벤트 처리
$('#successBtn').submit(function (event) {
        // 폼이 유효한지 검사
        if ($("#normal").valid()) {
            // 유효한 경우 여기에 추가로 수행할 작업을 작성
            // 예: AJAX 호출 등
        } else {
            // 폼이 유효하지 않은 경우 메시지 표시
            alert('폼이 유효하지 않습니다.');
        }
    });
});
    // // '아이디 중복 확인' 버튼 클릭 시 이벤트 처리
    // $('#idCheckButton').click(function (event) {
    //     event.preventDefault();
    //     // 여기에 아이디 중복 확인에 대한 로직을 추가
    //     // 예: AJAX 호출 등
    //     // AJAX를 통해 아이디 중복 확인 요청
    //     $.ajax({
    //         url: '/member/insertMember', // 실제 서버 API 경로로 수정
    //         method: 'post',
    //         data: { user_id: $('#user_id').val() }, // user_id 값을 가져와서 전송
    //         success: function (response) {
    //             if (response.duplicate) {
    //                 alert('이미 사용 중인 아이디입니다.');
    //             } else {
    //                 alert('사용 가능한 아이디입니다.');
    //                 // 아이디 중복 확인이 성공했을 때 추가적인 로직을 수행할 수 있음
    //                 // 예: 회원가입 버튼 활성화, 다음 단계로 진행 등
    //             }
    //         },
    //         error: function () {
    //             alert('오류가 발생했습니다.');
    //         }
    //     });
    // });
