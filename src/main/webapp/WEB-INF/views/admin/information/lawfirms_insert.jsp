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
    <title>관리자 | 법률사무소</title>
    
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
                        <h4>법률사무소 등록</h4>
                    </div>

                    <div class="container" id="box" style="padding-top: 50px;">

                        <!--Basic Information-->
                        <form action="lawfirms_insert_submit">
                            <div class="twm-right-section-panel site-bg-primary">
                                <div class="panel panel-default">
                                    <div class="panel-body wt-panel-body p-a20 ">

                                        <div class="twm-tabs-style-1">
                                                
                                            <div class="row">
                                                <div class="col-xl-3 col-lg-12 col-md-12">
                                                    <div class="form-group">
                                                        <label>법률사무소명</label>
                                                        <div class="ls-inputicon-box">
                                                            <input class="form-control" name="lawfirm_name" type="text" value="" placeholder="법률사무소명을 입력하세요" required>
                                                            <i class="fs-input-icon fa fa-language"></i>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-xl-3 col-lg-12 col-md-12">
                                                    <div class="form-group">
                                                        <label>지역</label>
                                                        <div class="ls-inputicon-box"> 
                                                            <select class="wt-select-box selectpicker" name="lawfirm_city" data-live-search="true" id="option" required>
                                                                <option value="서울">서울</option>
                                                                <option value="경기">경기</option>
                                                                <option value="인천">인천</option>
                                                                <option value="대전">대전</option>
                                                                <option value="세종">세종</option>
                                                                <option value="광주">광주</option>
                                                                <option value="대구">대구</option>
                                                                <option value="울산">울산</option>
                                                                <option value="부산">부산</option>
                                                                <option value="충남">충남</option>
                                                                <option value="충북">충북</option>
                                                                <option value="전남">전남</option>
                                                                <option value="전북">전북</option>
                                                                <option value="경남">경남</option>
                                                                <option value="경북">경북</option>
                                                                <option value="제주">제주</option>
                                                            </select>
                                                            <i class="fs-input-icon fa fa-globe-americas"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                                <div class="col-xl-6 col-lg-12 col-md-12">
                                                    <div class="form-group">
                                                        <label>주소</label>
                                                        <div class="ls-inputicon-box"> 
                                                            <input class="form-control" name="address_val" type="text" value="" placeholder="주소를 입력하세요" required>
                                                            <i class="fs-input-icon fa fa-map-marker-alt"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                                <div class="col-xl-6 col-lg-12 col-md-12">
                                                    <div class="form-group">
                                                        <label>위도</label>
                                                        <div class="ls-inputicon-box"> 
                                                            <input class="form-control" name="address_lat" type="text" value="" placeholder="위도를 입력하세요" required>
                                                            <i class="fs-input-icon fa fa-map-pin"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                                <div class="col-xl-6 col-lg-12 col-md-12">
                                                    <div class="form-group">
                                                        <label>경도</label>
                                                        <div class="ls-inputicon-box"> 
                                                            <input class="form-control" name="address_long" type="text" value="" placeholder="경도를 입력하세요" required>
                                                            <i class="fs-input-icon fa fa-map-pin"></i>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-xl-12 col-lg-12 col-md-12"> 
                                                    <div class="text-center">
                                                        <a class="site-button" href="lawfirms" style="background-color: black;">취소</a>
                                                        <button type="submit" class="site-button" id="ok">저장</button>
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
        alert("정상적으로 등록되었습니다.")
    })
</script>

<!-- notice.js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/admin_notice.js"></script>

</body>

</html>
    