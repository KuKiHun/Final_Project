$(function() {
    $("#updateLawyer").validate({
        rules: {
            lawyer_tel: {
                required: true,
                phoneKR: true
            },
            lawyer_birth: {
                required: true
                //dateISO: true
            }
        },
        messages: {
            lawyer_tel: {
                required: "전화번호는 필수 입력입니다.",
                phoneKR: "올바른 전화번호 형식이 아닙니다. (예: 02-1234-5678)"
            },
            lawyer_birth: {
                required: "생년월일은 필수 입력입니다.",
                dateISO: "올바른 날짜 형식이 아닙니다. (예: 1994-01-13)"
            }
        },
        errorPlacement: function (error, element) {
            error.addClass("text-danger"); // 오류 메시지에 텍스트 빨간색 스타일 추가
            error.insertAfter(element); // 오류 메시지를 입력 요소 다음에 삽입
        },
        submitHandler: function (form) {
            alert("개인정보가 성공적으로 수정되었습니다.")
            form.submit(); // 폼 제출
        }
    });

        // 사용자 정의 규칙을 추가
        $.validator.addMethod("phoneKR", function (value, element) {
            // 대한민국 전화번호 정규 표현식
            var phonePattern = /^(\d{2,3})-(\d{3,4})-(\d{4})$/;
            return this.optional(element) || phonePattern.test(value);
        }, "올바른 전화번호 형식이 아닙니다. (예: 02-1234-5678)");
        
});