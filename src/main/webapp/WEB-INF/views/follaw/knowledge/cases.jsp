<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <style>
        /* 웹 폰트 추가 */        @font-face {
            font-family: 'Nanum Square Neo';
            src: url('${pageContext.request.contextPath}/fonts/NanumSquareNeoTTF-bRg.woff2') format('woff2'),
            url('${pageContext.request.contextPath}/fonts/NanumSquareNeoTTF-bRg.woff') format('woff'),
            url('${pageContext.request.contextPath}/fonts/NanumSquareNeoTTF-bRg.eot');
            font-weight: normal;
            font-style: normal;
        }

        /* 상단 스타일 덮어쓰기 */        body {
            font-family: 'Nanum Square Neo', sans-serif !important;
        }
    </style>
    <!-- 제이쿼리 CDN -->    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/elasticsearch_cases.js">
    </script>    <!-- META -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="keywords" content=""/>
    <meta name="author" content=""/>
    <meta name="robots" content=""/>
    <meta name="description" content=""/>

    <!-- FAVICONS ICON -->
    <link rel="icon" href="images/favicon.ico" type="image/x-icon"/>
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.png"/>

    <!-- PAGE TITLE HERE -->
    <title>FolLaw | 판례검색</title>

    <!-- MOBILE SPECIFIC -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Resource -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <!-- BOOTSTRAP STYLE SHEET -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <!-- FONTAWESOME STYLE SHEET -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/feather.css">
    <!-- FEATHER ICON SHEET -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
    <!-- OWL CAROUSEL STYLE SHEET -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/magnific-popup.min.css">
    <!-- MAGNIFIC POPUP STYLE SHEET -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/lc_lightbox.css">
    <!-- Lc light box popup -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-select.min.css">
    <!-- BOOTSTRAP SLECT BOX STYLE SHEET  -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dataTables.bootstrap5.min.css">
    <!-- DATA table STYLE SHEET  -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/select.bootstrap5.min.css">
    <!-- DASHBOARD select bootstrap  STYLE SHEET  -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dropzone.css">
    <!-- DROPZONE STYLE SHEET -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/scrollbar.css">
    <!-- CUSTOM SCROLL BAR STYLE SHEET -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/datepicker.css">
    <!-- DATEPICKER STYLE SHEET -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/flaticon.css"> <!-- Flaticon -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/swiper-bundle.min.css">
    <!-- Swiper Slider -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <!-- MAIN STYLE SHEET -->

    <!-- THEME COLOR CHANGE STYLE SHEET -->    <link rel="stylesheet" class="skin" type="text/css"
                                                     href="${pageContext.request.contextPath}/css/skins-type/skin-6.css">


</head>

<body>

<!--Header, 페이지로딩-->
<%@include file="../header_loading.jsp" %>


<!--CONTENT START-->

