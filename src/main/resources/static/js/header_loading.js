// $(function() {
//   // 아이디 중복 확인 버튼 클릭 시 이벤트 처리
//   $('#idCheckButton').click(function() {
//     // AJAX를 통해 아이디 중복 확인 요청
//     $.ajax({
//       url: '/member/insertMember',
//       method: 'POST',
//       data: { user_id: $('input[name="user_id"]').val() },
//       success: function(response) {
//         if (response.duplicate) {
//           alert('이미 사용 중인 아이디입니다.');
//         } else {
//           alert('사용 가능한 아이디입니다.');
//         }
//       },
//       error: function() {
//         alert('오류가 발생했습니다.');
//       }
//     });
//   });

//   // 유효성 검사 함수
//   function Validation() {
//     var user_id = $('input[name="user_id"]').val();
//     var user_pw = $('input[name="user_pw"]').val();
//     var user_birth = $('input[name="user_birth"]').val();
//     var user_tel = $('input[name="user_tel"]').val();

//     // user_id가 비어있는지 검사
//     if (user_id.trim() === '') {
//       alert('아이디를 입력해주세요.');
//       return false;
//     }

//     // user_pw가 비어있는지 검사
//     if (user_pw.trim() === '') {
//       alert('패스워드를 입력해주세요.');
//       return false;
//     }

//     // user_birth가 비어있는지 검사
//     if (user_birth.trim() === '') {
//       alert('생년월일을 입력해주세요.');
//       return false;
//     }

//     // user_tel가 비어있는지 검사
//     if (user_tel.trim() === '') {
//       alert('전화번호를 입력해주세요.');
//       return false;
//     }

//     return true;
//   }

//   // 회원가입 폼 제출 시 동작
//   $('#normal').submit(function(event) {
//     if (!Validation()) {
//       event.preventDefault(); // 기본 제출 동작 막기
//     } else {
//       // AJAX를 통해 회원가입 요청
//       $.ajax({
//         url: '/member/insertMember',
//         method: 'POST',
//         data: $('#normal').serialize(),
//         success: function(response) {
//           // 회원가입 성공 시 처리
//           if (response.success) {
//             alert('회원가입이 성공적으로 완료되었습니다.');
//             // 페이지 이동 없이 유지할 내용을 처리
//             // ...
//           } else {
//             alert('회원가입에 실패했습니다. 다시 시도해주세요.');
//             // 실패 시 필요한 처리
//             // ...
//           }
//         },
//         error: function() {
//           alert('회원가입에 실패했습니다. 다시 시도해주세요.');
//           // 회원가입 실패 시 필요한 처리
//           // ...
//         }
//       });
//     }
//   });
// });
