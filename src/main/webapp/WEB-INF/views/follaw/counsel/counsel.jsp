<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
    <link rel="icon" href="${pageContext.request.contextPath}/images/favicon.png" type="image/x-icon" />
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.png" />
    
    <!-- PAGE TITLE HERE -->
    <title>FolLaw | 지식인상담</title>
    
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
            <div class="wt-bnr-inr overlay-wraper bg-center" style="background-image:url(${pageContext.request.contextPath}/images/banner/1.jpg);">
                <div class="overlay-main site-bg-white opacity-01"></div>
                <div class="container">
                    <div class="wt-bnr-inr-entry">
                        <div class="banner-title-outer">
                            <div class="banner-title-name">
                                <h2 class="wt-title">지식인상담</h2>
                            </div>
                        </div>                      
                    </div>
                </div>
            </div>
            <!-- INNER PAGE BANNER END -->
        
    <div class="section-full p-t120  p-b90 site-bg-white" style="transform: none;">
                

    <div class="container" style="transform: none; max-width: min-content; display: flex; justify-content: center;">
        <div class="row" style="transform: none;">
        </div>
            <div class="col-lg-10 col-md-12">
                <!--Filter Short By-->
                <div>
                <h5><div class="flaticon-search-interface-symbol" style="color: blue;"><span style="color: black; position: absolute;">&nbsp;&nbsp;카테고리 검색</span></div></h5>
                <div class="product-filter-wrap d-flex justify-content-between align-items-center m-b30">
                    <form class="woocommerce-ordering twm-filter-select" method="get">
                            <select class="wt-select-bar-2 selectpicker" id="category" data-live-search="true" data-bv-field="size">
                                <option value="카테고리">카테고리</option>
                                <c:forEach var="lawField" items="${lawFieldList}">
                                    <option value="${lawField.field_idx}">${lawField.field_name}</option>
                                </c:forEach>
                            </select>
                            <div class="dropdown-menu ">
                                <div class="bs-searchbox">
                                    <input type="search" class="form-control" autocomplete="off" role="combobox" aria-label="Search" aria-controls="bs-select-2" aria-autocomplete="list">
                                </div>
                                <div class="inner show" role="listbox" id="bs-select-2" tabindex="-1">
                                    <ul class="dropdown-menu inner show" role="presentation"></ul>
                                </div>
                            </div>
                    </form>


                </div>
            </div>
                
                <c:forEach items="${counselTotalList}" var="counselBoard">
                    <div class="twm-employer-list-wrap">
                        <ul>
                            <li>
                                <div class="twm-employer-list-style1 mb-5">
                                    <div class="twm-mid-content" style="padding: 0px;">
                                        <a href="/follaw/counsel/counsel/view/${counselBoard.board_idx}" class="twm-job-title">
                                            <p>${counselBoard.field_name}</p>
                                            <h4 style="margin-bottom: 15px; font-weight: 600;">${counselBoard.board_title}</h4>
                                        <p class="twm-job-address">${fn:substring(counselBoard.board_content, 0, 100)}...</p>
                                        <p>변호사 답변 총 &nbsp;<span style="color: #1967d2;">${counselBoard.board_reply_count}건</span></p>
                                        <p style="margin-bottom: 0px; font-size: 10px;">조회수 ${counselBoard.board_count}</p>
                                        </a>
                                    </div>
                                </div>
                            </li>                        
                        </ul>
                    </div>
                </c:forEach>

                <div class="pagination-outer" style="padding-bottom: 20px; justify-content: center; display: flex;">
                    <div class="pagination-style1">
                        <ul class="clearfix">
                            <c:if test="${not empty pagingList}">
                                <li class="prev">
                                    <a href="${pageContext.request.contextPath}/follaw/counsel/counsel/${min}">
                                        <span> <i class="fa fa-angle-left"></i> </span>
                                    </a>
                                </li>
                            </c:if>
                            <c:forEach items="${pagingList}" var="pageNo">
                                <li class="page-${pageNo}">
                                    <a href="${pageContext.request.contextPath}/follaw/counsel/counsel/${pageNo}">${pageNo}</a>
                                </li>
                            </c:forEach>
                            <c:if test="${not empty pagingList}">
                                <li class="next">
                                    <a href="${pageContext.request.contextPath}/follaw/counsel/counsel/${max}">
                                        <span> <i class="fa fa-angle-right"></i> </span>
                                    </a>
                                </li>
                            </c:if>
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
    <%@include file="../footer.jsp" %>




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
