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
<script>
    var user_id = '<%= session.getAttribute("user_id")%>'

    console.log("counsel/user_id : " + user_id);
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
    <%@include file="header_loading.jsp" %>

      
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
        
    <div class="section-full p-t120  p-b90 site-bg-white" style="transform: none;">
                

    <div class="container" style="transform: none;">
        <div class="row" style="transform: none;">
        </div>
            <div class="col-lg-10 col-md-12">
                <!--Filter Short By-->
                <div class="product-filter-wrap d-flex justify-content-between align-items-center m-b30">
                    <span class="woocommerce-result-count-left">Showing 2,150 jobs</span>
                   
                    <form class="woocommerce-ordering twm-filter-select" method="get">
                        <span class="woocommerce-result-count">Short By</span>
                        <div class="dropdown bootstrap-select wt-select-bar-2"><select class="wt-select-bar-2 selectpicker" data-live-search="true" data-bv-field="size">
                            <option>Most Recent</option>
                            <option>Freelance</option>
                            <option>Full Time</option>
                            <option>Internship</option>
                            <option>Part Time</option>
                            <option>Temporary</option>
                        </select>
                        <div class="dropdown-menu ">
                            <div class="bs-searchbox">
                                <input type="search" class="form-control" autocomplete="off" role="combobox" aria-label="Search" aria-controls="bs-select-2" aria-autocomplete="list"></div><div class="inner show" role="listbox" id="bs-select-2" tabindex="-1"><ul class="dropdown-menu inner show" role="presentation"></ul></div></div></div>
                        <div class="dropdown bootstrap-select wt-select-bar-2">
                            <select class="wt-select-bar-2 selectpicker" data-live-search="true" data-bv-field="size">
                            <option>Show 10</option>
                            <option>Show 20</option>
                            <option>Show 30</option>
                            <option>Show 40</option>
                            <option>Show 50</option>
                            <option>Show 60</option>
                        </select>
                        <div class="dropdown-menu ">
                            <div class="bs-searchbox"><input type="search" class="form-control" autocomplete="off" role="combobox" aria-label="Search" aria-controls="bs-select-3" aria-autocomplete="list"></div><div class="inner show" role="listbox" id="bs-select-3" tabindex="-1"><ul class="dropdown-menu inner show" role="presentation"></ul></div></div></div>
                    </form>

                </div>

                <div class="twm-employer-list-wrap">
                    <ul>
                         <li>
                             <div class="twm-employer-list-style1 mb-5">
                                 <div class="twm-mid-content" style="padding: 0px;">
                                     <a href="counselWrite" class="twm-job-title">
                                         <h4>Herbal Ltd</h4>
                                     </a>
                                     <p class="twm-job-address">1363-1385 Sunset Blvd Los Angeles, CA 90026, USA</p>
                                     <a href="employer-detail.html" class="twm-job-websites site-text-primary">Accountancy</a>
                                 </div>
                                 <div class="twm-right-content">
                                     <div class="twm-jobs-vacancies"><span>25</span>Vacancies</div>
                                 </div>
                             </div>
                         </li>                        
                    </ul>
                </div>

                <div class="pagination-outer">
                    <div class="pagination-style1">
                        <ul class="clearfix">
                            <li class="prev"><a href="javascript:;"><span> <i class="fa fa-angle-left"></i> </span></a></li>
                            <li><a href="javascript:;">1</a></li>
                            <li class="active"><a href="javascript:;">2</a></li>
                            <li><a href="javascript:;">3</a></li>
                            <li><a class="javascript:;" href="javascript:;"><i class="fa fa-ellipsis-h"></i></a></li>
                            <li><a href="javascript:;">5</a></li>
                            <li class="next"><a href="javascript:;"><span> <i class="fa fa-angle-right"></i> </span></a></li>
                        </ul>
                    </div>
                </div>

                <!-- <button class="site-button twm-view-prifile site-text-primary" data-bs-toggle="modal" data-bs-target="#lawyer_popup" style="position: relative; left: 750px; width: 200px;">상담 글쓰기</button> -->
                <div style="margin: 100px auto 50px; width: 1000px;">                                   
                    <div>
                        <!-- <a href="counselWriting"> -->
                            <button class="site-button twm-view-prifile site-text-primary" id="insertCounselBtn" style="position: fixed;right: 200px;bottom: 100px;">상담글 쓰기</button>
                        <!-- </a> -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
        
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
<!-- CUSTOM FUCTIONS  -->
<script src="${pageContext.request.contextPath}/js/counsel.js"></script>




</body>

</html>
