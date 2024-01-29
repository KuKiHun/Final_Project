<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>AQU I CITY 회원정보수정</title>
<link rel="icon" href="img/Fevicon.png" type="image/png">
<link rel="stylesheet"
   href="../resources/join_login/vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet"
   href="../resources/join_login/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet"
   href="../resources/join_login/vendors/themify-icons/themify-icons.css">
<link rel="stylesheet"
   href="../resources/join_login/vendors/linericon/style.css">
<link rel="stylesheet"
   href="../resources/join_login/vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet"
   href="../resources/join_login/vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet"
   href="../resources/join_login/vendors/nice-select/nice-select.css">
<link rel="stylesheet"
   href="../resources/join_login/vendors/nouislider/nouislider.min.css">

<link rel="stylesheet" href="../resources/join_login/css/style.css">

<script
   src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>

#updateBtn {

   margin-bottom : 37px;
}

.login_box_img join_box{
   height:106.5%;
}

</style>


<!-- 폼 유효성 검사 -->
<script src="../resources/join_login/vendors/jquery/jquery-3.2.1.min.js"></script>
<script src="../resources/join_login/vendors/jquery.ajaxchimp.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
<script type="text/javascript">
   $(document).ready(function() {
      $("#register_form").validate({
         rules : {
            m_id : {
               required : true,
               rangelength : [ 4, 10 ]
            },
            m_pass : {
               required : true,
               rangelength : [ 4, 15 ]
            },
            m_name : {
               required : true,
               rangelength : [ 3, 15 ]
            },
            m_email : {
               required : true,
               email : true
            },
            m_tel : {
               required : true,
               phoneKR : true
            },
            agree : {
               required : true
            }
         },
         messages : {
            m_id : {
               required : "아이디는 필수 입력입니다.",
               rangelength : "아이디는 {0}자에서 {1}자까지 사용 가능합니다."
            },
            m_pass : {
               required : "비밀번호는 필수 입력입니다.",
               rangelength : "비밀번호은 {0}자에서 {1}자까지 사용 가능합니다."
            },
            m_name : {
               required : "이름은 필수 입력입니다.",
               rangelength : "이름은 {0}자에서 {1}자까지 사용 가능합니다."
            },
            m_email : {
               required : "이메일은 필수 입력입니다.",
               email : "이메일 형식을 확인하세요."
            },
            m_tel : {
               required : "전화번호는 필수 입력입니다.",
               phoneKR : "올바른 전화번호 형식이 아닙니다. (예: 02-1234-5678)"
            },
            agree : {
               required : "약관 동의를 해야 가입이 완료됩니다."
            }

         },
         errorPlacement : function(error, element) {
            error.insertAfter(element); // 오류 메시지를 입력 요소 다음에 삽입
         }

      });

      // 사용자 정의 규칙을 추가
      $.validator.addMethod("phoneKR", function(value, element) {
         // 대한민국 전화번호 정규 표현식
         var phonePattern = /^(\d{2,3})-(\d{3,4})-(\d{4})$/;
         return this.optional(element) || phonePattern.test(value);
      }, "올바른 전화번호 형식이 아닙니다. (예: 02-1234-5678)");

      $('#checkDuplicateButton').click(function(event) {
         event.preventDefault();
         /* window.open("valid.jsp?userId="+id,"","width=200, height=150"); */

         $.ajax({
            type : 'get',
            data : {
               m_id : $('#m_id').val()
            },
            url : 'check_Id',
            success : function(response) {
               if (response === "duplicate") {
                  // $("#duplicateMessage").text("이미 사용 중인 아이디입니다.");
                  alert("이미 사용 중인 아이디입니다.")
               } else if (response === "available") {
                  // $("#duplicateMessage").text("사용 가능한 아이디입니다.");
                  alert("사용 가능한 아이디입니다.")
               }
            },
            error : function(err) {
               console.log(err);
            }

         });

      });

   });
</script>

