<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <style>
        /* 웹 폰트 추가 */
        @font-face {
            font-family: "Nanum Square Neo";
            src: url("${pageContext.request.contextPath}/fonts/NanumSquareNeoTTF-bRg.woff2")
            format("woff2"),
            url("${pageContext.request.contextPath}/fonts/NanumSquareNeoTTF-bRg.woff")
            format("woff"),
            url("${pageContext.request.contextPath}/fonts/NanumSquareNeoTTF-bRg.eot");
            font-weight: normal;
            font-style: normal;
        }

        /* 상단 스타일 덮어쓰기 */
        body {
            font-family: "Nanum Square Neo", sans-serif !important;
        }
    </style>
    <!-- 제이쿼리 CDN -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script></script>
    <!-- META -->
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="keywords" content="" />
    <meta name="author" content="" />
    <meta name="robots" content="" />
    <meta name="description" content="" />

    <!-- FAVICONS ICON -->
    <link rel="icon" href="images/favicon.ico" type="image/x-icon" />
    <link
            rel="shortcut icon"
            type="image/x-icon"
            href="${pageContext.request.contextPath}/images/favicon.png"
    />

    <!-- PAGE TITLE HERE -->
    <title>FolLaw | 채팅상담</title>

    <!-- MOBILE SPECIFIC -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Resource -->
    <link
            rel="stylesheet"
            type="text/css"
            href="${pageContext.request.contextPath}/css/bootstrap.min.css"
    />
    <!-- BOOTSTRAP STYLE SHEET -->
    <link
            rel="stylesheet"
            type="text/css"
            href="${pageContext.request.contextPath}/css/font-awesome.min.css"
    />
    <!-- FONTAWESOME STYLE SHEET -->
    <link
            rel="stylesheet"
            type="text/css"
            href="${pageContext.request.contextPath}/css/feather.css"
    />
    <!-- FEATHER ICON SHEET -->
    <link
            rel="stylesheet"
            type="text/css"
            href="${pageContext.request.contextPath}/css/owl.carousel.min.css"
    />
    <!-- OWL CAROUSEL STYLE SHEET -->
    <link
            rel="stylesheet"
            type="text/css"
            href="${pageContext.request.contextPath}/css/magnific-popup.min.css"
    />
    <!-- MAGNIFIC POPUP STYLE SHEET -->
    <link
            rel="stylesheet"
            type="text/css"
            href="${pageContext.request.contextPath}/css/lc_lightbox.css"
    />
    <!-- Lc light box popup -->
    <link
            rel="stylesheet"
            type="text/css"
            href="${pageContext.request.contextPath}/css/bootstrap-select.min.css"
    />
    <!-- BOOTSTRAP SLECT BOX STYLE SHEET  -->
    <link
            rel="stylesheet"
            type="text/css"
            href="${pageContext.request.contextPath}/css/dataTables.bootstrap5.min.css"
    />
    <!-- DATA table STYLE SHEET  -->
    <link
            rel="stylesheet"
            type="text/css"
            href="${pageContext.request.contextPath}/css/select.bootstrap5.min.css"
    />
    <!-- DASHBOARD select bootstrap  STYLE SHEET  -->
    <link
            rel="stylesheet"
            type="text/css"
            href="${pageContext.request.contextPath}/css/dropzone.css"
    />
    <!-- DROPZONE STYLE SHEET -->
    <link
            rel="stylesheet"
            type="text/css"
            href="${pageContext.request.contextPath}/css/scrollbar.css"
    />
    <!-- CUSTOM SCROLL BAR STYLE SHEET -->
    <link
            rel="stylesheet"
            type="text/css"
            href="${pageContext.request.contextPath}/css/datepicker.css"
    />
    <!-- DATEPICKER STYLE SHEET -->
    <link
            rel="stylesheet"
            type="text/css"
            href="${pageContext.request.contextPath}/css/flaticon.css"
    />
    <!-- Flaticon -->
    <link
            rel="stylesheet"
            type="text/css"
            href="${pageContext.request.contextPath}/css/swiper-bundle.min.css"
    />
    <!-- Swiper Slider -->
    <link
            rel="stylesheet"
            type="text/css"
            href="${pageContext.request.contextPath}/css/style.css"
    />
    <!-- MAIN STYLE SHEET -->

    <!-- THEME COLOR CHANGE STYLE SHEET -->
    <link
            rel="stylesheet"
            class="skin"
            type="text/css"
            href="${pageContext.request.contextPath}/css/skins-type/skin-6.css"
    />

    <style>
        #chat {
            display: flex;
            margin-top: auto;
            align-items: center;
        }
    </style>
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
                                <h2 class="wt-title">채팅상담</h2>
                            </div>
                        </div>                      
                    </div>
                </div>
            </div>
    </div>
    <!-- INNER PAGE BANNER END -->

    <h2 id="auth_check" style="text-align: center; margin: 50px 0px 50px 0px">
        <c:if test="${sessionScope.lawyer_id != null}">
            ${sessionScope.lawyer_id} 변호사님
        </c:if>
        <c:if test="${sessionScope.user_id != null}">
            ${sessionScope.user_id} 회원님
        </c:if>
    </h2>

    <!-- allow="camera; microphone" 를 사용해야 포트3000번에서 카메라 사용가능 -->
    <iframe
            id="video"
            title="iframe video"
            width="1000"
            height="1000"
            style="display: flex; justify-content: center; margin: auto;"
            allow="camera; microphone"
            src="http://localhost:3001/videoIndex"
    ></iframe>

    <!--CONTENT END-->

    <!--Footer, 로그인 회원가입 팝업-->
    <%@include file="../footer.jsp" %>
