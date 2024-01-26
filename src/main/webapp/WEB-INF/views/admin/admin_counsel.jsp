<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
            <!-- 제목 입력 부분 -->
            <div class="wt-admin-right-page-header clearfix">
                <!-- <h2>관리자님 안녕하세요!</h2> -->
            </div>
            <!-- 내용 입력 시작 -->
            <div class="section-full  p-t120 p-b90 bg-white" style="transform: none;">
                <div class="container" style="transform: none;">
                
                    <!-- BLOG SECTION START -->
                    <div class="section-content" style="transform: none;">
                        <div class="row d-flex justify-content-center" style="transform: none;">
                        
                            <div class="col-lg-8 col-md-12">
                                <!-- Candidate detail START -->
                                <div class="cabdidate-de-info">
                                    <input type="hidden" value="${counselBoard.board_idx}" id="board_idx"/>
                                    <input type="hidden" value="${counselBoard.user_id}" id="user_id"/>
                                    <p>${counselBoard.field_name}</p>
                                    <h3 class="twm-s-title" style="font-weight: 600;">${counselBoard.board_title}</h3>
            
                                    <p id="counselContent" style="margin-bottom: 30px;">${counselBoard.board_content}</p>
            
                                    <!-- <p style="font-size: 12px;">변호사 답변 총 ${counselBoard.board_reply_count}</p> -->
                                    <p style="font-size: 12px;">조회수 ${counselBoard.board_count}
                                        <c:if test="${sessionScope.user_id eq counselBoard.user_id && counselBoard.board_reply_count == 0}">
                                            <button class="twm-view-prifile site-text-primary" data-bs-toggle="modal" data-bs-target="#updateContent_popup" style="position: relative; border: oldlace; background-color: azure; left: 80%;">[글 수정하기]</button>
                                        </c:if>
                                    </p>
                                    <hr/>
                                    <a href="../counsel/counsel"><button class="twm-view-prifile site-text-primary" data-bs-toggle="modal" data-bs-target="#updateContent_popup" style="position: relative; border: oldlace; background-color: azure; left: 87%; margin-bottom: 20px;">[목록가기]</button></a>
                                    
                                    <!--수정 팝업-->
                                    <div class="modal fade twm-sign-up" id="updateContent_popup" aria-hidden="true" aria-labelledby="updateContent_popup1" tabindex="-1">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h2 class="modal-title" id="updateContent_popup1">수정하기</h2>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="twm-candidates-grid-style1 mb-5" style="height: 750px; width: 500px; margin: 0 auto;">
                                                        <!-- <br/> -->
                                                        <form method="post">
                                                            <br/>
                                                            <textarea type="text" class="form-control" style="height: 600px;" name="board_content" id="updateContent">${counselBoard.board_content}</textarea>
                                                            <br/>
                                                            <button type="submit" class="site-button" style="position: relative; left: 360px; width: auto; padding: 5px 10px 5px 10px;" id="updateContentBtn">수정하기</button>
                                                        </form>
                                                    </div>
                                                </div>    
                                            </div>
                                        </div>
                                    </div>
                                    <!--수정 팝업 END-->
            
                                    <!-- <h4 class="twm-s-title">변호사 답변 총 </h4> -->
            
                                    <!-- 변호사 답글 작성 -->
                                    <c:if test="${sessionScope.auth_idx == 1}">
                                        <p><a id="reply_content" href="#update_content"><button class="twm-view-prifile site-text-primary" id="lawyerReply" style="border: oldlace; background-color: azure;">[답변 작성하기]</button></a></p>
                                        <div id="lawyerReplyEditor" hidden>
                                            <form>
                                                <input type="hidden" value="${counselBoard.board_idx}" id="board_idx"/>
                                                <input type="hidden" value="${replyIsSelected.lawyer_id}" class="lawyer_id"/>
                                                <div style="margin-bottom: 20px;">
                                                    <textarea id="board_content" name="board_content" rows="13" cols=""></textarea>
                                                    <script>
                                                    CKEDITOR.replace('board_content', {
                                                        filebrowserUploadUrl: '${pageContext.request.contextPath}/ckeditorImageUpload',
                                                        uiColor: '#CCEAEE',
                                                        enterMode: CKEDITOR.ENTER_DIV,
                                                        shiftEnterMode: CKEDITOR.ENTER_P,
                                                        extraPlugins: 'editorplaceholder',
                                                            editorplaceholder: '입력하세요...'
                                                        });
                                                    
                                                    CKEDITOR.on('dialogDefinition', function( ev ){
                                                            var dialogName = ev.data.name;
                                                            var dialogDefinition = ev.data.definition;
                                                        
                                                            switch (dialogName) {
                                                                case 'image': //Image Properties dialog
                                                                    //dialogDefinition.removeContents('info');
                                                                    dialogDefinition.removeContents('Link');
                                                                    dialogDefinition.removeContents('advanced');
                                                                    break;
                                                            }
                                                        });
                                                    </script>
                                                </div>
                                                <button class="site-button" id="reply" style="left: 88%; padding: 10px; margin-bottom: 20px;">작성하기</button>
                                            </form>
                                        </div>
                                    </c:if>
            
                                    <!-- 변호사 답글 리스트 -->
                                    <c:if test="${replyIsSelected.board_reply_isSelected == 1}">
                                        <p style="color: rgb(25, 103, 210); margin: 30px 0px 0px 0px;">[질문자 채택 답변]</p>
                                        <div class="twm-timing-list-wrap replyContainer" style="padding: 20px;">
                                            <div class="twm-media-pic twm-right-btn" style="margin:auto;">
                                                <div class="row">
                                                    <div class="col-2"><img src="/images/candidates/pic1.jpg" alt="#" style="max-width: 70%;"></div>
                                                    <div class="col-7"><p style="margin-bottom: 0px; font-size: 12px;">${replyIsSelected.lawfirm_name}</p><p style="font-size: 20px; margin-bottom: 0px;">${replyIsSelected.lawyer_name} 변호사</p> </div>
                                                    <div class="col-3">
                                                        <input type="hidden" value="${replyIsSelected.lawyer_id}" class="lawyer_id"/>
                                                        <c:if test="${counselBoard.board_IsSelected == 0 && sessionScope.user_id eq counselBoard.user_id}">
                                                            <button class="twm-view-prifile site-text-primary isSelected" style="left: 40%; border: oldlace; background-color: azure;">채택하기</button>
                                                        </c:if>
                                                        <c:if test="${sessionScope.auth_idx == 1 && sessionScope.lawyer_id eq replyIsSelected.lawyer_id}">
                                                            <a id="update_content" href="#reply_content"><button class="twm-view-prifile site-text-primary updateReply" style="left: 40%; border: oldlace; background-color: azure;">수정하기</button></a>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr/>
                                            <p class="replyContent">${replyIsSelected.board_reply_content}</p>
                                        </div>
                                    </c:if>
                                    <c:forEach items="${counselReplyList}" var="counselReplies">
                                        <c:if test="${counselReplies.board_reply_isSelected == 0}">
                                            <!-- <p style="color: rgb(25, 103, 210); margin: 0px;">[질문자 채택 답변]</p> -->
                                            <div class="twm-timing-list-wrap replyContainer" style="padding: 20px;">
                                                <div class="twm-media-pic twm-right-btn" style="margin:auto;">
                                                    <div class="row">
                                                        <div class="col-2"><img src="/images/candidates/pic1.jpg" alt="#" style="max-width: 70%;"></div>
                                                        <div class="col-7"><p style="margin-bottom: 0px; font-size: 12px;">${counselReplies.lawfirm_name}</p><p style="font-size: 20px; margin-bottom: 0px;">${counselReplies.lawyer_name} 변호사</p></div>
                                                        <div class="col-3">
                                                            <input type="hidden" value="${counselReplies.lawyer_id}" class="lawyer_id"/>
                                                            <c:if test="${counselBoard.board_IsSelected == 0 && sessionScope.user_id eq counselBoard.user_id}">
                                                                <button class="twm-view-prifile site-text-primary isSelected" style="left: 40%; border: oldlace; background-color: azure;">채택하기</button>
                                                            </c:if>
                                                            <c:if test="${sessionScope.auth_idx == 1 && sessionScope.lawyer_id eq counselReplies.lawyer_id}">
                                                                <a id="update_content" href="#reply_content"><button class="twm-view-prifile site-text-primary updateReply" style="left: 40%; border: oldlace; background-color: azure;">수정하기</button></a>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </div>
                                                <hr/>
                                                <p class="replyContent">${counselReplies.board_reply_content}</p>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>                                              
                            </div>           
                        </div>                                   
                    </div>        
                </div>    
            </div>

            <!-- 내용 입력 끝 -->
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
