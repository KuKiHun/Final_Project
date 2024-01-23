<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
        <style>
        /* 웹 폰트 추가 */
        @font-face {
            font-family: 'Nanum Square Neo';
            src: url('${pageContext.request.contextPath}/fonts/NanumSquareNeoTTF-bRg.woff2') format('woff2'),
                 url('${pageContext.request.contextPath}/fonts/NanumSquareNeoTTF-bRg.woff') format('woff'),
                 url('${pageContext.request.contextPath}/fonts/NanumSquareNeoTTF-bRg.eot');
            font-weight: normal;
            font-style: normal;
        }
        
        /* 상단 스타일 덮어쓰기 */
        body {
            font-family: 'Nanum Square Neo', sans-serif !important;
        }
    </style>
<!-- 제이쿼리 CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.ajaxchimp/1.3.0/jquery.ajaxchimp.min.js"></script>

    <!-- META -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="keywords" content="" />
    <meta name="author" content="" />
    <meta name="robots" content="" />
    <meta name="description" content="" />
    
    <!-- FAVICONS ICON -->
    <link rel="icon" href="images/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.png" />
    
    <!-- PAGE TITLE HERE -->
    <title>FolLaw | 일반회원가입</title>
    
    <!-- MOBILE SPECIFIC -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Resource -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css"><!-- BOOTSTRAP STYLE SHEET -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/font-awesome.min.css"><!-- FONTAWESOME STYLE SHEET -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/feather.css"><!-- FEATHER ICON SHEET -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/owl.carousel.min.css"><!-- OWL CAROUSEL STYLE SHEET -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/magnific-popup.min.css"><!-- MAGNIFIC POPUP STYLE SHEET -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/lc_lightbox.css"><!-- Lc light box popup -->     
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-select.min.css"><!-- BOOTSTRAP SLECT BOX STYLE SHEET  -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dataTables.bootstrap5.min.css"><!-- DATA table STYLE SHEET  -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/select.bootstrap5.min.css"><!-- DASHBOARD select bootstrap  STYLE SHEET  -->     
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dropzone.css"><!-- DROPZONE STYLE SHEET -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/scrollbar.css"><!-- CUSTOM SCROLL BAR STYLE SHEET -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/datepicker.css"><!-- DATEPICKER STYLE SHEET -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/flaticon.css"> <!-- Flaticon -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/swiper-bundle.min.css"><!-- Swiper Slider -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css"><!-- MAIN STYLE SHEET -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0/css/bootstrap-select.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0/js/bootstrap-select.min.js"></script>
    <!-- THEME COLOR CHANGE STYLE SHEET -->
    <link rel="stylesheet" class="skin" type="text/css" href="${pageContext.request.contextPath}/css/skins-type/skin-6.css">


</head>

<body>

    <!--Header, 페이지로딩-->
    <%@include file="header_loading.jsp" %>

      
