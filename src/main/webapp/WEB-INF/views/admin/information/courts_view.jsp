<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html lang="en">

<head>

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
    <title>관리자 | 법원</title>
    
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
      
    <!-- notice --> 
    <link rel="stylesheet"href="${pageContext.request.contextPath}/css/admin_notice_view.css">
 
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
                    
                    <!-- Right Side Content -->
                    <div class="header-right">
                        
                    </div>
                    <!-- Right Side Content End -->
        
                </div>
            </div>
            <!-- Header End -->
        
        </header>            
    	
        <!-- Sidebar Holder -->
        <%@include file="../adminSidebar.jsp" %>

        <!-- Page Content Holder -->
        <div id="content">
            <div class="content-admin-main">
                <div class="panel panel-default site-bg-white m-t30">
                    <div class="panel-heading wt-panel-heading p-a20">
                        <h4>법원 상세보기</h4>
                    </div>

                    <div class="container" id="box" style="padding-top: 50px;">

                        <!--Basic Information-->
                        <form action="courts_view_update">
                            <div class="twm-right-section-panel site-bg-primary">
                                <div class="panel panel-default">
                                    <div class="panel-body wt-panel-body p-a20 ">

                                        <div class="twm-tabs-style-1">
                                                
                                            <div class="row">
                                                <div class="col-xl-3 col-lg-12 col-md-12">
                                                    <div class="form-group">
                                                        <label>법원명</label>
                                                        <div class="ls-inputicon-box"> 
                                                            <input name="courts_idx" type="hidden" value="${courts.courts_idx}">
                                                            <input class="form-control" name="courts_name" type="text" value="${courts.courts_name}" readonly>
                                                            <i class="fs-input-icon fa fa-language"></i>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-xl-3 col-lg-12 col-md-12">
                                                    <div class="form-group">
                                                        <label>지역</label>
                                                        <div class="ls-inputicon-box"> 
                                                            <select class="wt-select-box selectpicker" name="courts_city" data-live-search="true" id="option">
                                                                <option value="서울" ${courts.courts_city == '서울' ? 'selected' : ''}>서울</option>
                                                                <option value="경기" ${courts.courts_city == '경기' ? 'selected' : ''}>경기</option>
                                                                <option value="인천" ${courts.courts_city == '인천' ? 'selected' : ''}>인천</option>
                                                                <option value="대전" ${courts.courts_city == '대전' ? 'selected' : ''}>대전</option>
                                                                <option value="세종" ${courts.courts_city == '세종' ? 'selected' : ''}>세종</option>
                                                                <option value="광주" ${courts.courts_city == '광주' ? 'selected' : ''}>광주</option>
                                                                <option value="대구" ${courts.courts_city == '대구' ? 'selected' : ''}>대구</option>
                                                                <option value="울산" ${courts.courts_city == '울산' ? 'selected' : ''}>울산</option>
                                                                <option value="부산" ${courts.courts_city == '부산' ? 'selected' : ''}>부산</option>
                                                                <option value="충남" ${courts.courts_city == '충남' ? 'selected' : ''}>충남</option>
                                                                <option value="충북" ${courts.courts_city == '충북' ? 'selected' : ''}>충북</option>
                                                                <option value="전남" ${courts.courts_city == '전남' ? 'selected' : ''}>전남</option>
                                                                <option value="전북" ${courts.courts_city == '전북' ? 'selected' : ''}>전북</option>
                                                                <option value="경남" ${courts.courts_city == '경남' ? 'selected' : ''}>경남</option>
                                                                <option value="경북" ${courts.courts_city == '경북' ? 'selected' : ''}>경북</option>
                                                                <option value="제주" ${courts.courts_city == '제주' ? 'selected' : ''}>제주</option>
                                                            </select>
                                                            <i class="fs-input-icon fa fa-globe-americas"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                                <div class="col-xl-6 col-lg-12 col-md-12">
                                                    <div class="form-group">
                                                        <label>주소</label>
                                                        <div class="ls-inputicon-box"> 
                                                            <input class="form-control" name="address_val" type="text" value="${courts.address_val}">
                                                            <i class="fs-input-icon fa fa-map-marker-alt"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                                <div class="col-xl-6 col-lg-12 col-md-12">
                                                    <div class="form-group">
                                                        <label>위도</label>
                                                        <div class="ls-inputicon-box"> 
                                                            <input class="form-control" name="address_lat" type="text" value="${courts.address_lat}">
                                                            <i class="fs-input-icon fa fa-map-pin"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                                <div class="col-xl-6 col-lg-12 col-md-12">
                                                    <div class="form-group">
                                                        <label>경도</label>
                                                        <div class="ls-inputicon-box"> 
                                                            <input class="form-control" name="address_long" type="text" value="${courts.address_long}">
                                                            <i class="fs-input-icon fa fa-map-pin"></i>
                                                        </div>
                                                    </div>
                                                </div>

            
                                                    <div class="col-xl-12 col-lg-12 col-md-12"> 
                                                        <div class="text-center">
                                                            <a class="site-button" href="courts" style="background-color: black;">목록</a>
                                                            <button type="submit" class="site-button" id="ok">수정완료</button>
                                                            <a class="site-button" href="" style="background-color: rgb(223, 53, 53);">삭제</a>
                                                        </div>
                                                    </div> 
                                                    
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                        
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
<script>
    $(".active").removeClass("active");
    $("li#admin_information").addClass("active");
    $("#ok").click(function(){
        alert("정상적으로 수정되었습니다.")
    })
</script>

<!-- notice.js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/admin_notice.js"></script>

</body>

</html>
    