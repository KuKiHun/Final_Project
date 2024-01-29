<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
   <!--  b03159e7697941a938317bd0edb04c62 -->
   <!-- cdb167e549c841a2a26e863885445582 -->
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
        window.Kakao.init('cdb167e549c841a2a26e863885445582');
        function kakaoLogin() {
            window.Kakao.Auth.login({
                scope:'profile_nickname,profile_image,account_email',
                success: function(response){
                    console.log(response);
                    window.Kakao.API.request({
                        url:'/v2/user/me',
                        success: function(res) {
                            const kakao_account = res.kakao_account;
                            console.log(kakao_account);
                        }
                    });
                }
            });
        }
        
    </script>
      <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
      <script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
      <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
      <script
       src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>

</head>
<body>

  <!-- <script src="${pageContext.request.contextPath}/js/header_loading.js"></script> -->
<!-- JSP 코드에 추가할 jQuery 스크립트 -->


  <!-- LOADING AREA START ===== -->
<div class="loading-area">
    <div class="loading-box"></div>
    <div class="loading-pic">
        <div class="wrapper">
            <div class="cssload-loader"></div>
        </div>
    </div>
</div>
<!-- LOADING AREA  END ====== -->

<div class="page-wraper">

    <!-- HEADER START -->
    <header  class="site-header header-style-3 mobile-sider-drawer-menu">

        <div class="sticky-header main-bar-wraper  navbar-expand-lg">
            <div class="main-bar">

                <div class="container-fluid clearfix">

                    <div class="logo-header">
                        <div class="logo-header-inner logo-header-one">
                            <a href="http://localhost:8080/follaw/index">
                                <img src="${pageContext.request.contextPath}/images/logo-dark.png" alt="">
                            </a>
                        </div>
                    </div>

                    <!-- NAV Toggle Button -->
                    <button id="mobile-side-drawer" data-target=".header-nav" data-toggle="collapse" type="button" class="navbar-toggler collapsed">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar icon-bar-first"></span>
                        <span class="icon-bar icon-bar-two"></span>
                        <span class="icon-bar icon-bar-three"></span>
                    </button>

                        <!-- MAIN Vav -->
                        <div class="nav-animation header-nav navbar-collapse collapse d-flex justify-content-center">

                        <ul class=" nav navbar-nav">
                            <li class="has-child"><a href="javascript:;">검색</a>
                                <ul class="sub-menu">
                                    <li><a href="lawyer">변호사</a></li>
                                    <li><a href="court">법원</a></li>
                                    <li><a href="lawoffice">법률사무소</a></li>
                                </ul>
                            </li>
                            <li class="has-child"><a href="javascript:;">법률상담</a>
                                <ul class="sub-menu">
                                    <li><a href="">화상상담</a></li>
                                    <li><a href="">채팅상담</a></li>
                                </ul>
                            </li>
                            <li class="has-child"><a href="news">법률뉴스</a>
                            </li>
                            <li class="has-child"><a href="javascript:;">법률지식</a>
                                <ul class="sub-menu">
                                    <li><a href="knowledge/law">주요5법</a></li>
                                    <li><a href="knowledge/case">판례</a></li>
                                </ul>
                            </li>
                            <li class="has-child"><a href="javascript:;">커뮤니티</a>
                                <ul class="sub-menu">
                                    <li><a href="${pageContext.request.contextPath }/board/notice">공지사항</a></li>
                                    <li><a href="">회원게시판</a></li>
                                </ul>
                            </li>
                            <li class="has-child"><a href="about">회사소개</a>
                            </li>
                        </ul>

                    </div>

                    <!-- Header Right 로그인 Section-->
                    <div class="extra-nav header-2-nav">
                        <div class="extra-cell">
                            <div class="header-nav-btn-section">
                                <!-- 사용자 -->

                                <div class="twm-nav-btn-left">
                                    <!-- 세션에 유저 로그인 정보가 있는 경우 -->
                                    <c:if test="${not empty sessionScope.user_name}">
                                        <a href="${pageContext.request.contextPath}/member/logout" class="twm-nav-sign-up">
                                            <i class="feather-log-out"></i> 로그아웃
                                        </a>
                                    </c:if>


                                    <!-- 세션에 유저 로그인 정보가 없는 경우 -->
                                    <c:if test="${empty sessionScope.user_name}">
                                        <c:if test="${empty sessionScope.lawyer_name}">
                                            <a class="twm-nav-sign-up" data-bs-toggle="modal" href="#sign_up_popup2" role="button">
                                                <i class="feather-log-in"></i> 로그인
                                            </a>
                                        </c:if>
                                    </c:if>
                                </div>

                                <div class="twm-nav-btn-right">
                                    <!-- 세션에 유저 로그인 정보가 있는 경우에만 마이페이지를 표시 -->
                                    <c:if test="${not empty sessionScope.user_name}">
                                        <a href="mypage" class="twm-nav-post-a-job">
                                            <i class="feather-briefcase"></i> 마이페이지
                                        </a>
                                    </c:if>
                                </div>
                                <!-- 세션에 유저 로그인 정보가 있는 경우에만 유저이름을 표시 -->
                                <c:if test="${not empty sessionScope.user_name}">
                                    <p> 환영합니다. ${sessionScope.user_name} 님</p>
                                </c:if>
                                <!-- -------------------------------------------------------------------------- -->
                                <!--변호사 -->

                                <div class="twm-nav-btn-left">
                                    <!-- 세션에 변호사 로그인 정보가 있는 경우 -->
                                    <c:if test="${not empty sessionScope.lawyer_name}">
                                        <a href="${pageContext.request.contextPath}/lawyer/logoutLawyer" class="twm-nav-sign-up">
                                            <i class="feather-log-out"></i> 로그아웃
                                        </a>
                                    </c:if>

                                </div>
                                <div class="twm-nav-btn-right">
                                    <!-- 세션에 변호사 로그인 정보가 있는 경우에만 마이페이지를 표시 -->
                                    <c:if test="${not empty sessionScope.lawyer_name}">
                                        <a href="mypage" class="twm-nav-post-a-job">
                                            <i class="feather-briefcase"></i> 마이페이지
                                        </a>
                                    </c:if>
                                </div>
                                <!-- 세션에 로그인 정보가 있는 경우에만 변호사이름을 표시 -->
                                <c:if test="${not empty sessionScope.lawyer_name}">
                                    <p> 환영합니다. ${sessionScope.lawyer_name} 변호사님</p>
                                </c:if>
                            </div>
                        </div>
                    </div>



                </div>


            </div>

        </div>

    </header>
    <!-- HEADER END -->
    <!-- BUTTON TOP START -->
    <button class="scroltop"><span class="fa fa-angle-up  relative" id="btn-vibrate"></span></button>

    <!--Model Popup Section Start-->
    <!-- 폼 유효성 검사 -->
    <script src="../resources/join_login/vendors/jquery/jquery-3.2.1.min.js"></script>
    <script src="../resources/join_login/vendors/jquery.ajaxchimp.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
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
     $('#successBtn').click(function (event) {
                // 폼이 유효한지 검사
                if ($("#normal").valid()) {
                    // 유효한 경우 여기에 추가로 수행할 작업을 작성
                    // 예: AJAX 호출 등
                } else {
                    // 폼이 유효하지 않은 경우 메시지 표시
                    alert('폼이 유효하지 않습니다.');
                }
            });
    
            // '아이디 중복 확인' 버튼 클릭 시 이벤트 처리
            $('#idCheckButton').click(function (event) {
                event.preventDefault();
                // 여기에 아이디 중복 확인에 대한 로직을 추가
                // 예: AJAX 호출 등
                // AJAX를 통해 아이디 중복 확인 요청
                $.ajax({
                    url: '/member/insertMember', // 실제 서버 API 경로로 수정
                    method: 'POST',
                    data: { user_id: $('#user_id').val() }, // user_id 값을 가져와서 전송
                    success: function (response) {
                        if (response.duplicate) {
                            alert('이미 사용 중인 아이디입니다.');
                        } else {
                            alert('사용 가능한 아이디입니다.');
                            // 아이디 중복 확인이 성공했을 때 추가적인 로직을 수행할 수 있음
                            // 예: 회원가입 버튼 활성화, 다음 단계로 진행 등
                        }
                    },
                    error: function () {
                        alert('오류가 발생했습니다.');
                    }
                });
            });
        });
    </script>
    <script>

    </script>

 <!-- <script>

        $(document).ready(function () {
            
        
  // 아이디 중복 확인 및 이메일 형식 유효성 검사
  $('#idCheckButton').click(function () {
    // 이메일 형식 유효성 검사
    var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    var userId = $('input[name="user_id"]').val();

    if (!emailRegex.test(userId.trim())) {
      alert('유효한 이메일 주소를 입력해주세요.');
      return false;
    }

    // AJAX를 통해 아이디 중복 확인 요청
    $.ajax({
      url: '/member/insertMember', // 실제 서버 API 경로로 수정
      method: 'POST',
      data: { user_id: userId },
      success: function (response) {
        if (response.duplicate) {
          alert('이미 사용 중인 아이디입니다.');
        } else {
          alert('사용 가능한 아이디입니다.');
          // 아이디 중복 확인이 성공했을 때 추가적인 로직을 수행할 수 있음
          // 예: 회원가입 버튼 활성화, 다음 단계로 진행 등
        }
      },
      error: function () {
        alert('오류가 발생했습니다.');
      }
    });
  });
            // 가입 완료 버튼 클릭 시 이벤트 처리
            $('#successBtn').click(function (e) {
                 
                if (validateForm()) {
                    // e.preventDefault(); // 폼 제출의 기본 동작 막기
                    // 유효성 검사를 통과하면 AJAX를 사용해 회원가입 요청
                    $.ajax({
                        url: '/member/insertMember',
                        method: 'POST',
                        data: $('#normal').serialize(),
                        success: function (response) {
                            if (response.success) {
                                alert('회원가입이 성공적으로 완료되었습니다.');
                                // 페이지 이동 없이 유지할 내용을 처리
                                // ...
                            } else {
                                alert('회원가입에 실패했습니다. 다시 시도해주세요.');
                                // 실패 시 필요한 처리
                                // ...
                            }
                        },
                        error: function () {
                            alert('회원가입에 실패했습니다. 다시 시도해주세요.');
                            // 회원가입 실패 시 필요한 처리
                            // ...
                        }
                    });
                    
                }
            });
    
            // 유효성 검사 함수
            function validateForm(e) {
                var userName = $('#user_name').val();
                var userId = $('#user_id').val();
                var userPw = $('#user_pw').val();
                var userBirth = $('#user_birth').val();
                var userTel = $('#user_tel').val();
                var agree1 = $('#agree1').prop('checked');

                //userName.addEventListener('submit', validateForm);
                if (userName.trim() === '') {
                //     showModal('유효성 오류', '이름을 입력해주세요.');
                // e.preventDefault();
                    alert('이름을 입력해주세요.');
                    e.preventDefault();
                    return false; //함수종료
                }

                if (userId.trim() === '') {
                    alert('아이디를 입력해주세요.');
                    //event.preventDefault();
                    return false;
                }
   
    
                if (userPw.trim() === '') {
                    alert('비밀번호를 입력해주세요.');
                    //event.preventDefault();
                    return false;
                }
    
                if (userBirth.trim() === '') {
                    alert('생년월일을 입력해주세요.');
                    return false;
                }
    
                if (userTel.trim() === '') {
                    alert('전화번호를 입력해주세요.');
                    return false;
                }
    
                if (!agree1) {
                    alert('이용약관에 동의해주세요.');
                    return false;
                }
    
                return true;
            }
        });
    </script> -->
  
   <!-- <script>
    function validateForm() {
    // 이름, 아이디, 비밀번호, 생년월일, 전화번호, 이용약관에 대한 유효성 검사 수행
    return (
        validateName() &&
        validateId() &&
        validatePassword() &&
        validatePasswordMatch() &&
        validateBirth() &&
        validateTel() &&
        validateAgreement()
    );
}