</div>

<!-- JAVASCRIPT  FILES ========================================= -->
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<!-- JQUERY.MIN JS -->
<script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
<!-- POPPER.MIN JS -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<!-- BOOTSTRAP.MIN JS -->
<script src="${pageContext.request.contextPath}/js/magnific-popup.min.js"></script>
<!-- MAGNIFIC-POPUP JS -->
<script src="${pageContext.request.contextPath}/js/waypoints.min.js"></script>
<!-- WAYPOINTS JS -->
<script src="${pageContext.request.contextPath}/js/counterup.min.js"></script>
<!-- COUNTERUP JS -->
<script src="${pageContext.request.contextPath}/js/waypoints-sticky.min.js"></script>
<!-- STICKY HEADER -->
<script src="${pageContext.request.contextPath}/js/isotope.pkgd.min.js"></script>
<!-- MASONRY  -->
<script src="${pageContext.request.contextPath}/js/imagesloaded.pkgd.min.js"></script>
<!-- MASONRY  -->
<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
<!-- OWL  SLIDER  -->
<script src="${pageContext.request.contextPath}/js/theia-sticky-sidebar.js"></script>
<!-- STICKY SIDEBAR  -->
<script src="${pageContext.request.contextPath}/js/lc_lightbox.lite.js"></script>
<!-- IMAGE POPUP -->
<script src="${pageContext.request.contextPath}/js/bootstrap-select.min.js"></script>
<!-- Form js -->
<script src="${pageContext.request.contextPath}/js/dropzone.js"></script>
<!-- IMAGE UPLOAD  -->
<script src="${pageContext.request.contextPath}/js/jquery.scrollbar.js"></script>
<!-- scroller -->
<script src="${pageContext.request.contextPath}/js/bootstrap-datepicker.js"></script>
<!-- scroller -->
<script src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js"></script>
<!-- Datatable -->
<script src="${pageContext.request.contextPath}/js/dataTables.bootstrap5.min.js"></script>
<!-- Datatable -->
<script src="${pageContext.request.contextPath}/js/chart.js"></script>
<!-- Chart -->
<script src="${pageContext.request.contextPath}/js/bootstrap-slider.min.js"></script>
<!-- Price range slider -->
<script src="${pageContext.request.contextPath}/js/swiper-bundle.min.js"></script>
<!-- Swiper JS -->
<script src="${pageContext.request.contextPath}/js/custom.js"></script>
<!-- CUSTOM FUCTIONS  -->
<script src="${pageContext.request.contextPath}/js/videoCounsel.js"></script>
</body>
</html>