<!--CONTENT START-->
        
        <div class="page-content">

            
            <!-- INNER PAGE BANNER -->
            <div class="wt-bnr-inr overlay-wraper bg-center" style="background-image:url(${pageContext.request.contextPath}/images/banner/1.jpg);">
               <div class="overlay-main site-bg-white opacity-01"></div>
                <div class="container">
                    <div class="wt-bnr-inr-entry">
                       <div class="banner-title-outer">
                           <div class="banner-title-name">
                              <h2 class="wt-title">일반회원가입</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- INNER PAGE BANNER END -->  
                  
            <!-- EXPLORE NEW LIFE START -->
            </div class="section-full p-t60 p-b120 twm-explore-area bg-cover">
                <!-- Basic Information -->
                <div class="panel panel-default">
                    <br />
                    <div class="container">
                        <div class="row d-flex justify-content-center">
                            <div class="col-lg-8 col-md-12">
                                <div class="twm-right-section-panel-wrap2">
                                    <!-- Filter Short By -->
                                    <div class="twm-right-section-panel site-bg-primary">
                                        <!-- Basic Information -->
                                        <div class="panel panel-default">
                                            <div class="panel-body wt-panel-body p-a20">
                                                <div class="twm-tabs-style-1">
                                                    <div class="row">
                                                        <form action="/member/insertMember" method="post" id="normal">
                                                            <div class="col-lg-12">
                                                                <div class="form-group mb-3">
                                                                    <label for="user_name">이름</label>
                                                                    <input id="user_name" name="user_name" type="text" required="" class="form-control">
                                                                </div>
                                                            </div>
            
                                                            <div class="col-lg-12">
                                                                <div class="form-group mb-3">
                                                                    <label for="user_id">아이디</label>
                                                                    <input id="user_id" name="user_id" type="email" required="" class="form-control" placeholder="abc@naver.com">
                                                                    <button type="button" id="idCheckButton" class="btn btn-primary">아이디 중복 확인</button>
                                                                </div>
                                                            </div>
            
                                                            <div class="col-lg-12">
                                                                <div class="form-group mb-3">
                                                                    <label for="user_pw">비밀번호</label>
                                                                    <input id="user_pw" name="user_pw" type="password" class="form-control" required="">
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-12">
                                                                <div class="form-group mb-3">
                                                                    <label for="user_pwck">비밀번호 확인</label>
                                                                    <input name="user_pwck" id="user_pwck" type="password" class="form-control" required="">
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-12">
                                                                <div class="form-group mb-3">
                                                                    <label for="user_birth">생년월일</label>
                                                                    <input id="user_birth" name="user_birth" type="date" class="form-control" required="">
                                                                </div>
                                                            </div>
            
                                                            <div class="col-lg-12">
                                                                <div class="form-group mb-3">
                                                                    <label for="user_tel">전화번호</label>
                                                                    <input id="user_tel" name="user_tel" type="text" class="form-control" required="">
                                                                </div>
                                                            </div>
            
                                                            <div class="col-lg-12">
                                                                <div class="form-group mb-3">
                                                                    <div class="form-check">
                                                                        <input type="checkbox" class="form-check-input" id="agree1">
                                                                        <label class="form-check-label" for="agree1"><a href="javascript:;" data-bs-toggle="modal" data-bs-target="#user_agreement" data-bs-dismiss="modal" style="font-weight: bolder;">이용약관</a>에 모두 동의합니다.</label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="text-center">
                                                                <button type="submit" id="successBtn" class="site-button">가입완료</button>
                                                            </div>
                                                        </div>
                                                        <!-- 회원가입 END -->
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- EXPLORE NEW LIFE END -->
            <!-- 유효성 검사 -->
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
            e.preventDefault(); // 기본 동작인 새로고침 막기
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
                
                return false; //함수종료
            }

            if (userId.trim() === '') {
                alert('아이디를 입력해주세요.');
              
                return false;
            }


            if (userPw.trim() === '') {
                alert('비밀번호를 입력해주세요.');
                
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
<!--CONTENT END-->
        
        
    <!--Footer, 로그인 회원가입 팝업-->
    <%@include file="footer.jsp" %>

    </div>



<!-- JAVASCRIPT  FILES ========================================= --> 
<script  src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script><!-- JQUERY.MIN JS -->
<script  src="${pageContext.request.contextPath}/js/popper.min.js"></script><!-- POPPER.MIN JS -->
<script  src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script><!-- BOOTSTRAP.MIN JS -->
<script  src="${pageContext.request.contextPath}/js/magnific-popup.min.js"></script><!-- MAGNIFIC-POPUP JS -->
<script  src="${pageContext.request.contextPath}/js/waypoints.min.js"></script><!-- WAYPOINTS JS -->
<script  src="${pageContext.request.contextPath}/js/counterup.min.js"></script><!-- COUNTERUP JS -->
<script  src="${pageContext.request.contextPath}/js/waypoints-sticky.min.js"></script><!-- STICKY HEADER -->
<script  src="${pageContext.request.contextPath}/js/isotope.pkgd.min.js"></script><!-- MASONRY  -->
<script  src="${pageContext.request.contextPath}/js/imagesloaded.pkgd.min.js"></script><!-- MASONRY  -->
<script  src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script><!-- OWL  SLIDER  -->
<script  src="${pageContext.request.contextPath}/js/theia-sticky-sidebar.js"></script><!-- STICKY SIDEBAR  -->
<script  src="${pageContext.request.contextPath}/js/lc_lightbox.lite.js" ></script><!-- IMAGE POPUP -->
<script  src="${pageContext.request.contextPath}/js/bootstrap-select.min.js"></script><!-- Form js -->
<script  src="${pageContext.request.contextPath}/js/dropzone.js"></script><!-- IMAGE UPLOAD  -->
<script  src="${pageContext.request.contextPath}/js/jquery.scrollbar.js"></script><!-- scroller -->
<script  src="${pageContext.request.contextPath}/js/bootstrap-datepicker.js"></script><!-- scroller -->
<script  src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js"></script><!-- Datatable -->
<script  src="${pageContext.request.contextPath}/js/dataTables.bootstrap5.min.js"></script><!-- Datatable -->
<script  src="${pageContext.request.contextPath}/js/chart.js"></script><!-- Chart -->
<script  src="${pageContext.request.contextPath}/js/bootstrap-slider.min.js"></script><!-- Price range slider -->
<script  src="${pageContext.request.contextPath}/js/swiper-bundle.min.js"></script><!-- Swiper JS -->
<script  src="${pageContext.request.contextPath}/js/custom.js"></script><!-- CUSTOM FUCTIONS  -->
<script  src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script  src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script  src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
<script  src="${pageContext.request.contextPath}/js/sign-up.js"></script><!-- CUSTOM FUCTIONS  -->





</body>

</html>