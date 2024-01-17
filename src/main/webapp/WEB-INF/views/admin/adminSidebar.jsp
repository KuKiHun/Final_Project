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
    <link rel="icon" href="images/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />

    <!-- PAGE TITLE HERE -->
    <title>jobzilla Template | dashboard</title>

    <!-- MOBILE SPECIFIC -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

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
    <nav id="sidebar-admin-wraper">
        <div class="page-logo">
            <a href="${pageContext.request.contextPath}/follaw/index"><img src="${pageContext.request.contextPath}/images/logo-dark.png" alt=""></a>
        </div>
        <div class="admin-nav scrollbar-macosx">
            <ul>
                <li id="admin_dashboard" class="active">
                    <a href="${pageContext.request.contextPath}/admin/main_dashboard"><i class="fa fa-home"></i><span class="admin-nav-text">대시보드</span></a>
                </li>
                <li id="admin_member">
                    <a href="${pageContext.request.contextPath}/admin/"><i class="fa fa-user"></i><span class="admin-nav-text">회원정보관리</span></a>
                    <ul class="sub-menu">
                        <li> <a href="${pageContext.request.contextPath}/admin/"><span class="admin-nav-text">일반회원</span></a></li>
                        <li> <a href="${pageContext.request.contextPath}/admin/admin_format"><span class="admin-nav-text">변호사회원</span></a></li>
                    </ul>
                </li>
                <li id="admin_information">
                    <a href="javascript:;"><i class="fa fa-suitcase"></i><span class="admin-nav-text">정보관리</span></a>
                    <ul class="sub-menu">
                        <li> <a href="javascript:;"><span class="admin-nav-text">변호사</span></a></li>
                        <li> <a href="javascript:;"><span class="admin-nav-text">법원</span></a></li>
                        <li> <a href="javascript:;"><span class="admin-nav-text">법률사무소</span></a></li>
                        <li> <a href="${pageContext.request.contextPath}/admin/information/laws"><span class="admin-nav-text">법 관리</span></a></li>
                        <li> <a href="${pageContext.request.contextPath}/admin/information/cases"><span class="admin-nav-text">판례 관리</span></a></li>
                    </ul>
                </li>
                <li id="admin_cunsulting">
                    <a href="javascript:;"><i class="fa fa-envelope"></i><span class="admin-nav-text">상담관리</span></a>
                    <ul class="sub-menu">
                        <li> <a href="javascript:;"><span class="admin-nav-text">채팅상담</span></a></li>
                        <li> <a href="javascript:;"><span class="admin-nav-text">영상채팅상담</span></a></li>
                        <li> <a href="javascript:;"><span class="admin-nav-text">지식인상담</span></a></li>
                    </ul>
                </li>
                <li id="admin_board">
                    <a href=""><i class="fa fa-bookmark"></i><span class="admin-nav-text">게시물관리</span></a>
                    <ul class="sub-menu">
                        <li> <a href="${pageContext.request.contextPath}/admin/board/notice"><span class="admin-nav-text">공지사항관리</span></a></li>
                        <li> <a href="${pageContext.request.contextPath}/admin/board/news"><span class="admin-nav-text">뉴스관리</span></a></li>
                    </ul>
                </li>
                <li id="admin_report">
                    <a href="javascript:;"><i class="fa fa-bell"></i><span class="admin-nav-text">신고관리</span></a>
                </li>

                <li id="admin_payment">
                    <a href="javascript:;"><i class="fa fa-money-bill-alt"></i><span class="admin-nav-text">결제관리</span></a>
                </li>
                <li>
                    <a href="../follaw/index"><i class="fa fa-share-square"></i><span class="admin-nav-text">사이트홈</span></a>
                </li>
            </ul>
        </div>
    </nav>
</div>
</body>
</html>