function validateName() {
    var user_name = $("#user_name").val();
    if (!/^[가-힣]{1,20}$/.test(user_name.trim())) {
        alert("이름은 한글만 입력하여 20자 이하로 작성해야 합니다.");
        return false;
    }
    return true;
}

function validateId() {
    var userId = $("#user_id").val();
    if (!/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/.test(userId.trim())) {
        alert("유효한 이메일 주소를 입력해주세요.");
        return false;
    }
    return true;
}

function validatePassword() {
    var userPw = $("#user_pw").val();
    if (!/^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,30}$/.test(userPw.trim())) {
        alert("비밀번호는 영어, 숫자, 특수문자를 조합하여 8자 이상 30자 이하로 작성해야 합니다.");
        return false;
    }
    return true;
}
function validatePasswordMatch() {
    var userPw = $("#user_pw").val();
    var userPwck = $("#user_pwck").val();

    if (userPw.trim() !== userPwck.trim()) {
        alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
        return false;
    }
    return true;
}
function validateBirth() {
    var userBirth = $("#user_birth").val();
    if (userBirth.trim() === "") {
        alert("생년월일을 입력해주세요.");
        return false;
    }
    return true;
}

function validateTel() {
    var userTel = $("#user_tel").val();
    if (!/^[0-9-]+$/.test(userTel.trim())) {
        alert("전화번호는 숫자와 '-'만 사용하여 작성해야 합니다.");
        return false;
    }
    return true;
}

