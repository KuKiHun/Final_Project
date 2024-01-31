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
    <link rel="icon" href="${pageContext.request.contextPath}/images/favicon.png" type="image/x-icon" />
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.png" />
    
    <!-- PAGE TITLE HERE -->
    <title>FolLaw | 회사소개</title>
    
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
    <%@include file="../header_loading.jsp" %>

      
<!--CONTENT START-->
<div class="page-content">
    <!-- INNER PAGE BANNER -->
    <div class="wt-bnr-inr overlay-wraper bg-center" style="background-image: url(images/banner/1.jpg)">
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

    <div class="section-full p-t120  site-bg-white bg-cover twm-ac-fresher-wrap" style="background-image:url(images/background/pattern.jpg)">
                

        <div class="container">
            <div class="row d-flex justify-content-center">
                
                <div class="col-lg-8 col-md-12">
                    <div class="twm-right-section-panel-wrap2">
                        <!--Filter Short By-->
                        <div class="twm-right-section-panel site-bg-primary" style="height: 150%;">
                            
                            <!--Basic Information-->
                            <div class="panel panel-default">
                                <div class="panel-heading wt-panel-heading p-a20">
                                    <h4 class="panel-tittle m-a0">상담글 작성</h4>
                                </div>
                                <div class="panel-body wt-panel-body p-a20 ">

                                    <!-- <form action="/board/insertCounselBoard" method="get"> -->

                                    <div class="twm-tabs-style-1">
                                    
                                        <div>
                                            <div class="col-lg-6">
                                                <div class="form-group mb-3">
                                                    <label>카테고리</label>
                                                    <div class="dropdown bootstrap-select wt-select-box">
                                                        <select class="wt-select-box selectpicker" name="law_field" id="j-category" data-bv-field="size" tabindex="null">
                                                            <option class="bs-title-option">카테고리</option>
                                                            <c:forEach var="lawFields" items="${lawFieldList}">
                                                                <option value="${lawFields.field_idx}">${lawFields.field_name}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="col-xl-12 col-lg-12 col-md-12">
                                                <div class="form-group">
                                                    <label>제목</label>
                                                    <div class="ls-inputicon-box"> 
                                                        <input class="form-control" id="counselTitle" name="board_title" type="text" placeholder="1개의 질문을 구체적으로 입력해주세요." required>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>내용(200자 이상*)</label>
                                                    <textarea class="form-control" id="counselContent" name="board_content" rows="3" placeholder="시간 순서에 따라 구체적으로 설명해주세요." required></textarea>
                                                </div>
                                            </div>                        

                                            <div class="form-control col-md-12" style="height: auto; margin-bottom: 30px; --bs-gutter-x: 0rem;">
                                                <div class="form-group">
                                                    <p>상담글 등록 전 필수 안내사항</p>
                                                    <div>
                                                        <li>상담글 제목은 답변을 받기에 적합한 내용으로 일부 변경될 수 있습니다.</li>
                                                        <li>상담글에 변호사 답변 등록시 글 삭제가 불가합니다.</li>
                                                        <li>등록된 글은 네이버 지식인, 포털 사이트, 로톡 사이트에 내용이 공개됩니다.</li>
                                                        <li>아래 사항에 해당할 경우, 서비스 이용이 제한될 수 있습니다.</li>
                                                        <div class="indent" style="margin-left: 20px;">
                                                        <li>개인정보(개인/법인 실명, 전화번호, 주민번호, 주소, 아이디 등) 및 외부 링크 포함</li>
                                                        <li>변호사 선임 및 변호사 선임 비용과 관련된 질문 포함</li>
                                                        <li>법률 문제 해결을 목적의 상담글이 아닌 경우</li>
                                                        <li>동일/유사한 내용의 게시물을 지속적으로 반복 게재</li>
                                                        <li>의미없는 문자의 나열 포함</li>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div>
                                                    <input type="checkbox" id="noticeAgreement">
                                                    <label for="noticeAgreement" class="question-compose__notice-agreement-text">안내 사항을 모두 확인했으며, 동의합니다.</label>
                                                </div>
                                            </div>

                                        
                                                            
                                            <div class="col-xl-12 col-lg-12 col-md-12">
                                                <div class="text-center">
                                                     <button type="submit" class="site-button" id="insertCounselBtn">등록하기</button>
                                                </div>
                                            </div> 
                                                                                                                               
                                        </div>
                                        
                                    </div>  
                                <!-- </form> -->

                                </div>
                            </div>
                            
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <span class="twm-section-bg-img2">
            <img src="images/apply-job-bg.png" alt="">
        </span>

    </div>
        
<!--CONTENT END-->
        
        
    <!--Footer, 로그인 회원가입 팝업-->
    <%@include file="../footer.jsp" %>

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
<script src="${pageContext.request.contextPath}/js/counselWriting.js"></script>




</body>

</html>
