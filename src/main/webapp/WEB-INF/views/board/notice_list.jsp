<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
            
        /*뉴스 사진 크기고정*/
        .wt-post-media img {
            height: 300px;
            max-width: 100%; /* 이미지의 최대 너비를 컨테이너의 너비에 맞춥니다 */
            object-fit: contain; /* 이미지의 비율을 유지하면서 컨테이너에 맞게 확대 또는 축소합니다 */
        }
        /*뉴스 타이틀 높이고정*/
        .wt-post-info{
            height: 200px;
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
    <title>FolLaw | 홈</title>
    
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
     
    <link rel="stylesheet"href="${pageContext.request.contextPath}/css/notice.css">
    
</head>

<body>


    <%@include file="../follaw/header_loading.jsp" %>

      
        <!-- CONTENT START -->


            <!--Banner Start-->
            <div class="twm-home1-banner-section site-bg-gray bg-cover" style="background-image:url(images/main-slider/slider1/main.png)">
                <div class="row">
                    
                    <!--Left Section-->
                    <div class="col-xl-6 col-lg-6 col-md-12" style="width: 100% !important;">
                        <div class="twm-bnr-left-section" style="z-index: 2; margin:auto;">
                            <div class="twm-bnr-title-small"><span class="site-text-primary"></span></div>
                            <div class="twm-bnr-title-large">당신의 든든한 <br>법률 파트너 <span class="site-text-primary">FolLaw</span></div>
                            <div class="twm-bnr-discription">법 앞에 모두가 평등한 세상을 꿈꿉니다.</div>

                            <div class="twm-bnr-search-bar">
                                <form>
                                    <div class="row">


                                        <!--검색분류-->
                                        <div class="form-group col-xl-3 col-lg-6 col-md-6">
                                            <label>검색분류</label>
                                            <select class="wt-search-bar-select selectpicker" title="" id="j-All_Category" data-bv-field="size">
                                                <option selected>분류를 선택하세요.</option>
                                                <option>변호사</option>
                                                <option>법률사무소</option>
                                                <option>법원</option>
                                            </select>
                                        </div>

                                        <!--검색창-->
                                        <div class="form-group col-xl-3 col-lg-6 col-md-6" style="width: 50% !important; @media (min-width: 992px) { width: 100% !important; } @media (min-width: 768px) { width: 100% !important; }">
                                            <label>검색어</label>
                                            <div class="twm-inputicon-box">
                                                <input name="username" type="text" required class="form-control" placeholder="검색어를 입력하세요.">
                                            </div>
                                        </div>
                                        
                                        <!--검색버튼-->
                                        <div class="form-group col-xl-3 col-lg-6 col-md-6">
                                            <button type="button" class="site-button">검색</button>
                                        </div>

                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <!--right Section-->
                    <div class="col-xl-6 col-lg-6 col-md-12 twm-bnr-right-section"  style="z-index: 1;">
                        <div class="twm-bnr-right-content">

                            <div class="twm-img-bg-circle-area">
                                <div class="twm-img-bg-circle1 rotate-center"><span></span></div>
                                <div class="twm-img-bg-circle2 rotate-center-reverse"><span></span></div>
                                <div class="twm-img-bg-circle3"><span></span></div>
                            </div>

                            <div class="twm-bnr-right-carousel">



                            </div>

                            

                            <!--Samll Ring Left-->
                            <div class="twm-small-ring-l slide-top-animation"></div>
                            <div class="twm-small-ring-2 slide-top-animation"></div>

                            

                        </div>
                    </div>

                </div>
                <div class="twm-gradient-text" style="padding-left: 1350px;">
                    Law
                </div>
            </div>
            <!--Banner End-->
            
            <!-- OUR BLOG START -->
            <div class="section-full p-t120 p-b90 site-bg-gray">
	            <div class="container">
		            <div id="notice_content">
						<div id="n_box">
						<hr>
							<h2 id="notice">공지사항</h2>
							
							<!-- 글쓰기 -->
							<div class="notice_writing">
								<input class="n_btn_writing" type="button" value="글쓰기" onclick="insert_form()">
							</div>
							
							<div class="n_select_box">
								<div class="n_select">
									<select id="search">
										<option value="all">전체</option>
										<option value="name">작성자</option>
										<option value="title">제목</option>
										<option value="content">내용</option>
										<option value="regdate">작성일자</option>
									</select>
									<input id="search_text" value="${ param.search_text }" placeholder="검색어를 입력하세요">
									<input class="btn btn-primary btn-sm" type="button" value="검색" onclick="find();">
								</div>
							</div>
						</div>
						<div class="notice_info">
							<table class="table">
								<tr class="n_table">
									<th class="n_list">번호</th>
									<th class="n_title">제목</th>
									<th class="n_list">작성자</th>
									<th class="n_list">작성일자</th>
									<th class="n_list">조회수</th>
								</tr>
								
								<!-- Data없는경우 -->
								<c:if test="${ empty list }">
									<tr>
										<td colspan="5">
											<div id="empty_message">게시물이 없습니다</div>
										</td>
									</tr>
								</c:if>
								
								<!-- Data있는경우 -->
								<!-- for (NoticeVo vo : list) -->
								<c:forEach var="vo" items="${ list }">
									<tr>
										<td class="n_list_on">${ vo.board_idx }</td>
										<td><p class="n_title_on"><a href="view?board_idx=${ vo.board_idx }&page=${ (empty param.page) ? 1 : param.page }&search=${ (empty param.search) ? 'all' : param.search }&search_text=${ param.search_text }">${ vo.board_title }</a></p></td>
										<td class="n_list_on">${ vo.user_id }</td>
										<td class="n_list_on">${ fn:substring(vo.board_register_date,0,10) }</td>
										
									</tr>
								</c:forEach>
								
							</table>
						</div>
		            </div>
	            </div>
            </div>
            <!-- OUR BLOG END -->



        <!-- CONTENT END -->

    <%@include file="../follaw/footer.jsp" %>

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

<!-- notice.js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/notice.js"></script>


</body>

</html>