function validateAgreement() {
    var agree1 = $("#agree1").prop("checked");
    if (!agree1) {
        alert("이용약관에 동의해주세요.");
        return false;
    }
    return true;
}
   </script> -->
    <!--일반 회원가입 팝업 -->
    <div class="modal fade twm-sign-up" id="sign_up_popup" aria-hidden="true" aria-labelledby="sign_up_popupLabel" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <form action="/member/insertMember" method="post" id="normal" onsubmit="return validateForm(event);">

                    <div class="modal-header">
                        <h2 class="modal-title" id="sign_up_popupLabel">일반회원 회원가입</h2>
                        <p>FolLaw에 오신 것을 환영합니다.</p>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <div class="modal-body">
                        <div class="twm-tabs-style-2">
                            <ul class="nav nav-tabs" id="myTab" role="tablist">

                            </ul>
                            <div class="tab-content" id="myTabContent">
                                <!--Signup Candidate Content-->
                                <div class="tab-pane fade show active" id="sign-candidate">
                                    <div class="row">
                                        <!-- <form action="/member/insertMember" method="post" id="normal"> -->
                                        <div class="col-lg-12">
                                            <div class="form-group mb-3">
                                                이름
                                                <input name="user_name" id="user_name" type="text" required="" class="form-control">
                                            </div>
                                        </div>
                                        
                                        <div class="col-lg-12">
                                            <div class="form-group mb-3">
                                                아이디
                                                <input name="user_id" id="user_id" type="email" required="" class="form-control" placeholder="abc@naver.com" >
                                                <button type="button" id="idCheckButton" class="btn btn-primary">아이디 중복 확인</button>
                                            </div>
                                        </div>
                                        <!-- <div class="col-lg-12">
                                            <div class="form-group mb-3">
                                                <button type="button" id="idCheckButton" class="btn btn-primary">아이디 중복 확인</button>
                                            </div>
                                        </div> -->
                                        <div class="col-lg-12">
                                            <div class="form-group mb-3">
                                                비밀번호
                                                <input name="user_pw" id="user_pw" type="password" class="form-control" required="">
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="form-group mb-3">
                                                비밀번호 확인
                                                <input name="user_pwck" id="user_pwck" type="password" class="form-control" required="">
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="form-group mb-3">
                                                생년월일
                                                <input name="user_birth" id="user_birth" type="date" class="form-control" required="">
                                            </div>
                                        </div>

                                        <div class="col-lg-12">
                                            <div class="form-group mb-3">
                                                전화번호
                                                <input name="user_tel" id="user_tel" type="text" class="form-control" required="">
                                            </div>
                                        </div>

                                        <div class="col-lg-12">
                                            <div class="form-group mb-3">
                                                <div class=" form-check">
                                                    <input type="checkbox" class="form-check-input" id="agree1">
                                                    <label class="form-check-label" for="agree1"><a href="javascript:;" data-bs-toggle="modal" data-bs-target="#user_agreement" data-bs-dismiss="modal">이용약관</a>에 모두 동의합니다.</label>
                                                    <p>이미 회원이신가요?
                                                        <button class="twm-backto-login" data-bs-target="#sign_up_popup2" data-bs-toggle="modal" data-bs-dismiss="modal">로그인</button>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <button type="submit" id="successBtn" class="site-button">가입완료</button>
                                        </div>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>


                </form>
            </div>
        </div>

    </div>

    <!--변호사 회원가입 팝업zzzzz -->
    <!--연습 -->
    <div class="modal fade twm-sign-up" id="lawyer_sign_up_popup" aria-hidden="true" aria-labelledby="sign_up_popupLabel" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <form action="/lawyer/insertLawyer" method="post">

                    <div class="modal-header">
                        <h2 class="modal-title" id="sign_up_popupLabel">변호사 회원가입</h2>
                        <p>FolLaw에 오신 것을 환영합니다.</p>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <div class="modal-body">
                        <div class="twm-tabs-style-2">
                            <ul class="nav nav-tabs" id="myTab" role="tablist">

                            </ul>
                            <div class="tab-content" id="myTabContent">
                                <!--Signup Candidate Content-->
                                <div class="tab-pane fade show active" id="sign-candidate">
                                    <div class="row">

                                        <div class="col-lg-12">
                                            <div class="form-group mb-3">
                                                이름
                                                <input name="lawyer_name" type="text" required="" class="form-control">
                                            </div>
                                        </div>

                                        <div class="col-lg-12">
                                            <div class="form-group mb-3">
                                                아이디
                                                <input name="lawyer_id" type="text" required="" class="form-control" pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$" title="유효한 이메일 주소를 입력해주세요.">
                                            </div>
                                        </div>

                                        <div class="col-lg-12">
                                            <div class="form-group mb-3">
                                                비밀번호
                                                <input name="lawyer_pass" type="password" class="form-control" required="">
                                            </div>
                                        </div>

                                        <div class="col-lg-12">
                                            <div class="form-group mb-3">
                                                생년월일
                                                <input name="lawyer_birth" type="date" class="form-control" required="">
                                            </div>
                                        </div>

                                        <div class="col-lg-12">
                                            <div class="form-group mb-3">
                                                전화번호
                                                <input name="lawyer_tel" type="text" class="form-control" required="">
                                            </div>
                                        </div>

                                        <div class="col-lg-6">
                                            <div class="form-group mb-3">
                                                출신시험선택
                                                <select class="wt-select-box selectpicker" name="lawyer_exam" title="" id="j-category" data-bv-field="size">
                                                    <option class="bs-title-option" value="">시험선택</option>
                                                    <option>사법고시</option>
                                                    <option>변호사시험</option>
                                                    <option>군법무관 임용시험</option>
                                                    <option>고등고시</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="col-lg-6">
                                            <div class="form-group mb-3">
                                                시험회차
                                                <input name="lawyer_exam_num" type="text" class="form-control" required="">
                                            </div>
                                        </div>

                                        <div class="col-lg-6">
                                            <div class="form-group mb-3">
                                                변호사 증명서류 첨부
                                                <input type="file" name="myfile" id="file-uploader" accept=".pdf" >
                                            </div>
                                        </div>

                                        <div class="col-lg-12">
                                            <div class="form-group mb-3">
                                                <div class=" form-check">
                                                    <input type="checkbox" class="form-check-input" id="agree1">
                                                    <label class="form-check-label" for="agree1"><a href="javascript:;" data-bs-toggle="modal" data-bs-target="#user_agreement" data-bs-dismiss="modal">이용약관</a>에 모두 동의합니다.</label>
                                                    <p>이미 회원이신가요?
                                                        <button class="twm-backto-login" data-bs-target="#sign_up_popup2" data-bs-toggle="modal" data-bs-dismiss="modal">로그인</button>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12" >
                                            <button type="submit" class="site-button">가입완료</button>
                                        </div>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

               <!--      <div class="modal-footer">
                        <span class="modal-f-title">SNS연동 회원가입</span>
                        <ul class="twm-modal-social">
                            <li><a href="javascript" class="facebook-clr"><i class="fab fa-facebook-f"></i></a></li>
                            <li><a href="javascript" class="twitter-clr"><i class="fab fa-twitter"></i></a></li>
                            <li><a href="javascript" class="linkedin-clr"><i class="fab fa-linkedin-in"></i></a></li>
                            <li><a href="javascript" class="google-clr"><i class="fab fa-google"></i></a></li>
                        </ul>
                    </div> -->

                </form>
            </div>
        </div>

    </div>
    <!--이용약관-->
    <div class="modal fade twm-sign-up" id="user_agreement" aria-hidden="true" aria-labelledby="sign_up_popupLabel" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <div class="modal-header">
                    <h2 class="modal-title" id="sign_up_popupLabel">이용약관</h2>
                    <p>서비스 이용약관 및 개인정보 동의 약관</p>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <div class="modal-body">
                    <div class="twm-tabs-style-2">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">

                        </ul>
                        <div class="tab-content" id="myTabContent">
                            <!--Signup Candidate Content-->
                            <div class="tab-pane fade show active" id="sign-candidate">
                                <div class="row">

                                    <div class="col-lg-12">
                                        <div class="form-group mb-3">
                                            서비스 및 개인정보 이용약관
                                            <textarea name="useragreement" class="form-control" style="overflow-y: auto; height: 490px; "readonly>
