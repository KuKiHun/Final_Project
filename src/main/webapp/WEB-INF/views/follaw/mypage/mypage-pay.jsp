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
    <link rel="icon" href="${pageContext.request.contextPath}/images/favicon.png" type="image/x-icon" />
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.png" />
    
    <!-- PAGE TITLE HERE -->
    <title>FolLaw | 멤버스 결제</title>
    
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


    <%@include file="../header_loading.jsp" %>

      
        <!-- CONTENT START -->
        <div class="page-content">

            <!-- INNER PAGE BANNER -->
            <div class="wt-bnr-inr overlay-wraper bg-center" style="background-image:url(${pageContext.request.contextPath}/images/banner/1.jpg);">
                <div class="overlay-main site-bg-white opacity-01"></div>
                <div class="container">
                    <div class="wt-bnr-inr-entry">
                        <div class="banner-title-outer">
                        </div>
                   
                    </div>
                </div>
            </div>
            <!-- INNER PAGE BANNER END -->

            <!-- PRICING TABLE SECTION START -->
            <div class="section-full p-t120 p-b90 site-bg-white tw-pricing-area">
                
                <div class="container">
                    
                    <!-- TITLE START-->
                    <div class="section-head left wt-small-separator-outer" style="text-align: center;">
                        <h2 class="wt-title">파워변호사 멤버스</h2>
                        <div class="wt-small-separator site-text-primary">
                            <div>월 99,000원에 누리는 풍성한 혜택 지금 가입해 보세요!</div>
                            <div style="color: black;">결제 시 <a href="" class="twm-view-prifile site-text-primary" style="font-weight: bold; text-decoration: underline;" data-bs-toggle="modal" data-bs-target="#pay_agreement" data-bs-dismiss="modal">이용약관</a>에 동의하는것으로 간주됩니다</div>
                            <br/>                               
                        </div>
                    </div>                  
                    <!-- TITLE END-->
                            
                    <div class="section-content">

                        <div class="twm-tabs-style-1">
                          <div class="tab-content" id="myTab3Content">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="Monthly">
                                <div class="pricing-block-outer">
                                    <div class="row justify-content-center">
                                        <div class="col-lg-4 col-md-6 m-b30">
                                            <div class="pricing-table-1">
                                                <div class="p-table-title">
                                                    <h4 class="wt-title product"><span class="pdate">30</span>일권</h4>
                                                </div>
                                                <div class="p-table-inner">
                                                    <div class="p-table-price">
                                                        <span class="price">99000</span><span>원</span>
                                                    </div>
                                                    <div class="p-table-list">
                                                        <ul>
                                                            <li><i class="feather-check"></i>변호사 검색 최상단 표시</li>
                                                        </ul>
                                                    </div>
                                                    <div class="p-table-btn">
                                                        <a href="javascript:;" class="site-button pay">결제하기</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
        
                                        <div class="col-lg-4 col-md-6 p-table-highlight m-b30">
                                            <div class="pricing-table-1 circle-yellow">
                                                <div class="p-table-recommended">20% 할인 이벤트</div>
                                                <div class="p-table-title">
                                                    <h4 class="wt-title product"><span class="pdate">60</span>일권</h4>
                                                </div>
                                                <div class="p-table-inner">
                                                   
                                                    <div class="p-table-price">
                                                        <span class="price">159000</span><span>원</span>
                                                    </div>
                                                    <div class="p-table-list">
                                                        <ul>
                                                            <li><i class="feather-check"></i>변호사 검색 최상단 표시</li>
                                                        </ul>
                                                    </div>
                                                    <div class="p-table-btn">
                                                        <a href="javascript:;" class="site-button pay">결제하기</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="col-lg-4 col-md-6 m-b30">
                                            <div class="pricing-table-1 circle-pink">
                                                <div class="p-table-recommended">30% 할인 이벤트</div>
                                                <div class="p-table-title">
                                                    <h4 class="wt-title product"><span class="pdate">90</span>일권</h4>
                                                </div>
                                                <div class="p-table-inner">
                                                    <div class="p-table-price">
                                                        <span class="price">209000</span><span>원</span>
                                                    </div>
                                                    <div class="p-table-list">
                                                        <ul>
                                                            <li><i class="feather-check"></i>변호사 검색 최상단 표시</li>
                                                        </ul>
                                                    </div>
                                                    <div class="p-table-btn">
                                                        <a href="javascript:;" class="site-button pay">결제하기</a>
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
            <!-- PRICING TABLE SECTION END -->
          
                <!--이용약관-->
                <div class="modal fade twm-sign-up" id="pay_agreement" aria-hidden="true" aria-labelledby="sign_up_popupLabel" tabindex="-1">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
    
                                <div class="modal-header">
                                    <h2 class="modal-title" id="sign_up_popupLabel">파워변호사 멤버스 서비스 이용약관</h2>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
    
                                <div class="modal-body">
                                    <div class="twm-tabs-style-2">
                                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                                        
                                        </ul>
                                        <div class="tab-content" id="myTabContent">
                                        <!--Signup Candidate Content-->  
                                        <div class="tab-pane fade show active" id="sign-candidate">
                                            <div class="row">
    
                                                <div class="col-lg-12">
                                                    <div class="form-group mb-3">
                                                        <textarea name="useragreement" class="form-control" style="overflow-y: auto; height: 490px; "readonly>
제 1 조 [목적]

본 약관은 주식회사 FolLaw(이하 “FolLaw”라 함)가 제공하는 파워변호사 멤버스 서비스를 회원이 이용함에 있어 회원과 FolLaw간의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다.

제 2 조 [정의]

1. “파워변호사 멤버스 서비스”(이하 “멤버십 서비스”라 함)란 컬리가 회원에게 제공하는 서비스 일체를 말합니다.

2. “사이버몰”이란 FolLaw가 상품 또는 용역(이하 “상품 등”이라 함)을 회원에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 상품 등을 거래할 수 있도록 설정한 가상의 영업장 등 FolLaw가 운영하는 웹사이트 및 모바일 웹, 앱 등을 모두 포함)을 말합니다.

3. “회원”이란 본 약관에 동의하여 멤버십 서비스에 가입함으로써 FolLaw와 멤버십 서비스 이용계약(이하 “이용계약”)을 체결한 자를 말합니다.

4. “이용료”란 회원이 멤버십 서비스 이용의 대가로 FolLaw에 지급하는 금원을 말합니다.
                                                        </textarea>
                                                        <br/>
                                                    </div>
                                                </div>                                               
                                                <div class="col-md-12">
                                                    <button class="site-button" aria-label="Close" data-bs-toggle="modal" data-bs-dismiss="modal">확인</button>
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
        <!-- CONTENT END -->

    <%@include file="../footer.jsp" %>

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

<!-- 아임포트 API -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script src="${pageContext.request.contextPath}/js/pay.js"></script>




</body>

</html>
