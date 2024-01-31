<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

// 소속 변호사 버튼 클릭 이벤트 처리
$(document).on('click','#lawyersearch',function(e){
    e.preventDefault(); // 버튼의 기본 동작(링크 이동)을 막음
    // 클릭된 버튼
    var button = $(this);
    // 버튼 통해 보낸 데이터 받음
    var name = button.data('name')
    // '법무법인'과 '법무법인(유한)'을 제외한 텍스트 추출
    var searchText = name.replace(/법무법인\(유한\)|법무법인|종합|법률사무소|\s/g, '');
    // 이동할 url
    var searchUrl = 'lawyer?searchoffice=' + searchText;
    // 생성된 url로 이동
    window.location.href = searchUrl;
    
});
    
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
    <title>FolLaw | 법률사무소</title>
    
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

           <!-- SECTION CONTENT START -->
           <div class="section-full">
            <div class="half-map-list p-a20">
                <div class="wt-listing-full-width">
                        <br/>
                        <br/>
                    <form id="searchForm">
                        <!--Search Bar-->

                        <!--Basic Information-->
                        <div class="panel panel-default">
                            <div class="panel-heading wt-panel-heading p-a20">
                                <h4 class="panel-tittle m-a0"><i class="fa fa-suitcase"></i>법률사무소 검색</h4>
                            </div>
                            <div class="panel-body wt-panel-body p-a20">
                                
                                <div class="row">
                                    <!--지역--> 
                                    <div class="col-xl-6 col-lg-6 col-md-12">
                                        <div class="form-group city-outer-bx has-feedback">
                                            <label>지역</label>
                                            <div class="ls-inputicon-box">  
                                                <select class="wt-select-box selectpicker" name="option" data-live-search="true" title="" id="option" data-bv-field="size">
                                                    <option value="전국">전국</option>
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
                                                <i class="fs-input-icon fa fa-map-marker-alt"></i>
                                            </div>
                                            
                                        </div>
                                    </div>

                                    <!--일반검색--> 
                                    <div class="col-xl-6 col-lg-6 col-md-12">
                                        <div class="form-group">
                                            <label>일반검색</label>
                                            <div class="ls-inputicon-box"> 
                                                <input class="form-control" name="name" type="text" id="name" placeholder="검색어를 입력하세요.">
                                                <i class="fs-input-icon fa fa-file-alt"></i>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="col-lg-12 col-md-12">                                   
                                        <div class="text-center">
                                            <button type="button" class="site-button" id="mylocation" style="background-color: black;">현재 내 위치</button>
                                            <button type="submit" class="site-button" id="searchButton">검색</button>
                                        </div>
                                    </div> 
    
                                </div>
                                         
                            </div>
                        </div> 
                        
                    </form>
                </div>
        
                <div class="p-a30 side-bar-opposite" id="result">
                
                    <div class="wt-listing-container">
                        <div class="row">
                        
                            <c:forEach items="${lawfirmList}" var="lawfirm">
                            <!--Block one-->
                            <div class="col-lg-6 col-md-12 m-b30">

                                <div class="twm-jobs-grid-style1">
                                    <div class="twm-mid-content" style="padding-top:0px; text-align: center;">
                                            <h4>${lawfirm.lawfirm_name}</h4>
                                        <p class="twm-job-address">${lawfirm.address_val}</p>
                                    </div>
                                    <div class="twm-right-content" style="text-align: center;">
                                        <a href="" class="twm-jobs-browse site-text-primary" data-lat="${lawfirm.address_lat}" data-lng="${lawfirm.address_long}">위치보기</a>
                                        <a href="#" id="lawyersearch" class="site-button" data-name="${lawfirm.lawfirm_name}">소속 변호사</a>
                                    </div>
                                </div>
                            </div>
                            <!--Block one END-->
                            </c:forEach>
                            
                            
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Right part -->
            <div class="half-map-section">
            
                <div class="user-msg-list-btn-outer">
                    <button class="map-show-btn-close">Close</button>
                    <button class="map-show-btn-open">View Map</button>
                </div> 
                                    
                <div id="map-container">
              
                    <div id="map" data-map-zoom="9">
                        <!-- map goes here -->
                    </div>
                </div>
            </div>            
            <!-- Right part END -->                 
           </div>
           <!-- SECTION CONTENT END  -->
            
     
        </div>
<!--CONTENT END-->


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


<script defer src="${pageContext.request.contextPath}/js/map-lawoffice.js"></script>
<script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCEgUWcJMaW2UT3AMxwsnBg-D1LPBhnP_U&callback=initMap"></script>





</body>

</html>
