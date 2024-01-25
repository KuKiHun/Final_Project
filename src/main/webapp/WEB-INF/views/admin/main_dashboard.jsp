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
                                        <h4 class="m-b0">Posted Jobs</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-6 col-md-12 mb-3">
                        <div class="panel panel-default">
                            <div class="panel-body wt-panel-body gradi-2 dashboard-card ">
                                <div class="wt-card-wrap">
                                    <div class="wt-card-icon"><i class="far fa-file-alt"></i></div>
                                    <div class="wt-card-right  wt-total-listing-view counter ">435</div>
                                    <div class="wt-card-bottom">
                                        <h4 class="m-b0">Total Applications</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-6 col-md-12 mb-3">
                        <div class="panel panel-default">
                            <div class="panel-body wt-panel-body gradi-3 dashboard-card ">
                                <div class="wt-card-wrap">
                                    <div class="wt-card-icon"><i class="far fa-envelope"></i></div>
                                    <div class="wt-card-right wt-total-listing-review counter ">28</div>
                                    <div class="wt-card-bottom">
                                        <h4 class="m-b0">Messages</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-6 col-md-12 mb-3">
                        <div class="panel panel-default">
                            <div class="panel-body wt-panel-body gradi-4 dashboard-card ">
                                <div class="wt-card-wrap">
                                    <div class="wt-card-icon"><i class="far fa-bell"></i></div>
                                    <div class="wt-card-right wt-total-listing-bookmarked counter ">18</div>
                                    <div class="wt-card-bottom">
                                        <h4 class="m-b0">Notifications</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="twm-pro-view-chart-wrap">
                <div class="row">
                    <div class="col-xl-6 col-lg-12 col-md-12 mb-4">
                        <div class="panel panel-default site-bg-white">
                            <div class="panel-heading wt-panel-heading p-a20">
                                <h4 class="panel-tittle m-a0"><i class="far fa-chart-bar"></i>Your Profile Views</h4>
                            </div>
                            <div class="panel-body wt-panel-body twm-pro-view-chart">
                                <canvas id="profileViewChart"></canvas>
                            </div>
                        </div>

                    </div>


                    <div class="col-xl-6 col-lg-12 col-md-12 mb-4">
                        <div class="panel panel-default">
                            <div class="panel-heading wt-panel-heading p-a20">
                                <h4 class="panel-tittle m-a0">Inbox</h4>
                            </div>
                            <div class="panel-body wt-panel-body bg-white">
                                <div class="dashboard-messages-box-scroll scrollbar-macosx">

                                    <div class="dashboard-messages-box">
                                        <div class="dashboard-message-avtar"><img src="images/user-avtar/pic1.jpg" alt=""></div>
                                        <div class="dashboard-message-area">
                                            <h5>Lucy Smith<span>18 June 2023</span></h5>
                                            <p>Bring to the table win-win survival strategies to ensure proactive domination. at the end of the day, going forward, a new normal that has evolved from generation.</p>
                                        </div>
                                    </div>

                                    <div class="dashboard-messages-box">
                                        <div class="dashboard-message-avtar"><img src="images/user-avtar/pic3.jpg" alt=""></div>
                                        <div class="dashboard-message-area">
                                            <h5>Richred paul<span>19 June 2023</span></h5>
                                            <p>Bring to the table win-win survival strategies to ensure proactive domination. at the end of the day, going forward, a new normal that has evolved from generation.</p>
                                        </div>
                                    </div>

                                    <div class="dashboard-messages-box">
                                        <div class="dashboard-message-avtar"><img src="images/user-avtar/pic4.jpg" alt=""></div>
                                        <div class="dashboard-message-area">
                                            <h5>Jon Doe<span>20 June 2023</span></h5>
                                            <p>Bring to the table win-win survival strategies to ensure proactive domination. at the end of the day, going forward, a new normal that has evolved from generation.</p>
                                        </div>
                                    </div>

                                    <div class="dashboard-messages-box">
                                        <div class="dashboard-message-avtar"><img src="images/user-avtar/pic1.jpg" alt=""></div>
                                        <div class="dashboard-message-area">
                                            <h5>Thomas Smith<span>22 June 2023</span></h5>
                                            <p>Bring to the table win-win survival strategies to ensure proactive domination. at the end of the day, going forward, a new normal that has evolved from generation. </p>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>

                    </div>

                    <div class="col-lg-12 col-md-12 mb-4">
                        <div class="panel panel-default site-bg-white m-t30">
                            <div class="panel-heading wt-panel-heading p-a20">
                                <h4 class="panel-tittle m-a0"><i class="far fa-list-alt"></i>Recent Activities</h4>
                            </div>
                            <div class="panel-body wt-panel-body">

                                <div class="dashboard-list-box list-box-with-icon">
                                    <ul>
                                        <li>
                                            <i class="fa fa-envelope text-success list-box-icon"></i>Nikol Tesla has sent you <a href="#" class="text-success">private message!</a>
                                            <a href="#" class="close-list-item color-lebel clr-red">
                                                <i class="far fa-trash-alt"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <i class="fa fa-suitcase text-primary list-box-icon"></i>Your job for
                                            <a href="#" class="text-primary">Web Designer</a>
                                            has been approved!
                                            <a href="#" class="close-list-item color-lebel clr-red">
                                                <i class="far fa-trash-alt"></i>
                                            </a>
                                        </li>

                                        <li>
                                            <i class="fa fa-bookmark text-warning list-box-icon"></i>
                                            Someone bookmarked your
                                            <a href="#" class="text-warning">SEO Expert</a>
                                            Job listing!
                                            <a href="#" class="close-list-item color-lebel clr-red">
                                                <i class="far fa-trash-alt"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <i class="fa fa-tasks text-info list-box-icon"></i>
                                            Your job listing Core
                                            <a href="#" class="text-info">PHP Developer</a> for Site Maintenance is expiring!
                                            <a href="#" class="close-list-item color-lebel clr-red">
                                                <i class="far fa-trash-alt"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <i class="fa fa-paperclip text-success list-box-icon"></i>
                                            You have new application for
                                            <a href="#" class="text-success"> UI/UX Developer & Designer! </a>
                                            <a href="#" class="close-list-item color-lebel clr-red">
                                                <i class="far fa-trash-alt"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <i class="fa fa-suitcase text-danger list-box-icon"></i>
                                            Your Magento Developer job expire
                                            <a href="#" class="text-danger">Renew</a>  now it.
                                            <a href="#" class="close-list-item color-lebel clr-red">
                                                <i class="far fa-trash-alt"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <i class="fa fa-star site-text-orange list-box-icon"></i>
                                            David cope left a
                                            <a href="#" class="site-text-orange"> review 4.5</a> for Real Estate Logo
                                            <a href="#" class="close-list-item color-lebel clr-red">
                                                <i class="far fa-trash-alt"></i>
                                            </a>
                                        </li>
                                    </ul>

                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="col-lg-12 col-md-12 mb-4">
                        <div class="panel panel-default">
                            <div class="panel-heading wt-panel-heading p-a20">
                                <h4 class="panel-tittle m-a0">Recent Applicants</h4>
                            </div>
                            <div class="panel-body wt-panel-body bg-white">
                                <div class="twm-dashboard-candidates-wrap">
                                    <div class="row">

                                        <div class="col-xl-6 col-lg-12 col-md-12">
                                            <div class="twm-dash-candidates-list">
                                                <div class="twm-media">
                                                    <div class="twm-media-pic">
                                                        <img src="images/candidates/pic1.jpg" alt="#">
                                                    </div>

                                                </div>
                                                <div class="twm-mid-content">
                                                    <a href="#" class="twm-job-title">
                                                        <h4>Wanda Montgomery </h4>
                                                    </a>
                                                    <p>Charted Accountant</p>

                                                    <div class="twm-fot-content">
                                                        <div class="twm-left-info">
                                                            <p class="twm-candidate-address"><i class="feather-map-pin"></i>New York</p>
                                                            <div class="twm-jobs-vacancies">$20<span>/ Day</span></div>
                                                        </div>
                                                        <div class="twm-right-btn">

                                                            <ul class="twm-controls-icon list-unstyled">
                                                                <li>
                                                                    <button title="View profile" data-bs-toggle="tooltip" data-bs-placement="top">
                                                                        <span class="fa fa-eye"></span>
                                                                    </button>
                                                                </li>
                                                                <li>
                                                                    <button title="Send message" data-bs-toggle="tooltip" data-bs-placement="top">
                                                                        <span class="far fa-envelope-open"></span>
                                                                    </button>
                                                                </li>
                                                                <li>
                                                                    <button title="Delete" data-bs-toggle="tooltip" data-bs-placement="top">
                                                                        <span class="far fa-trash-alt"></span>
                                                                    </button>
                                                                </li>
                                                            </ul>

                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>

                                        <div class="col-xl-6 col-lg-12 col-md-12">
                                            <div class="twm-dash-candidates-list">
                                                <div class="twm-media">
                                                    <div class="twm-media-pic">
                                                        <img src="images/candidates/pic2.jpg" alt="#">
                                                    </div>

                                                </div>
                                                <div class="twm-mid-content">
                                                    <a href="#" class="twm-job-title">
                                                        <h4>Peter Hawkins</h4>
                                                    </a>
                                                    <p>Medical Professed</p>

                                                    <div class="twm-fot-content">
                                                        <div class="twm-left-info">
                                                            <p class="twm-candidate-address"><i class="feather-map-pin"></i>New York</p>
                                                            <div class="twm-jobs-vacancies">$7<span>/ Hour</span></div>
                                                        </div>
                                                        <div class="twm-right-btn">

                                                            <ul class="twm-controls-icon list-unstyled">
                                                                <li>
                                                                    <button title="View profile" data-bs-toggle="tooltip" data-bs-placement="top">
                                                                        <span class="fa fa-eye"></span>
                                                                    </button>
                                                                </li>
                                                                <li>
                                                                    <button title="Send message" data-bs-toggle="tooltip" data-bs-placement="top">
                                                                        <span class="far fa-envelope-open"></span>
                                                                    </button>
                                                                </li>
                                                                <li>
                                                                    <button title="Delete" data-bs-toggle="tooltip" data-bs-placement="top">
                                                                        <span class="far fa-trash-alt"></span>
                                                                    </button>
                                                                </li>
                                                            </ul>

                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>

                                        <div class="col-xl-6 col-lg-12 col-md-12">
                                            <div class="twm-dash-candidates-list">
                                                <div class="twm-media">
                                                    <div class="twm-media-pic">
                                                        <img src="images/candidates/pic3.jpg" alt="#">
                                                    </div>

                                                </div>
                                                <div class="twm-mid-content">
                                                    <a href="#" class="twm-job-title">
                                                        <h4>Ralph Johnson  </h4>
                                                    </a>
                                                    <p>Bank Manger</p>

                                                    <div class="twm-fot-content">
                                                        <div class="twm-left-info">
                                                            <p class="twm-candidate-address"><i class="feather-map-pin"></i>New York</p>
                                                            <div class="twm-jobs-vacancies">$180<span>/ Day</span></div>
                                                        </div>
                                                        <div class="twm-right-btn">
                                                            <ul class="twm-controls-icon list-unstyled">
                                                                <li>
                                                                    <button title="View profile" data-bs-toggle="tooltip" data-bs-placement="top">
                                                                        <span class="fa fa-eye"></span>
                                                                    </button>
                                                                </li>
                                                                <li>
                                                                    <button title="Send message" data-bs-toggle="tooltip" data-bs-placement="top">
                                                                        <span class="far fa-envelope-open"></span>
                                                                    </button>
                                                                </li>
                                                                <li>
                                                                    <button title="Delete" data-bs-toggle="tooltip" data-bs-placement="top">
                                                                        <span class="far fa-trash-alt"></span>
                                                                    </button>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>

                                        <div class="col-xl-6 col-lg-12 col-md-12">
                                            <div class="twm-dash-candidates-list">
                                                <div class="twm-media">
                                                    <div class="twm-media-pic">
                                                        <img src="images/candidates/pic4.jpg" alt="#">
                                                    </div>

                                                </div>
                                                <div class="twm-mid-content">
                                                    <a href="#" class="twm-job-title">
                                                        <h4>Randall Henderson </h4>
                                                    </a>
                                                    <p>IT Contractor</p>

                                                    <div class="twm-fot-content">
                                                        <div class="twm-left-info">
                                                            <p class="twm-candidate-address"><i class="feather-map-pin"></i>New York</p>
                                                            <div class="twm-jobs-vacancies">$90<span>/ Week</span></div>
                                                        </div>
                                                        <div class="twm-right-btn">
                                                            <ul class="twm-controls-icon list-unstyled">
                                                                <li>
                                                                    <button title="View profile" data-bs-toggle="tooltip" data-bs-placement="top">
                                                                        <span class="fa fa-eye"></span>
                                                                    </button>
                                                                </li>
                                                                <li>
                                                                    <button title="Send message" data-bs-toggle="tooltip" data-bs-placement="top">
                                                                        <span class="far fa-envelope-open"></span>
                                                                    </button>
                                                                </li>
                                                                <li>
                                                                    <button title="Delete" data-bs-toggle="tooltip" data-bs-placement="top">
                                                                        <span class="far fa-trash-alt"></span>
                                                                    </button>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>

                                        <div class="col-xl-6 col-lg-12 col-md-12">
                                            <div class="twm-dash-candidates-list">
                                                <div class="twm-media">
                                                    <div class="twm-media-pic">
                                                        <img src="images/candidates/pic6.jpg" alt="#">
                                                    </div>

                                                </div>
                                                <div class="twm-mid-content">
                                                    <a href="#" class="twm-job-title">
                                                        <h4>Christina Fischer </h4>
                                                    </a>
                                                    <p>Charity &amp; Voluntary</p>

                                                    <div class="twm-fot-content">
                                                        <div class="twm-left-info">
                                                            <p class="twm-candidate-address"><i class="feather-map-pin"></i>New York</p>
                                                            <div class="twm-jobs-vacancies">$19<span>/ Hour</span></div>
                                                        </div>
                                                        <div class="twm-right-btn">
                                                            <ul class="twm-controls-icon list-unstyled">
                                                                <li>
                                                                    <button title="View profile" data-bs-toggle="tooltip" data-bs-placement="top">
                                                                        <span class="fa fa-eye"></span>
                                                                    </button>
                                                                </li>
                                                                <li>
                                                                    <button title="Send message" data-bs-toggle="tooltip" data-bs-placement="top">
                                                                        <span class="far fa-envelope-open"></span>
                                                                    </button>
                                                                </li>
                                                                <li>
                                                                    <button title="Delete" data-bs-toggle="tooltip" data-bs-placement="top">
                                                                        <span class="far fa-trash-alt"></span>
                                                                    </button>
                                                                </li>
                                                            </ul>
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
