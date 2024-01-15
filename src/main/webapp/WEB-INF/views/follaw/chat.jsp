<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script>
</script>
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
    <title>FolLaw | 채팅상담</title>
    
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

    <!-- THEME COLOR CHANGE STYLE SHEET -->
    <link rel="stylesheet" class="skin" type="text/css" href="${pageContext.request.contextPath}/css/skins-type/skin-6.css">
       
    
</head>

<body>

    <!--Header, 페이지로딩-->
    <%@include file="header_loading.jsp" %>

      
<!--CONTENT START-->
        
<div class="page-content">
        
    <!-- INNER PAGE BANNER -->
    <div class="wt-bnr-inr overlay-wraper bg-center" style="background-image:url(images/banner/1.jpg);">
      <div class="overlay-main site-bg-white opacity-01"></div>
      <div class="container">
          <div class="wt-bnr-inr-entry">
              <div class="banner-title-outer">
                  <div class="banner-title-name">
                      <h2 class="wt-title">변호사 검색</h2>
                  </div>
              </div>
              <!-- BREADCRUMB ROW -->                            
              
                  <div>
                      <ul class="wt-breadcrumb breadcrumb-style-2">
                          <li><a href="index.html">검색</a></li>
                          <li>변호사 검색</li>
                      </ul>
                  </div>
              
              <!-- BREADCRUMB ROW END -->                        
          </div>
      </div>
  </div>
  <!-- INNER PAGE BANNER END -->

    <div class="row" style="margin: 100px auto 50px; width: 1000px;">
        <input type="hidden" value="${sessionScope.lawyer_id}" id="lawyer_id"/>
        <input type="hidden" value="${sessionScope.lawyer_name}" id="lawyer_name"/>
        <input type="hidden" value="${sessionScope.auth_idx}" id="auth_idx"/>
        <input type="hidden" value="${sessionScope.user_id}" id="user_id"/>
        <input type="hidden" value="${sessionScope.user_name}" id="user_name"/>

        ${sessionScope.lawyer_name}

        <div>
            <button class="site-button twm-view-prifile site-text-primary" data-bs-toggle="modal" data-bs-target="#lawyer_popup" style="position: relative; left: 750px; width: 200px;">상담 신청하기</button>
        </div>

        <!--Block one-->
        <div class="col-lg-6 col-md-12 m-b30">

            <div class="twm-jobs-grid-style1">
                <div class="twm-mid-content">
                    <p class="twm-job-title">
                        <h4 class="roomName">123</h4>
                        <button type="submit" onclick="lawyerGenerateTokenAndRedirect(this)" class="site-button inBtn" style="position: relative; left: 340px;">참가</button>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-lg-6 col-md-12 m-b30">

            <div class="twm-jobs-grid-style1">
                <div class="twm-mid-content">
                    <p class="twm-job-title roomName">
                        <h4 class="roomName">222</h4>
                        <button type="submit" onclick="lawyerGenerateTokenAndRedirect(this)" class="site-button inBtn" style="position: relative; left: 340px;">참가</button>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<!--상담팝업-->

<div class="modal fade twm-sign-up" id="lawyer_popup" aria-hidden="true" aria-labelledby="lawyer_popup1" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h2 class="modal-title" id="lawyer_popup1">방 생성하기</h2>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="twm-candidates-grid-style1 mb-5" style="height: 270px; width: 500px; margin: 0 auto;">
                    <br/>
                    <form method="post">
                        <br/>
                        <input type="text" class="form-control" placeholder="방 이름을 작성하세요." style="text-align: center;" name="roomName" id="roomName">
                        <br/>
                        <button type="submit" class="site-button" style="position: relative; left: 360px; width: auto;" id="chatRoomNameBtn" onclick=userGenerateTokenAndRedirect()>생성</button>
                    </form>
                </div>
            </div>    
        </div>
    </div>
</div>
<!--상담팝업 END-->
        
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
<script  src="${pageContext.request.contextPath}/js/candidate_chat.js"></script>



</body>

</html>
