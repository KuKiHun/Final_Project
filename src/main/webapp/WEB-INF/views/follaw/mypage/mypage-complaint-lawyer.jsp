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
    <title>FolLaw | 마이페이지</title>
    
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
                                <h2 class="wt-title">마이페이지</h2>
                            </div>
                        </div>                      
                    </div>
                </div>
            </div>
            <!-- INNER PAGE BANNER END -->


            <!-- OUR BLOG START -->
            <div class="section-full p-t120  p-b90 site-bg-white">
                

                <div class="container">
                    <div class="row">
                        
                        <div class="col-xl-3 col-lg-4 col-md-12 rightSidebar m-b30">

                            <div class="side-bar-st-1">
                                
                                <div class="twm-candidate-profile-pic">
                                    
                                    <img src="${pageContext.request.contextPath}/images/user-avtar/userimage.png" alt="">
                                    
                                </div>
                                <div class="twm-mid-content text-center">
                                        <h4>홍길동</h4>
                                    <p>일반회원</p>
                                </div>
                               
                                <div class="twm-nav-list-1">
                                    <ul>
                                        <li><a href="mypage-lawyer"><i class="fa fa-user"></i> 개인정보수정</a></li>
                                        <li><a href="mypage-pass-lawyer"><i class="fa fa-fingerprint"></i>비밀번호수정</a></li>
                                        <li><a href="mypage-post-lawyer"><i class="fa fa-receipt"></i>내가 작성한 게시글</a></li>
                                        <li><a href="mypage-membership"><i class="fa fa-suitcase"></i>파워변호사 멤버스</a></li>
                                        <li class="active"><a href="mypage-complaint-lawyer"><i class="fa fa-bell"></i>신고하기</a></li>
                                    </ul>
                                </div>
                                
                            </div>

                        </div>

                        <div class="col-xl-9 col-lg-8 col-md-12 m-b30">
                            <!--Filter Short By-->
                            <div class="twm-right-section-panel site-bg-gray">
                                <form>
                                    
                
                                    <!--Basic Information-->
                                    <div class="panel panel-default">
                                        <div class="panel-heading wt-panel-heading p-a20">
                                            <h4 class="panel-tittle m-a0">신고하기</h4>
                                        </div>
                                        <br/>
                                        <div class="container">
                                            <div class="row d-flex justify-content-center">
                                                
                                                <div class="col-lg-8 col-md-12">
                                                    <div class="twm-right-section-panel-wrap2">
                                                        <!--Filter Short By-->
                                                        <div class="twm-right-section-panel site-bg-primary">
                                                            
                                                            <!--Basic Information-->
                                                            <div class="panel panel-default">
                                                                <div class="panel-body wt-panel-body p-a20 ">
                        
                                                                    
                        
                                                                    <div class="twm-tabs-style-1">
                                                                            
                                                                        <div class="row">
                                                                            <div class="col-xl-12 col-lg-12 col-md-12">
                                                                                <div class="form-group">
                                                                                    <label>제목</label>
                                                                                    <div class="ls-inputicon-box"> 
                                                                                        <input class="form-control" name="" type="text" placeholder="제목을 입력하세요" required>
                                                                                        <i class="fs-input-icon fa fa-user"></i>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xl-12 col-lg-12 col-md-12">
                                                                                <div class="form-group">
                                                                                    <label>신고유형</label>
                                                                                    <div class="col-xl-12 col-lg-6 col-md-12">
                                                                                            <div class="ls-inputicon-box">  
                                                                                                <select class="wt-select-box selectpicker" title="" id="j-category" data-bv-field="size" required>
                                                                                                    <option class="bs-title-option" value="">유형선택</option>
                                                                                                    <option>욕설/비방</option>
                                                                                                    <option>사칭/사기</option>
                                                                                                    <option>도배</option>
                                                                                                    <option>홍보/상업성</option>
                                                                                                    <option>음란물</option>
                                                                                                    <option>불법촬영물</option>
                                                                                                    <option>기타</option>
                                                                                                </select>
                                                                                                <i class="fs-input-icon fa fa-bell"></i>
                                                                                            </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                                <div class="col-xl-6 col-lg-12 col-md-12">
                                                                                    <div class="form-group">
                                                                                        <label>작성자</label>
                                                                                        <div class="ls-inputicon-box"> 
                                                                                            <input class="form-control" name="" type="text" value="홍길동" readonly>
                                                                                            <i class="fs-input-icon fa fa-user"></i>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-xl-6 col-lg-12 col-md-12">
                                                                                    <div class="form-group">
                                                                                        <label>신고자</label>
                                                                                        <div class="ls-inputicon-box"> 
                                                                                            <input class="form-control" name="" type="text" placeholder="신고자를 입력하세요" required>
                                                                                            <i class="fs-input-icon fa fa-user"></i>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                        
                                                                                <div class="col-md-12">
                                                                                    <div class="form-group">
                                                                                        <label>내용</label>
                                                                                        <textarea class="form-control" rows="3" placeholder="내용을 입력하세요"></textarea>
                                                                                    </div>
                                                                                </div>
                                                                                         
                                                                                <div class="col-xl-12 col-lg-12 col-md-12"> 
                                                                                    <div class="text-center">
                                                                                        <button type="submit" class="site-button">제출</button>
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
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </div>   
            <!-- OUR BLOG END -->
          
            
     
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