㈜FolLaw은 개인정보보호법 등을 준수하여 회원들의 개인정보 취급방침을 공개합니다.

1. 수집하는 개인정보의 정의
   - 개인정보의 정의: 실명, 주민번호 등으로 식별 가능한 정보 포함

2. 개인정보수집 및 이용목적
   - 서비스 제공, 회원 관리, 자료분석, 마케팅 등 활용 목적

3. 개인정보의 파기 절차 및 방법
   - 보유기간 경과 시 일정 절차에 따라 파기됨

4. 개인정보의 제공
   - 제휴사 및 회원들에게 서비스 제공, 통계 작성 등 제공

5. 개인정보 수집방법
   - 회원가입, 상담요청글 게시, 채팅상담 등을 통한 수집, 쿠키 사용

㈜FolLaw의 서비스 이용약관을 공개합니다.                                                        

1. 서비스 개요
   - ㈜FolLaw(이하 "회사"라 함)은 법률정보 제공 및 변호사와의 화상, 텍스트 채팅 서비스를 제공합니다.
   - 본 서비스는 회사의 웹사이트 또는 모바일 애플리케이션을 통해 이용할 수 있습니다.
                                                        
2. 서비스 이용자의 권리와 의무
   - 회원은 회사의 서비스를 이용함에 있어서 관련 법령과 이용약관에 따라야 합니다.
   - 회원은 타인의 정보를 도용하거나 부정한 목적으로 서비스를 이용해서는 안 됩니다.
   - 회원은 회사의 서비스를 이용하여 얻은 법률정보를 상업적으로 이용하거나 제3자에게 제공하는 행위를 금지합니다.
   - 회원은 회사의 서비스를 이용하여 법률적인 조언을 받을 경우, 변호사의 의견을 잘 듣고 필요한 조치를 취해야 합니다.
                                                        
