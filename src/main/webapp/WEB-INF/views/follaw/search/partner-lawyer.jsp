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
    $(document).ready(function() {
        // 모달이 열릴 때마다 정보 설정
        $('#lawyer_popup').on('show.bs.modal', function (event) {
            // 클릭된 버튼
            var button = $(event.relatedTarget);

            // 버튼에서 가져온 데이터
            var name = button.data('name');
            var photo = button.data('photo');
            var field = button.data('field');
            var tel = button.data('tel');
            var office = button.data('office');
            var exam = button.data('exam');
            var acq_year = button.data('acq_year');

            // 모달 내부 요소에 정보 표시
            $('#lawyer_name').val(name);
            $('#lawyer_photo').attr('src', photo);
            $('#lawyer_field').text(field);
            $('#lawyer_tel').val(tel);
            $('#lawyer_office').val(office);
            $('#lawyer_exam').val(exam);
            $('#lawyer_acq_year').val(acq_year);
        });
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
    <title>FolLaw | 파트너 변호사</title>
    
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
                            <div class="banner-title-name">
                                <h2 class="wt-title">파트너 변호사</h2>
                            </div>
                        </div>   

                        <div>
                            <ul class="wt-breadcrumb breadcrumb-style-2">
                                <li>FOLLAW의 파트너 변호사입니다.<br/>채팅상담, 화상상담, 지식인 상담이 가능합니다.</li>
                            </ul>
                        </div>

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
                                                                            
                                    <form action="partner-lawyer" method="POST">

                                        <div class="form-group mb-4">
                                            <h4 class="section-head-small mb-4">이름 검색</h4>
                                            <div class="input-group">
                                                <input type="text" class="form-control" name="searchname" placeholder="변호사 이름을 입력하세요">
                                                <button class="btn" type="button"><i class="feather-search"></i></button>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group mb-4">
                                            <h4 class="section-head-small mb-4">소속 검색</h4>
                                            <div class="input-group">
                                                <input type="text" class="form-control" name="searchoffice" placeholder="법률 사무소 이름을 입력하세요">
                                                <button class="btn" type="button"><i class="feather-search"></i></button>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group mb-4">
                                            <h4 class="section-head-small mb-4">분야 검색</h4>
                                            <div class="input-group">
                                                <input type="text" class="form-control" name="searchfield" placeholder="찾으시는 분야를 입력하세요">
                                                <button class="btn" type="button"><i class="feather-search"></i></button>
                                            </div>
                                        </div>
                                        <div class="text-center"><button type="submit" class="site-button">검색</button></div>
                                    </form>
                                    
                                </div>

                                
                            </div>

                        </div>

                        <div class="col-lg-8 col-md-12">
                            <h3 style="text-align: center; font-weight: bolder;">파트너변호사</h3>
                            <!--변호사 목록 란-->
                            <div class="twm-candidates-grid-wrap" style="padding-top: 50px;">
    
                                <div class="row">
                                    
                                    <!--파워변호사 한칸-->
                                    <c:forEach items="${powerLawyerList}" var="power">
                                    <div class="col-lg-6 col-md-6">
                                            <div class="twm-candidates-grid-style1 mb-5" style="border: 5px solid #1967d2;">
                                                <div class="twm-media">
                                                    <div class="twm-media-pic" style="margin:auto;">
                                                        <c:set var="defaultImage" value="${pageContext.request.contextPath}/images/null-photo.png" />
                                                        <img src="${empty real.photo ? defaultImage : real.photo}" alt="#" />
                                                    </div>
                                                    <div class="twm-candidates-tag"><span>${power.lawyer_field}</span></div>
                                                </div>
                                                <div class="twm-mid-content">
                                                <h4>${power.lawyer_name}</h4>
                                                <p>변호사</p>
                                                    
                                                <div class="twm-fot-content">
                                                    <a href="#" class="twm-view-prifile site-text-primary" 
                                                        data-bs-toggle="modal" 
                                                        data-bs-target="#lawyer_popup"
                                                        data-bs-dismiss="modal"
                                                        data-name="${power.lawyer_name}"
                                                        data-photo="${real.photo}"
                                                        data-field="${power.lawyer_field}"
                                                        data-tel="${power.lawyer_tel}"
                                                        data-office="${power.lawfirm_name}"
                                                        data-exam="${power.lawyer_exam}"
                                                        data-acq_year="${power.lawyer_acq_year}"
                                                        style="margin-bottom: 0">View More</a>
                                                </div>
                                                </div>
                                                
                                            </div>
                                    </div>
                                    </c:forEach>
                                    <!--한칸 End-->

                                    <!--한칸-->
                                    <c:forEach items="${partnerLawyerList}" var="partner">
                                    <div class="col-lg-6 col-md-6">
                                        <div class="twm-candidates-grid-style1 mb-5">
                                            <div class="twm-media">
                                                <div class="twm-media-pic" style="margin:auto;">
                                                    <c:set var="defaultImage" value="${pageContext.request.contextPath}/images/null-photo.png" />
                                                    <img src="${empty real.photo ? defaultImage : real.photo}" alt="#" />
                                                </div>
                                                <div class="twm-candidates-tag"><span>${partner.lawyer_field}</span></div>
                                            </div>
                                            <div class="twm-mid-content">
                                                <h4>${partner.lawyer_name}</h4>
                                                <p>변호사</p>
                                                
                                                <div class="twm-fot-content">
                                                    <a href="#" class="twm-view-prifile site-text-primary" 
                                                        data-bs-toggle="modal" 
                                                        data-bs-target="#lawyer_popup"
                                                        data-bs-dismiss="modal"
                                                        data-name="${partner.lawyer_name}"
                                                        data-photo="${real.photo}"
                                                        data-field="${partner.lawyer_field}"
                                                        data-tel="${partner.lawyer_tel}"
                                                        data-office="${partner.lawfirm_name}"
                                                        data-exam="${partner.lawyer_exam}"
                                                        data-acq_year="${partner.lawyer_acq_year}"
                                                        style="margin-bottom: 0">View More</a>
                                                </div>
                                            </div>
                                            
                                        </div>
                                    </div>
                                    </c:forEach>
                                    <!--한칸 End-->

                                </div><!--row end-->
                                
                                
                            </div><!--변호사 목록 end-->

                            <!-- 페이징 -->
                            <div class="text-center">
                                <div class="pagination-outer">
                                    <div class="pagination-style1">
                                        <ul class="clearfix">
                                            <c:if test="${maxPages > 1}">
                                                <c:set var="startPage" value="${currentPages - (currentPages % 10) + 1}"/>
                                                <c:set var="endPage" value="${startPage + 9}"/>
                                                <c:if test="${endPage > maxPages}">
                                                    <c:set var="endPage" value="${maxPages}"/>
                                                </c:if>
                                                <c:if test="${startPage > 10}">
                                                    <li class="prev"><a href="partner-lawyer?page=${startPage - 10}" class="num"><span> <i class="fa fa-angle-left"></i> </span></a></li>
                                                </c:if>
                                                <c:forEach var="page" begin="${startPage}" end="${endPage}" step="1">
                                                    <c:choose>
                                                        <c:when test="${page == currentPages}">
                                                            <li class="active"><a href="#" class="num selected">${page}</a></li>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <li><a href="lawyer?page=${page}" class="num">${page}</a></li>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                                <c:if test="${endPage < maxPages}">
                                                    <li class="next"><a href="partner-lawyer?page=${endPage + 1}" class="num"><span> <i class="fa fa-angle-right"></i> </span></a></li>
                                                </c:if>
                                            </c:if>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- 페이징 END -->

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
                                                    <img id="lawyer_photo" src="" alt="#">
                                                 </div>
                                                 Field
                                                 <div class="twm-candidates-tag"><span id="lawyer_field"></span></div>
                                             </div>
                                             <br/>
                                                    Name
                                                    <input name="" id="lawyer_name" type="text" class="form-control" value="" style="text-align: center; height: 50px;" readonly>
                                                    LawOffice
                                                    <input name="" id="lawyer_office" type="text" class="form-control" value="" style="text-align: center; height: 50px;" readonly>
                                                    OfficialTel
                                                    <input name="" id="lawyer_tel" type="text" class="form-control" value="" style="text-align: center; height: 50px;" readonly>
                                                    LicenceTest
                                                    <div style="display: flex;">
                                                        <input name="" id="lawyer_exam" type="text" class="form-control" value="" style="text-align: center; height: 50px; width: 230px;" readonly>
                                                        <input name="" id="lawyer_acq_year" type="text" class="form-control" value="" style="text-align: center; height: 50px; width: 230px;" readonly>
                                                    </div>
                                             </div>
                                             

                                    </div>    
                            </div>
                    </div>
                </div>
            </div>
            
            <!--변호사팝업 END-->
           
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




</body>

</html>