<!--여기에 CONTENT--><div class="page-content">

    <!-- INNER PAGE BANNER -->
            <!-- INNER PAGE BANNER -->
            <div class="wt-bnr-inr overlay-wraper bg-center" style="background-image:url(${pageContext.request.contextPath}/images/banner/1.jpg);">
                <div class="overlay-main site-bg-white opacity-01"></div>
                <div class="container">
                    <div class="wt-bnr-inr-entry">
                        <div class="banner-title-outer">
                            <div class="banner-title-name">
                                <h2 class="wt-title">키워드 검색 결과</h2>
                            </div>
                        </div>                      
                    </div>
                </div>
            </div>
            <!-- INNER PAGE BANNER END -->


    <!-- OUR BLOG START -->    <div class="section-full p-t120  p-b90 site-bg-white">


    <div class="container">
        <div class="row">

            <div class="col-lg-4 col-md-12 rightSidebar">

                <div class="side-bar">

                    <div class="sidebar-elements search-bx">

                        <form>

                            <div class="form-group mb-4">
                                <h4 class="section-head-small mb-4">Category</h4>
                                <select class="wt-select-bar-large selectpicker" data-live-search="true"
                                        data-bv-field="size" id="searchCategory">
                                    <option value="None" selected>전체 카테고리</option>
                                    <option value="name">사건명</option>
                                    <option value="number">판례일련번호</option>
                                    <option value="date">선고일자</option>
                                </select>
                            </div>

                            <div class="form-group mb-4">
                                <h4 class="section-head-small mb-4">Keyword</h4>
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Job Title or Keyword">
                                    <button class="btn" type="button"><i class="feather-search"></i></button>
                                </div>
                            </div>

                            <div class="twm-sidebar-ele-filter">
                                <h4 class="section-head-small mb-4">연도별</h4>
                                <ul>                                        <li>
                                    <div class=" form-check">
                                        <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">Freelance</label>
                                    </div>
                                    <span class="twm-job-type-count">09</span>
                                </li>

                                    <li>                                            <div class=" form-check">
                                        <input type="checkbox" class="form-check-input" id="exampleCheck2">
                                        <label class="form-check-label" for="exampleCheck2">Full Time</label>
                                    </div>
                                        <span class="twm-job-type-count">07</span>
                                    </li>

                                    <li>                                            <div class=" form-check">
                                        <input type="checkbox" class="form-check-input" id="exampleCheck3">
                                        <label class="form-check-label" for="exampleCheck3">Internship</label>
                                    </div>
                                        <span class="twm-job-type-count">15</span>
                                    </li>

                                    <li>                                            <div class=" form-check">
                                        <input type="checkbox" class="form-check-input" id="exampleCheck4">
                                        <label class="form-check-label" for="exampleCheck4">Part Time</label>
                                    </div>
                                        <span class="twm-job-type-count">20</span>
                                    </li>

                                    <li>                                            <div class=" form-check">
                                        <input type="checkbox" class="form-check-input" id="exampleCheck5">
                                        <label class="form-check-label" for="exampleCheck5">Temporary</label>
                                    </div>
                                        <span class="twm-job-type-count">22</span>
                                    </li>

                                    <li>                                            <div class=" form-check">
                                        <input type="checkbox" class="form-check-input" id="exampleCheck6">
                                        <label class="form-check-label" for="exampleCheck6">Volunteer</label>
                                    </div>
                                        <span class="twm-job-type-count">25</span>
                                    </li>

                                </ul>
                            </div>

                            <div class="twm-sidebar-ele-filter">
                                <h4 class="section-head-small mb-4">사건 종류별</h4>
                                <ul>                                        <li>
                                    <div class="form-check">
                                        <input type="radio" class="form-check-input" id="exampleradio1">
                                        <label class="form-check-label" for="exampleradio1">Last hour</label>
                                    </div>
                                </li>
                                    <li>                                            <div class="form-check">
                                        <input type="radio" class="form-check-input" id="exampleradio2">
                                        <label class="form-check-label" for="exampleradio2">Last 24
                                            hours</label>
                                    </div>
                                    </li>

                                    <li>                                            <div class="form-check">
                                        <input type="radio" class="form-check-input" id="exampleradio3">
                                        <label class="form-check-label" for="exampleradio3">Last 7 days</label>
                                    </div>
                                    </li>

                                    <li>                                            <div class="form-check">
                                        <input type="radio" class="form-check-input" id="exampleradio4">
                                        <label class="form-check-label" for="exampleradio4">Last 14 days</label>
                                    </div>
                                    </li>

                                    <li>                                            <div class="form-check">
                                        <input type="radio" class="form-check-input" id="exampleradio5">
                                        <label class="form-check-label" for="exampleradio5">Last 30 days</label>
                                    </div>
                                    </li>

                                    <li>                                            <div class="form-check">
                                        <input type="radio" class="form-check-input" id="exampleradio6">
                                        <label class="form-check-label" for="exampleradio6">All</label>
                                    </div>
                                    </li>

                                </ul>
                            </div>
                        </form>
                    </div>

                    <div class="widget tw-sidebar-tags-wrap">
                        <h4 class="section-head-small mb-4">Tags</h4>
                        <div class="tagcloud">
                            <a href="job-list.html">General</a>
                            <a href="job-list.html">Jobs </a>
                            <a href="job-list.html">Payment</a>
                            <a href="job-list.html">Application </a>
                            <a href="job-list.html">Work</a>
                            <a href="job-list.html">Recruiting</a>
                            <a href="job-list.html">Employer</a>
                            <a href="job-list.html">Income</a>
                            <a href="job-list.html">Tips</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-8 col-md-12">
                <!--Filter Short By-->
                <div class="product-filter-wrap d-flex justify-content-between align-items-center m-b30">
                    <p class="woocommerce-result-count-left">검색 결과 : 총 <span id="esCount"></span>  건</p>
                    <form class="woocommerce-ordering twm-filter-select" method="get">
                        <span class="woocommerce-result-count">Short By</span>
                        <select class="wt-select-bar-2 selectpicker" data-live-search="true" data-bv-field="size">
                            <option>Most Recent</option>
                            <option>Freelance</option>
                            <option>Full Time</option>
                            <option>Internship</option>
                            <option>Part Time</option>
                            <option>Temporary</option>
                        </select>
                        <select class="wt-select-bar-2 selectpicker" data-live-search="true" data-bv-field="size">
                            <option value="10">10 개씩 보기</option>
                            <option value="20">20 개씩 보기</option>
                            <option value="30">30 개씩 보기</option>
                            <option value="40">40 개씩 보기</option>
                            <option value="50">50 개씩 보기</option>
                        </select>
                    </form>
                </div>
                <div class="twm-candidates-list-wrap">
                    <!-- ajax로 처리할 예정 -->
                    <ul class="case-list">
                    </ul>
                </div>
                <div class="pagination-outer">
                        <%--
                        <div class="pagination-style1">
                        <ul class="clearfix">
                            <li class="prev"><a href="javascript:;"><span> <i class="fa fa-angle-left"></i> </span></a>
                            </li>
                            <li><a href="javascript:;">1</a></li>
                            <li class="active"><a href="javascript:;">2</a></li>
                            <li><a href="javascript:;">3</a></li>
                            <li><a class="javascript:;" href="javascript:;"><i class="fa fa-ellipsis-h"></i></a>
                            </li>
                            <li><a href="javascript:;">5</a></li>
                            <li class="next"><a href="javascript:;"><span> <i class="fa fa-angle-right"></i> </span></a>
                            </li>
                        </ul>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
    <!-- OUR BLOG END -->