3. 서비스 이용료와 결제
   - 회사의 서비스 이용은 일부 유료로 제공될 수 있습니다.
   - 이용자는 회사가 제공하는 결제 방법을 통해 서비스 이용료를 납부해야 합니다.
   - 결제와 관련된 세부 사항은 회사의 결제 정책에 따릅니다.
                                                        
4. 개인정보 보호
   - 회사는 이용자의 개인정보를 적절히 보호하기 위해 노력합니다.
   - 회사는 개인정보 처리에 대한 자세한 내용을 개인정보 처리방침에서 안내합니다.
                                                        
5. 서비스 제공 중지 및 해지
   - 회사는 서비스의 제공을 중지하거나 이용자의 회원 자격을 해지할 수 있습니다.
   - 이용자는 언제든지 회원 자격 해지를 요청할 수 있습니다.
                                                        
6. 책임의 한계
   - 회사는 법률정보의 정확성, 완전성, 신뢰성 등에 대한 어떠한 보증도 하지 않습니다.
   - 회사는 이용자가 서비스를 이용함으로써 입게 되는 어떠한 손해에 대해서도 책임을 지지 않습니다.
                                                        
7. 그 외
   - 본 약관은 한국법에 따라 해석되고 적용됩니다.
   - 본 약관에 명시되지 않은 사항은 관련 법령 및 회사의 개인정보 처리방침에 따릅니다.
                                                    </textarea>
                                            <br/>
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <button class="site-button" data-bs-target="#sign_up_popup" data-bs-toggle="modal" data-bs-dismiss="modal">확인</button>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </div>

    </div>
  
        </script>
  
    
    <!--Model Popup Section End-->

</body>
</html>
