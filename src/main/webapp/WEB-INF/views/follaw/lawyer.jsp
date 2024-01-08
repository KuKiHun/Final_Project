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
    <title>FolLaw | 변호사 검색</title>
    
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


    <%@include file="header_loading.jsp" %>

      
        <!-- CONTENT START -->
        <div class="page-content">

            <!-- INNER PAGE BANNER -->
            <div class="wt-bnr-inr overlay-wraper bg-center" style="background-image:url(${pageContext.request.contextPath}/images/banner/1.jpg);">
                <div class="overlay-main site-bg-white opacity-01"></div>
                <div class="container">
                    <div class="wt-bnr-inr-entry">
                        <div class="banner-title-outer">
                            <div class="banner-title-name">
                                <h2 class="wt-title">변호사 검색</h2>
                            </div>
                        </div>
                        <!-- BREADCRUMB ROW -->                            
                        
                            <div>
                                <ul class="wt-breadcrumb breadcrumb-style-2">
                                    <li>검색</li>
                                    <li>변호사 검색</li>
                                </ul>
                            </div>
                        
                        <!-- BREADCRUMB ROW END -->                        
                    </div>
                </div>
            </div>
            <!-- INNER PAGE BANNER END -->


            <!-- OUR BLOG START -->
            <div class="section-full p-t120  p-b90 site-bg-white">
                

                <div class="container">
                    <div class="row">
                        
                        <div class="col-lg-4 col-md-12 rightSidebar">

                            <div class="side-bar">

                                <div class="sidebar-elements search-bx">
                                                                            
                                    <form>

                                        <div class="form-group mb-4">
                                            <h4 class="section-head-small mb-4">이름 검색</h4>
                                            <div class="input-group">
                                                <input type="text" class="form-control" placeholder="변호사 이름을 입력하세요">
                                                <button class="btn" type="button"><i class="feather-search"></i></button>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group mb-4">
                                            <h4 class="section-head-small mb-4">소속 검색</h4>
                                            <div class="input-group">
                                                <input type="text" class="form-control" placeholder="법률 사무소 이름을 입력하세요">
                                                <button class="btn" type="button"><i class="feather-search"></i></button>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group mb-4">
                                            <h4 class="section-head-small mb-4">분야 검색</h4>
                                            <div class="input-group">
                                                <input type="text" class="form-control" placeholder="찾으시는 분야를 입력하세요">
                                                <button class="btn" type="button"><i class="feather-search"></i></button>
                                            </div>
                                        </div>
                                        
                                    </form>
                                    
                                </div>

                                
                            </div>

                            <div class="twm-advertisment">
                               <div class="overlay"></div>
                               <h4 class="twm-title">본인의 프로필을 등록하실 건가요?</h4>
                               <p>나의 변호사 정보를 등록하시면<br>
                                수많은 회원들에게 나를 알릴 수 있어요</p>
                                <a href="about-1.html" class="site-button white">변호사 프로필 등록</a> 
                            </div>

                        </div>

                        <div class="col-lg-8 col-md-12">
                            <!--Filter Short By-->
                            <div class="product-filter-wrap d-flex justify-content-between align-items-center m-b30">


                            </div>
                            
                            <!--변호사 목록 란-->
                            <div class="twm-candidates-grid-wrap">
                                
                                <div class="row">
                                    
                                    <!--한칸-->
                                    <div class="col-lg-6 col-md-6">
                                         <div class="twm-candidates-grid-style1 mb-5">
                                             <div class="twm-media">
                                                 <div class="twm-media-pic" style="margin:auto;">
                                                    <img src="${pageContext.request.contextPath}/images/candidates/pic1.jpg" alt="#">
                                                 </div>
                                                 <div class="twm-candidates-tag"><span>행정,민사,가사,형사,조세</span></div>
                                             </div>
                                             <div class="twm-mid-content">
                                                <h4>홍길동</h4>
                                                <p>변호사</p>
                                                 
                                                <div class="twm-fot-content">
                                                    <a href="" class="twm-view-prifile site-text-primary" data-bs-toggle="modal" data-bs-target="#lawyer_popup" data-bs-dismiss="modal" style="margin-bottom:0 ">View More</a>
                                                </div>
                                             </div>
                                             
                                         </div>
                                    </div>
                                    <!--한칸 End-->
                                    
                                    <!--한칸-->
                                    <div class="col-lg-6 col-md-6">
                                         <div class="twm-candidates-grid-style1 mb-5">
                                             <div class="twm-media">
                                                 <div class="twm-media-pic" style="margin:auto;">
                                                    <img src="${pageContext.request.contextPath}/images/candidates/pic1.jpg" alt="#">
                                                 </div>
                                                 <div class="twm-candidates-tag"><span>행정,민사,가사,형사,조세</span></div>
                                             </div>
                                             <div class="twm-mid-content">
                                                <h4>홍길동</h4>
                                                <p>변호사</p>
                                                 
                                                <div class="twm-fot-content">
                                                    <a href="" class="twm-view-prifile site-text-primary" data-bs-toggle="modal" data-bs-target="#lawyer_popup" data-bs-dismiss="modal" style="margin-bottom:0 ">View More</a>
                                                </div>
                                             </div>
                                             
                                         </div>
                                    </div>
                                    <!--한칸 End-->
                                    
                                    <!--한칸-->
                                    <div class="col-lg-6 col-md-6">
                                         <div class="twm-candidates-grid-style1 mb-5">
                                             <div class="twm-media">
                                                 <div class="twm-media-pic" style="margin:auto;">
                                                    <img src="${pageContext.request.contextPath}/images/candidates/pic1.jpg" alt="#">
                                                 </div>
                                                 <div class="twm-candidates-tag"><span>행정,민사,가사,형사,조세</span></div>
                                             </div>
                                             <div class="twm-mid-content">
                                                <h4>홍길동</h4>
                                                <p>변호사</p>
                                                 
                                                <div class="twm-fot-content">
                                                    <a href="" class="twm-view-prifile site-text-primary" data-bs-toggle="modal" data-bs-target="#lawyer_popup" data-bs-dismiss="modal" style="margin-bottom:0 ">View More</a>
                                                </div>
                                             </div>
                                             
                                         </div>
                                    </div>
                                    <!--한칸 End-->
                                    
                                    <!--한칸-->
                                    <div class="col-lg-6 col-md-6">
                                         <div class="twm-candidates-grid-style1 mb-5">
                                             <div class="twm-media">
                                                 <div class="twm-media-pic" style="margin:auto;">
                                                    <img src="${pageContext.request.contextPath}/images/candidates/pic1.jpg" alt="#">
                                                 </div>
                                                 <div class="twm-candidates-tag"><span>행정,민사,가사,형사,조세</span></div>
                                             </div>
                                             <div class="twm-mid-content">
                                                <h4>홍길동</h4>
                                                <p>변호사</p>
                                                 
                                                <div class="twm-fot-content">
                                                    <a href="" class="twm-view-prifile site-text-primary" data-bs-toggle="modal" data-bs-target="#lawyer_popup" data-bs-dismiss="modal" style="margin-bottom:0 ">View More</a>
                                                </div>
                                             </div>
                                             
                                         </div>
                                    </div>
                                    <!--한칸 End-->

                                </div><!--row end-->
                                
                                
                            </div><!--변호사 목록 end-->

                            <div class="pagination-outer">
                                <div class="pagination-style1">
                                    <ul class="clearfix">
                                        <li class="prev"><a href="javascript:;"><span> <i class="fa fa-angle-left"></i> </span></a></li>
                                        <li><a href="javascript:;">1</a></li>
                                        <li class="active"><a href="javascript:;">2</a></li>
                                        <li><a href="javascript:;">3</a></li>
                                        <li><a class="javascript:;" href="javascript:;"><i class="fa fa-ellipsis-h"></i></a></li>
                                        <li><a href="javascript:;">5</a></li>
                                        <li class="next"><a href="javascript:;"><span> <i class="fa fa-angle-right"></i> </span></a></li>
                                    </ul>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            </div>   
            <!-- OUR BLOG END -->
    
            <!--변호사팝업-->
            
            <div class="modal fade twm-sign-up" id="lawyer_popup" aria-hidden="true" aria-labelledby="lawyer_popup1" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                            <div class="modal-header">
                                <h2 class="modal-title" id="lawyer_popup1">변호사정보</h2>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                         <div class="twm-candidates-grid-style1 mb-5" style="height: 550px; width: 500px; margin: 0 auto;">
                                             <div class="twm-media">
                                                 <div class="twm-media-pic" style="margin:auto; height: 150px; width: 150px;">
                                                    <img src="https://www.klaw.or.kr/pimg/profile/2023/2023-11-15/001/202311151710448747obclhwz.png" alt="#">
                                                 </div>
                                                 Field
                                                 <div class="twm-candidates-tag"><span>행정,민사,가사,형사,조세</span></div>
                                             </div>
                                             <br/>
                                                    Name
                                                    <input name="" type="text" class="form-control" value="홍길동" style="text-align: center;" readonly>
                                                    LawOffice
                                                    <input name="" type="text" class="form-control" value="홍길동 법률사무소" style="text-align: center;" readonly>
                                                    OfficialTel
                                                    <input name="" type="text" class="form-control" value="010-1234-5678" style="text-align: center;" readonly>
                                             </div>
                                             

                                    </div>    
                            </div>
                    </div>
                </div>
            </div>
            
            <!--변호사팝업 END-->
            
        </div>
        <!-- CONTENT END -->

    <%@include file="footer.jsp" %>

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