</head>
<body>

   <!--================Login Box Area =================-->
   <section class="login_box_area section-margin">
      <div class="container">
         <div class="row">
            <div class="col-lg-6">
               <div class="login_box_img join_box">
                  <div class="hover">
                     <h4>회원정보수정</h4>
                     <p>개인정보보호를 위해 비밀번호 변경을 생활화합시다.</p>
                     <a class="button button-account" href="../member/mypage?m_id=${sessionScope.logid}">마이페이지</a>
                  </div>
               </div>
            </div>
            <div class="col-lg-6">
               <div class="login_form_inner register_form_inner" style="padding-top: 97px !important; padding-bottom: 43px !important;">
                  <h3>회원정보 수정</h3>
                  <form class="row login_form join" action="update_do?m_id=${sessionScope.logname }"
                     id="register_form" method='post'>
                     <div class="col-md-12 form-group id_input">
                        <input type="text" class="form-control" id="m_id" name="m_id" value="${memberInfo.m_id }"
                           placeholder="Id" onfocus="this.placeholder = ''"
                           onblur="this.placeholder = 'Id'" required disabled="disabled">
                     </div>
                     <div class="col-md-12 form-group">
                        <input type="password" class="form-control" id="m_pass"
                           name="m_pass" placeholder="Password"
                           onfocus="this.placeholder = ''"
                           onblur="this.placeholder = 'Password'" >
                     </div>
                     <div class="col-md-12 form-group">
                        <input type="text" class="form-control" id="m_name"
                           name="m_name" placeholder="Username"
                           onfocus="this.placeholder = ''"
                           onblur="this.placeholder = 'Username'" required value="${memberInfo.m_name }">
                     </div>
                     <div class="col-md-12 form-group">
                        <input type="email" class="form-control" id="m_email"
                           name="m_email" placeholder="Email Address"
                           onfocus="this.placeholder = ''"
                           onblur="this.placeholder = 'Email Address'" value="${memberInfo.m_email }">
                     </div>

                     <div class="col-md-12 form-group">
                        <input type="tel" class="form-control" id="m_tel" name="m_tel"
                           placeholder="Tel" onfocus="this.placeholder = ''"
                           onblur="this.placeholder = 'Tel'" value="${memberInfo.m_tel }">
                     </div>
                     <div class="col-md-12 form-group">
                        <input type="text" class="form-control" id="m_postcode"
                           name="m_postcode" placeholder="Postcode"
                           onfocus="this.placeholder = ''"
                           onblur="this.placeholder = 'Postcode'" value="${memberInfo.m_postcode }">
                     </div>
                     <div class="col-md-12 form-group">
                        <input type="text" class="form-control" id="m_addr"
                           name="m_addr" placeholder="Address"
                           onfocus="this.placeholder = ''"
                           onblur="this.placeholder = 'Address'" value="${memberInfo.m_addr }">
                     </div>
                     <div class="col-md-12 form-group">
                        <div class="creat_account">
                        </div>
                     </div>
                     <div class="col-md-12 form-group">
                        <button type="submit" value="submit"
                           class="button button-register w-100" id="updateBtn">수정완료</button>
                     </div>
                  </form>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!--================End Login Box Area =================-->



   <script
      src="../resources/join_login/vendors/bootstrap/bootstrap.bundle.min.js"></script>
   <script src="../resources/join_login/vendors/skrollr.min.js"></script>
   <script
      src="../resources/join_login/vendors/owl-carousel/owl.carousel.min.js"></script>
   <script
      src="../resources/join_login/vendors/nice-select/jquery.nice-select.min.js"></script>
   <script src="../resources/join_login/vendors/mail-script.js"></script>
   <script src="../resources/join_login/js/main.js"></script>




   <!-- 다음 카카오 주소 가져오기 -->
   <script>
      $('#m_postcode').click(
            function() {

               new daum.Postcode({
                  oncomplete : function(data) {
                     // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                     // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                     // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                     var addr = ''; // 주소 변수
                     var extraAddr = ''; // 참고항목 변수

                     //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                     if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                     } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                     }

                     // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                     if (data.userSelectedType === 'R') {
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if (data.bname !== ''
                              && /[동|로|가]$/g.test(data.bname)) {
                           extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if (data.buildingName !== ''
                              && data.apartment === 'Y') {
                           extraAddr += (extraAddr !== '' ? ', '
                                 + data.buildingName
                                 : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if (extraAddr !== '') {
                           extraAddr = ' (' + extraAddr + ')';
                        }
                        addr += extraAddr;

                     } else {
                        addr += ' ';
                     }

                     // 우편번호와 주소 정보를 해당 필드에 넣는다.
                     $('#m_postcode').val(data.zonecode);
                     $('#m_addr').val(addr);
                     // document.getElementById("sample6_address").value = addr;
                     // 커서를 상세주소 필드로 이동한다.
                     $("#m_addr").focus();
                  }
               }).open();

            })
   </script>

</body>
</html>