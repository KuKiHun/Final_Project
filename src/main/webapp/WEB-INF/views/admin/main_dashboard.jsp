<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>

<html lang="en">

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
    <title>관리자 | 대시보드</title>

    <!-- MOBILE SPECIFIC -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

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
    <link rel="stylesheet" class="skin" type="text/css" href="css/skins-type/skin-6.css">




</head>

<body>

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

    <header id="header-admin-wrap" class="header-admin-fixed">

        <!-- Header Start -->
        <div id="header-admin">
            <div class="container">

                <!-- Left Side Content -->
                <div class="header-left">
                    <div class="nav-btn-wrap">
                        <a class="nav-btn-admin" id="sidebarCollapse">
                            <span class="fa fa-angle-left"></span>
                        </a>
                    </div>
                </div>
                <!-- Left Side Content End -->
            </div>
        </div>
        <!-- Header End -->

    </header>

    <!-- Sidebar Holder -->
    <%@include file="adminSidebar.jsp" %>

    <!-- Page Content Holder -->
    <div id="content">

        <div class="content-admin-main">

            <div class="wt-admin-right-page-header clearfix">
                <h2>관리자님 안녕하세요!</h2>
            </div>

            <div class="twm-dash-b-blocks mb-5">
                <div class="row">
                    <div class="col-xl-3 col-lg-6 col-md-12 mb-3">
                        <div class="panel panel-default">
                            <div class="panel-body wt-panel-body gradi-1 dashboard-card ">
                                <div class="wt-card-wrap">
                                    <div class="wt-card-icon"><i class="far fa-address-book"></i></div>
                                    <div class="wt-card-right wt-total-active-listing counter ">25</div>
                                    <div class="wt-card-bottom ">
                                        <h4 class="m-b0">오늘 가입한 회원</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-6 col-md-12 mb-3">
                        <div class="panel panel-default">
                            <a href="admin_counselList">
                                <div class="panel-body wt-panel-body gradi-4 dashboard-card ">
                                    <div class="wt-card-wrap">
                                        <div class="wt-card-icon"><i class="far fa-file-alt"></i></div>
                                        <div class="wt-card-right  wt-total-listing-bookmarked counter ">${counselSum}</div>
                                        <div class="wt-card-bottom">
                                            <h4 class="m-b0">오늘 등록된 지식인 게시글</h4>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-6 col-md-12 mb-3">
                        <div class="panel panel-default">
                            <a href="sales/sales_detail">
                                <div class="panel-body wt-panel-body gradi-3 dashboard-card ">
                                    <div class="wt-card-wrap">
                                        <div class="wt-card-icon"><i class="far fa fa-money-bill-alt"></i></div>
                                        <div class="wt-card-right wt-total-listing-review counter">${salesSum}</div>
                                        <div class="wt-card-bottom">
                                            <h4 class="m-b0">금주의 매출</h4>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-6 col-md-12 mb-3">
                        <div class="panel panel-default">
                            <a href="report/report_list">
                                <div class="panel-body wt-panel-body gradi-2 dashboard-card ">
                                    <div class="wt-card-wrap">
                                        <div class="wt-card-icon"><i class="far fa-bell"></i></div>
                                        <div class="wt-card-right wt-total-listing-view">${reportCnt}</div>
                                        <div class="wt-card-bottom">
                                            <h4 class="m-b0">미확인 신고</h4>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="twm-pro-view-chart-wrap">
                <div class="row">
                    <div class="col-xl-8 col-lg-12 col-md-12 mb-4">
                        <div class="panel panel-default site-bg-white">
                            <div class="panel-heading wt-panel-heading p-a20">
                                <h4 class="panel-tittle m-a0"><i class="far fa-chart-bar"></i></h4>
                            </div>
                            <div class="panel-body wt-panel-body twm-pro-view-chart" style="height: 460px">
                                <canvas id="profileViewChart"></canvas>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-4 col-lg-12 col-md-12 mb-4">
                        <div class="panel panel-default">
                            <div class="panel-heading wt-panel-heading p-a20">
                                <h4 class="panel-tittle m-a0">판례 통계</h4>
                            </div>
                            <div class="panel-body wt-panel-body bg-white" style="text-align: center">
                                <iframe src="http://121.162.45.39:51031/app/visualize#/edit/221f3c80-bf52-11ee-9281-13316bade299?embed=true&_g=(filters%3A!()%2CrefreshInterval%3A(pause%3A!t%2Cvalue%3A0)%2Ctime%3A(from%3Anow-15m%2Cto%3Anow))" height="450" width="600"></iframe>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
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









</body>

</html>