</div>
<!--CONTENT END-->


<!--Footer, 로그인 회원가입 팝업-->
<%@include file="../footer.jsp" %>
</div>

<!-- JAVASCRIPT  FILES ========================================= -->
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script><!-- JQUERY.MIN JS -->
<script src="${pageContext.request.contextPath}/js/popper.min.js"></script><!-- POPPER.MIN JS -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script><!-- BOOTSTRAP.MIN JS -->
<script src="${pageContext.request.contextPath}/js/magnific-popup.min.js"></script><!-- MAGNIFIC-POPUP JS -->
<script src="${pageContext.request.contextPath}/js/waypoints.min.js"></script><!-- WAYPOINTS JS -->
<script src="${pageContext.request.contextPath}/js/counterup.min.js"></script><!-- COUNTERUP JS -->
<script src="${pageContext.request.contextPath}/js/waypoints-sticky.min.js"></script><!-- STICKY HEADER -->
<script src="${pageContext.request.contextPath}/js/isotope.pkgd.min.js"></script><!-- MASONRY  -->
<script src="${pageContext.request.contextPath}/js/imagesloaded.pkgd.min.js"></script><!-- MASONRY  -->
<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script><!-- OWL  SLIDER  -->
<script src="${pageContext.request.contextPath}/js/theia-sticky-sidebar.js"></script><!-- STICKY SIDEBAR  -->
<script src="${pageContext.request.contextPath}/js/lc_lightbox.lite.js"></script><!-- IMAGE POPUP -->
<script src="${pageContext.request.contextPath}/js/bootstrap-select.min.js"></script><!-- Form js -->
<script src="${pageContext.request.contextPath}/js/dropzone.js"></script><!-- IMAGE UPLOAD  -->
<script src="${pageContext.request.contextPath}/js/jquery.scrollbar.js"></script><!-- scroller -->
<script src="${pageContext.request.contextPath}/js/bootstrap-datepicker.js"></script><!-- scroller -->
<script src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js"></script><!-- Datatable -->
<script src="${pageContext.request.contextPath}/js/dataTables.bootstrap5.min.js"></script><!-- Datatable -->
<script src="${pageContext.request.contextPath}/js/chart.js"></script><!-- Chart -->
<script src="${pageContext.request.contextPath}/js/bootstrap-slider.min.js"></script><!-- Price range slider -->
<script src="${pageContext.request.contextPath}/js/swiper-bundle.min.js"></script><!-- Swiper JS -->
<script src="${pageContext.request.contextPath}/js/custom.js"></script><!-- CUSTOM FUCTIONS  -->


</body>

</html>
