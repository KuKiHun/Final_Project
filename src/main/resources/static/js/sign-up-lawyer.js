$(function () {
    // 폼 유효성 검사 초기화
    $("#lawyer").validate({
        rules: {
            lawyer_name: {
                required: true,
                rangelength: [2, 15]
            },
            lawyer_id: {
                required: true,
                email: true
            },
            lawyer_pass: {
                required: true,
                rangelength: [4, 15]
            },
            // lawyer_pwck: {
            //     required: true,
            //     rangelength: [4, 15],
            //     equalTo: "#lawyer_pass" // lawyer_pass와 일치해야 함
            // },
            lawyer_birth: {
                required: true
            },
            lawyer_tel: {
                required: true,
                phoneKR: true
            },
            lawyer_exam: {
                required: true
            },
            lawyer_exam_num: {
                required: true
            },
            lawyer_acq_year: {
                required: true
            },
            lawyer_field: {
                required: true
            },
            agree1: {
                required: true
            }
        },
        messages: {
            lawyer_name: {
                required: "이름은 필수 입력입니다.",
                rangelength: "이름은 {0}자에서 {1}자까지 사용 가능합니다."
            },
            lawyer_id: {
                required: "아이디는 필수 입력입니다.",
                email: "이메일 형식을 확인하세요."
            },
            lawyer_pass: {
                required: "비밀번호는 필수 입력입니다.",
                rangelength: "비밀번호는 {0}자에서 {1}자까지 사용 가능합니다."
            },
            // lawyer_pwck: {
            //     required: "비밀번호 확인은 필수 입력입니다.",
            //     rangelength: "비밀번호 확인은 {0}자에서 {1}자까지 사용 가능합니다.",
            //     equalTo: "비밀번호와 일치하지 않습니다."
            // },
            lawyer_birth: {
                required: "생년월일은 필수 입력입니다."
            },
            lawyer_tel: {
                required: "전화번호는 필수 입력입니다.",
                phoneKR: "올바른 전화번호 형식이 아닙니다. (예: 010-1234-5678)"
            },
            lawyer_exam: {
                required: "출신 시험을 선택해주세요."
            },
            lawyer_exam_num: {
                required: "시험 회차를 입력해주세요."
            },
            lawyer_acq_year: {
                required: "자격취득일을 입력해주세요."
            },
            lawyer_field: {
                required: "전문분야를 입력해주세요."
            },
            agree1: {
                required: "약관 동의를 해야 가입이 완료됩니다."
            }
        },
        errorPlacement: function (error, element) {
            error.addClass("text-danger"); // 오류 메시지에 텍스트 빨간색 스타일 추가
            error.insertAfter(element); // 오류 메시지를 입력 요소 다음에 삽입
            error.appendTo(element.parent());
        }
    });
  // '아이디 중복 확인' 버튼 클릭 시 이벤트 처리
  $('#lawyeridCheckButton').click(function () {
    $.ajax({
        type: 'get',
        data: { lawyer_id: $('#lawyer_id').val() },
        url: '/lawyer/lawyerIdCheck', // 실제 서버 경로로 수정
        success: function (result) {
            console.log(result);
            if (result === 'Available') {
                $('#lawyercheckResult').text("사용 가능한 아이디입니다.");
                $('#lawyercheckResult').css({
                    color: "blue"
                });
            } else {
                $('#lawyercheckResult').text("중복된 아이디입니다.");
                $('#lawyercheckResult').css({
                    color: "red"
                });
            }
        },
        error: function (err) {
            alert("오류");
            console.log(err);
        }
    });
});
    // 사용자 정의 규칙을 추가
    $.validator.addMethod("phoneKR", function (value, element) {
        // 대한민국 전화번호 정규 표현식
        var phonePattern = /^(\d{2,3})-(\d{3,4})-(\d{4})$/;
        return this.optional(element) || phonePattern.test(value);
    }, "올바른 전화번호 형식이 아닙니다. (예: 010-1234-5678)");

// '가입완료' 버튼 클릭 시 이벤트 처리
$('#lawyer').submit(function (event) {
    // 폼이 유효한지 검사
    if ($(this).valid()) {
        // 이용약관 동의 체크박스의 상태 확인
        if (!$('#agree1').prop('checked')) {
            // 체크되지 않은 경우 알림 표시
            alert("이용약관에 동의해주세요.");
            // 제출 중단
            event.preventDefault();
        } else {
            // 폼이 유효하고 이용약관에 동의한 경우
            alert('회원가입이 완료되었습니다.');
            // 여기에 추가로 수행할 작업을 작성 (예: AJAX 호출 등)
        }
    } else {
        // 폼이 유효하지 않은 경우
        alert('필수 입력사항을 입력해주세요.');
    }
});

});