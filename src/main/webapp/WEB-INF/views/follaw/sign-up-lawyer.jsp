<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.ajaxchimp/1.3.0/jquery.ajaxchimp.min.js"></script>
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
    <title>FolLaw | 변호사회원가입</title>
    
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0/css/bootstrap-select.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0/js/bootstrap-select.min.js"></script>
    <!-- THEME COLOR CHANGE STYLE SHEET -->
    <link rel="stylesheet" class="skin" type="text/css" href="${pageContext.request.contextPath}/css/skins-type/skin-6.css">
       
    
</head>

<body>

    <!--Header, 페이지로딩-->
    <%@include file="header_loading.jsp" %>

      
<!--CONTENT START-->
        
        <div class="page-content">

            
            <!-- INNER PAGE BANNER -->
            <div class="wt-bnr-inr overlay-wraper bg-center" style="background-image:url(${pageContext.request.contextPath}/images/banner/1.jpg);">
            	<div class="overlay-main site-bg-white opacity-01"></div>
                <div class="container">
                    <div class="wt-bnr-inr-entry">
                    	<div class="banner-title-outer">
                        	<div class="banner-title-name">
                        		<h2 class="wt-title">변호사회원가입</h2>
                            </div>
                        </div>                       
                    </div>
                </div>
            </div>
            <!-- INNER PAGE BANNER END -->  
                  
            <!-- EXPLORE NEW LIFE START -->
            <div class="section-full p-t60 p-b120 twm-explore-area bg-cover ">
                   <!--Basic Information-->
                   <div class="panel panel-default">
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
                                                 
                                                        <form action="/lawyer/insertLawyer" method="post" id="lawyer">
                                        
                                                                <div class="twm-tabs-style-2">
                                                                    <div class="tab-content" id="myTabContent">
                                                                        <!--Signup Candidate Content zzzzzzzzzzzz-->
                                                                        <div class="tab-pane fade show active" id="sign-candidate">
                                                                            <div class="row">
                                        
                                                                                <div class="col-lg-12">
                                                                                    <div class="form-group mb-3">
                                                                                        이름
                                                                                        <input id="lawyer_name" name="lawyer_name" type="text" required="" class="form-control">
                                                                                    </div>
                                                                                </div>
                                        
                                                                                <div class="col-lg-12">
                                                                                    <div class="form-group mb-3">
                                                                                        아이디
                                                                                        <input id="lawyer_id" name="lawyer_id" type="email" required="" class="form-control">
                                                                                    </div>
                                                                                </div>
                                        
                                                                                <div class="col-lg-6">
                                                                                    <div class="form-group mb-3">
                                                                                        비밀번호
                                                                                        <input id="lawyer_pass" name="lawyer_pass" type="password" class="form-control" required="">
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-lg-6">
                                                                                    <div class="form-group mb-3">
                                                                                        비밀번호 확인
                                                                                        <input id="lawyer_pwck" name="lawyer_pwck" type="password" class="form-control" required="">
                                                                                    </div>
                                                                                </div>
                                        
                                                                                <div class="col-lg-6">
                                                                                    <div class="form-group mb-3">
                                                                                        전화번호
                                                                                        <input id="lawyer_tel" name="lawyer_tel" type="text" class="form-control" required="">
                                                                                    </div>
                                                                                </div>
                                        
                                                                                <div class="col-lg-6">
                                                                                    <div class="form-group mb-3">
                                                                                        생년월일
                                                                                        <input id="lawyer_birth" name="lawyer_birth" type="date" class="form-control" required="">
                                                                                    </div>
                                                                                </div>
                                        
                                                                                <div class="col-lg-6">
                                                                                    <div class="form-group mb-3">
                                                                                        활동지역 
                                                                                            <select class="wt-select-box selectpicker" name="option" data-live-search="true" title="" id="lawyer_area" data-bv-field="size" required>
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
                                                                                    </div>
                                                                                </div>
                                        
                                                                                <div class="col-lg-6">
                                                                                    <div class="form-group mb-3">
                                                                                        소속
                                                                                        <select class="wt-select-box selectpicker" name="lawfirm_idx" data-live-search="true" title="" id="lawfirm_idx" data-bv-field="size" required>
                                                                                            <option value="895">소속없음</option>
                                                                                            <c:forEach items="${signupLawfirm}" var="lawfirm">
                                                                                                <option value="${lawfirm.lawfirm_idx}" style="width: 200px;">${lawfirm.lawfirm_name}</option>
                                                                                            </c:forEach>
                                                                                        </select>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="col-lg-12">
                                                                                    <div class="form-group mb-3">
                                                                                        전문분야
                                                                                        <input id="lawyer_field" name="lawyer_field" type="text" class="form-control" placeholder="ex) 형사 민사 교통사고 이혼 가상화폐 학교폭력" required="">
                                                                                    </div>
                                                                                </div>
                                        
                                                                                <div class="col-lg-4">
                                                                                    <div class="form-group mb-3">
                                                                                        출신시험선택
                                                                                        <select class="wt-select-box selectpicker" name="lawyer_exam" title="" id="j-category" data-bv-field="size" required="">
                                                                                            <option class="bs-title-option" value="">시험선택</option>
                                                                                            <option>사법고시</option>
                                                                                            <option>변호사시험</option>
                                                                                            <option>군법무관 임용시험</option>
                                                                                            <option>고등고시</option>
                                                                                        </select>
                                                                                    </div>
                                                                                </div>
                                        
                                                                                <div class="col-lg-4">
                                                                                    <div class="form-group mb-3">
                                                                                        시험회차
                                                                                        <input id="lawyer_exam_num" name="lawyer_exam_num" type="text" class="form-control" required="">
                                                                                    </div>
                                                                                </div>

                                                                                <div class="col-lg-4">
                                                                                    <div class="form-group mb-3">
                                                                                        자격취득일
                                                                                        <input id="lawyer_acq_year" name="lawyer_acq_year" type="date" class="form-control" required="">
                                                                                    </div>
                                                                                </div>
                                        
                                                                                <div class="col-lg-6">
                                                                                    <div class="form-group mb-3">
                                                                                        변호사 증명서류 첨부
                                                                                        <input type="file" name="myfile" id="file-uploader" accept=".pdf" >
                                                                                    </div>
                                                                                </div>
                                        
                                                                                <div class="col-lg-12">
                                                                                    <div class="form-group mb-3">
                                                                                        <div class=" form-check">
                                                                                            <input type="checkbox" class="form-check-input" id="agree1">
                                                                                            <label class="form-check-label" for="agree1"><a href="javascript:;" data-bs-toggle="modal" data-bs-target="#user_agreement" data-bs-dismiss="modal" style="font-weight: bolder;">이용약관</a>에 모두 동의합니다.</label>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="text-center">
                                                                                    <button type="submit" id="lawyerSuccessBtn" class="site-button">가입완료</button>
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
                                </div>
                            </div>
                    </div>

                </div>
            </div>
            <!-- EXPLORE NEW LIFE END -->
 <!-- 유효성 검사 -->
 <script>
    $(document).ready(function () {
        // 폼 유효성 검사 초기화
        $("#lawyer").validate({
            rules: {
                lawyer_name: {
                    required: true,
                    rangelength: [2, 15]
                },
                lawyer_id: {
                    required: true,
                    email: true
                },
                lawyer_pass: {
                    required: true,
                    rangelength: [4, 15]
                },
                lawyer_birth: {
                    required: true
                },
                lawyer_tel: {
                    required: true,
                    phoneKR: true
                },
                lawyer_exam: {
                    required: true
                },
                lawyer_exam_num: {
                    required: true
                },
                agree1: {
                    required: true
                }
            },
            messages: {
                lawyer_name: {
                    required: "이름은 필수 입력입니다.",
                    rangelength: "이름은 {0}자에서 {1}자까지 사용 가능합니다."
                },
                lawyer_id: {
                    required: "아이디는 필수 입력입니다.",
                    email: "이메일 형식을 확인하세요."
                },
                lawyer_pass: {
                    required: "비밀번호는 필수 입력입니다.",
                    rangelength: "비밀번호는 {0}자에서 {1}자까지 사용 가능합니다."
                },
                lawyer_birth: {
                    required: "생년월일은 필수 입력입니다."
                },
                lawyer_tel: {
                    required: "전화번호는 필수 입력입니다.",
                    phoneKR: "올바른 전화번호 형식이 아닙니다. (예: 02-1234-5678)"
                },
                lawyer_exam: {
                    required: "출신 시험을 선택해주세요."
                },
                lawyer_exam_num: {
                    required: "시험 회차를 입력해주세요."
                },
                agree1: {
                    required: "약관 동의를 해야 가입이 완료됩니다."
                }
            },
            errorPlacement: function (error, element) {
                error.insertAfter(element); // 오류 메시지를 입력 요소 다음에 삽입
            }
        });
    
        // 사용자 정의 규칙을 추가
        $.validator.addMethod("phoneKR", function (value, element) {
            // 대한민국 전화번호 정규 표현식
            var phonePattern = /^(\d{2,3})-(\d{3,4})-(\d{4})$/;
            return this.optional(element) || phonePattern.test(value);
        }, "올바른 전화번호 형식이 아닙니다. (예: 010-1234-5678)");
    
     // '가입완료' 버튼 클릭 시 이벤트 처리
    $('#lawyerSuccessBtn').submit(function (event) {
            // 폼이 유효한지 검사
            if ($("#lawyer").valid()) {
                // 유효한 경우 여기에 추가로 수행할 작업을 작성
                // 예: AJAX 호출 등
            } else {
                // 폼이 유효하지 않은 경우 메시지 표시
                alert('폼이 유효하지 않습니다.');
            }
        });
    
        // // '아이디 중복 확인' 버튼 클릭 시 이벤트 처리
        // $('#idCheckButton').click(function (event) {
        //     event.preventDefault();
        //     // 여기에 아이디 중복 확인에 대한 로직을 추가
        //     // 예: AJAX 호출 등
        //     // AJAX를 통해 아이디 중복 확인 요청
        //     $.ajax({
        //         url: '/member/insertMember', // 실제 서버 API 경로로 수정
        //         method: 'post',
        //         data: { user_id: $('#user_id').val() }, // user_id 값을 가져와서 전송
        //         success: function (response) {
        //             if (response.duplicate) {
        //                 alert('이미 사용 중인 아이디입니다.');
        //             } else {
        //                 alert('사용 가능한 아이디입니다.');
        //                 // 아이디 중복 확인이 성공했을 때 추가적인 로직을 수행할 수 있음
        //                 // 예: 회원가입 버튼 활성화, 다음 단계로 진행 등
        //             }
        //         },
        //         error: function () {
        //             alert('오류가 발생했습니다.');
        //         }
        //     });
        // });
    });
</script>

        
<!--CONTENT END-->
        
        
    <!--Footer, 로그인 회원가입 팝업-->
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
<script  src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script  src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script  src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>





</body>

</html>
