<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
   <!--  b03159e7697941a938317bd0edb04c62 -->
   <!-- cdb167e549c841a2a26e863885445582 -->
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
        window.Kakao.init('cdb167e549c841a2a26e863885445582');
        function kakaoLogin() {
            window.Kakao.Auth.login({
                scope:'account_email',
                success: function(response){
                    console.log(response);
                    window.Kakao.API.request({
                        url:'/v2/user/me',
                        success: function(res) {
                            const kakao_account = res.kakao_account;
                            console.log(kakao_account);
                        }
                    });
                }
            });
        }
        
    </script>
      <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
      <script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
      <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>

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

    <!-- HEADER START -->
    <header  class="site-header header-style-3 mobile-sider-drawer-menu">

        <div class="sticky-header main-bar-wraper  navbar-expand-lg">
            <div class="main-bar">

                <div class="container-fluid clearfix">

                    <div class="logo-header">
                        <div class="logo-header-inner logo-header-one">
                            <a href="${pageContext.request.contextPath}/follaw/index">
                                <img src="${pageContext.request.contextPath}/images/logo-dark.png" alt="">
                            </a>
                        </div>
                    </div>

                    <!-- NAV Toggle Button -->
                    <button id="mobile-side-drawer" data-target=".header-nav" data-toggle="collapse" type="button" class="navbar-toggler collapsed">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar icon-bar-first"></span>
                        <span class="icon-bar icon-bar-two"></span>
                        <span class="icon-bar icon-bar-three"></span>
                    </button>

                        <!-- MAIN Vav -->
                        <div class="nav-animation header-nav navbar-collapse collapse d-flex justify-content-center">

                        <ul class=" nav navbar-nav">
                            <li class="has-child"><a href="${pageContext.request.contextPath}/follaw/lawyer">검색</a>
                                <ul class="sub-menu">
                                    <li><a href="${pageContext.request.contextPath}/follaw/lawyer">변호사</a></li>
                                    <li><a href="${pageContext.request.contextPath}/follaw/court">법원</a></li>
                                    <li><a href="${pageContext.request.contextPath}/follaw/lawoffice">법률사무소</a></li>
                                </ul>
                            </li>
                            <li class="has-child"><a href="javascript:;">법률상담</a>
                                <ul class="sub-menu">
                                    <li><a href="">화상상담</a></li>
                                    <li><a href="/follaw/candidate_chat">채팅상담</a></li>
                                    <li><a href="/follaw/counsel">지식인상담</a></li>
                                </ul>
                            </li>
                            <li class="has-child"><a href="${pageContext.request.contextPath}/follaw/news">법률뉴스</a>
                            </li>
                            <li class="has-child"><a href="${pageContext.request.contextPath}/follaw/knowledge/law">법률지식</a>
                                <ul class="sub-menu">
                                    <li><a href="${pageContext.request.contextPath}/follaw/knowledge/law">주요5법</a></li>
                                    <li><a href="${pageContext.request.contextPath}/follaw/knowledge/cases">판례</a></li>
                                </ul>
                            </li>
                            <li class="has-child"><a href="${pageContext.request.contextPath}/follaw/board/notice">커뮤니티</a>
                                <ul class="sub-menu">
                                    <li><a href="${pageContext.request.contextPath}/follaw/board/notice">공지사항</a></li>
                                    <li><a href="">회원게시판</a></li>
                                </ul>
                            </li>
                            <li class="has-child"><a href="${pageContext.request.contextPath}/follaw/about">회사소개</a>
                            </li>
                        </ul>

                    </div>

                    <!-- Header Right 로그인 Section-->
                    <div class="extra-nav header-2-nav">
                        <div class="extra-cell">
                            <div class="header-nav-btn-section">
                                <!-- 일반 사용자 -->

                                <div class="twm-nav-btn-left">
                                    <!-- 세션에 유저 로그인 정보가 있는 경우 -->
                                   
                                    <c:if test="${not empty sessionScope.user_name}">
                                        <a href="${pageContext.request.contextPath}/member/logout" class="twm-nav-sign-up">
                                            <i class="feather-log-out"></i> 로그아웃
                                        </a>
                                    </c:if>


                                    <!-- 세션에 유저 로그인 정보가 없는 경우 -->
                                    <c:if test="${empty sessionScope.user_name}">
                                        <c:if test="${empty sessionScope.lawyer_name}">

                                                <a class="twm-nav-sign-up" data-bs-toggle="modal" href="#sign_up_popup2" role="button">
                                                    <i class="feather-log-in"></i> 로그인
                                                </a>
                                        </c:if>
                                    </c:if>
                                </div>

                                <div class="twm-nav-btn-right">
                                    <!-- 세션에 유저 로그인 정보가 있는 경우에만 마이페이지를 표시 -->
                                    <c:if test="${not empty sessionScope.user_name}">
                                        <a href="mypage" class="twm-nav-post-a-job">
                                            <i class="feather-briefcase"></i> 마이페이지
                                        </a>
                                    </c:if>
                                </div>
                                <!-- 세션에 유저 로그인 정보가 있는 경우에만 유저이름을 표시 -->
                                <c:if test="${not empty sessionScope.user_name}">
                                    <p> 환영합니다. ${sessionScope.user_name} 님</p>
                                </c:if>
                                <!-- -------------------------------------------------------------------------- -->
                                <!--변호사 -->

                                <div class="twm-nav-btn-left">
                                    <!-- 세션에 변호사 로그인 정보가 있는 경우 -->
                                    <c:if test="${not empty sessionScope.lawyer_name}">
                                        <a href="${pageContext.request.contextPath}/lawyer/logoutLawyer" class="twm-nav-sign-up">
                                            <i class="feather-log-out"></i> 로그아웃
                                        </a>
                                    </c:if>

                                </div>
                                <div class="twm-nav-btn-right">
                                    <!-- 세션에 변호사 로그인 정보가 있는 경우에만 마이페이지를 표시 -->
                                    <c:if test="${not empty sessionScope.lawyer_name}">
                                        <a href="mypage" class="twm-nav-post-a-job">
                                            <i class="feather-briefcase"></i> 마이페이지
                                        </a>
                                    </c:if>
                                </div>
                                <!-- 세션에 로그인 정보가 있는 경우에만 변호사이름을 표시 -->
                                <c:if test="${not empty sessionScope.lawyer_name}">
                                    <p> 환영합니다. ${sessionScope.lawyer_name} 변호사님</p>
                                </c:if>
                                <!-- ----------------------------------------------------- -->
                                
                            </div>
                        </div>
                    </div>



                </div>


            </div>

        </div>

    </header>
    <!-- HEADER END -->
    <!-- BUTTON TOP START -->
    <button class="scroltop"><span class="fa fa-angle-up  relative" id="btn-vibrate"></span></button>

    <!--Model Popup Section Start-->
  

    
    <!--로그인팝업 -->
    <div class="modal fade twm-sign-up" id="sign_up_popup2" aria-hidden="true" aria-labelledby="sign_up_popupLabel2" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <div class="modal-header">
                    <h2 class="modal-title" id="sign_up_popupLabel2">로그인</h2>
                    <p>FolLaw에 오신 것을 환영합니다.</p>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="twm-tabs-style-2">
                        <ul class="nav nav-tabs" id="myTab2" role="tablist">

                            <!--일반회원-->
                            <li class="nav-item">
                                <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#login-candidate" type="button"><i class="fas fa-user-tie"></i>일반회원</button>
                            </li>
                            <!--변호사회원-->
                            <li class="nav-item">
                                <button class="nav-link" data-bs-toggle="tab" data-bs-target="#login-Employer" type="button"><i class="fas fa-building"></i>변호사회원</button>
                            </li>

                        </ul>

                        <div class="tab-content" id="myTab2Content">
                            <!--일반회원 로그인-->
                            <div class="tab-pane fade show active" id="login-candidate">
                                <div class="row">
                                    <form action="/member/login" method="post">
                                        <div class="col-lg-12">
                                            <div class="form-group mb-3">
                                                <input name="user_id" type="email" required="" class="form-control" placeholder="아이디" >
                                            </div>
                                        </div>

                                        <div class="col-lg-12">
                                            <div class="form-group mb-3">
                                                <input name="user_pw" type="password" class="form-control" required="" placeholder="비밀번호">
                                            </div>
                                        </div>

                                        <div class="col-lg-12">
                                            <div class="form-group mb-3">
                                                <div class=" form-check">
                                                    <input type="checkbox" class="form-check-input" id="Password3">
                                                    <label class="form-check-label rem-forgot" for="Password3">아이디 저장<a href="javascript:;" data-bs-toggle="modal" data-bs-target="#find-pass" data-bs-dismiss="modal">비밀번호 찾기</a></label>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <button type="submit" class="site-button">로그인</button>
                                            <div class="mt-3 mb-3">아직 회원이 아니신가요?
                                                <button class="twm-backto-login" onclick="window.location.href='/follaw/sign-up'">회원가입</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>

                            <!--변호사회원 로그인-->
                            <div class="tab-pane fade" id="login-Employer">
                                <div class="row">
                                    <form action="/lawyer/loginLawyer" method="post">
                                        <div class="col-lg-12">
                                            <div class="form-group mb-3">
                                                <input name="lawyer_id" type="email" required="" class="form-control" placeholder="아이디" pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$" title="유효한 이메일 주소를 입력해주세요.">
                                            </div>
                                        </div>

                                        <div class="col-lg-12">
                                            <div class="form-group mb-3">
                                                <input name="lawyer_pass" type="text" class="form-control" required="" placeholder="비밀번호">
                                            </div>
                                        </div>


                                        <div class="col-lg-12">
                                            <div class="form-group mb-3">
                                                <div class=" form-check">
                                                    <input type="checkbox" class="form-check-input" id="Password4">
                                                    <label class="form-check-label rem-forgot" for="Password4">아이디 저장<a href="javascript:;" data-bs-toggle="modal" data-bs-target="#find-pass" data-bs-dismiss="modal">비밀번호 찾기</a></label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <button type="submit" class="site-button">로그인</button>
                                            <div class="mt-3 mb-3">아직 회원이 아니신가요?
                                                <button class="twm-backto-login" onclick="window.location.href='/follaw/sign-up-lawyer'">회원가입</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <span class="modal-f-title">SNS연동 로그인</span>
                    <ul class="twm-modal-social">
                        <a id="kakao-login-btn" href="javascript:kakaoLogin();"><img src="/images/kakao/kakao_login_large_wide.png" data-bs-dismiss="modal" aria-label="Close" /></a>
                      <li><a href="javascript:kakaoLogin();" class="google-clr"><i class="fab fa-google"></i></a></li>
                    </ul>
                </div>
                </form>
            </div>
        </div>
    </div>	

        </script>
    <!--비밀번호 찾기 -->
    <div class="modal fade twm-sign-up" id="find-pass" aria-hidden="true" aria-labelledby="sign_up_popupLabel" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <form>

                    <div class="modal-header">
                        <h2 class="modal-title" id="sign_up_popupLabel">비밀번호 찾기</h2>
                        <p>비밀번호를 잊으셨나요?</p>
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
                                                아이디
                                                <input name="user_id" type="text" required="" class="form-control">
                                            </div>
                                        </div>

                                        <div class="col-lg-12">
                                            <div class="form-group mb-3">
                                                전화번호
                                                <input name="user_tel" type="text" class="form-control" required="">
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <button type="submit" class="site-button" data-bs-target="#change-pass" data-bs-toggle="modal" data-bs-dismiss="modal">입력완료</button>
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
    <!--비밀번호 변경 -->
    <div class="modal fade twm-sign-up" id="change-pass" aria-hidden="true" aria-labelledby="sign_up_popupLabel" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <form>

                    <div class="modal-header">
                        <h2 class="modal-title" id="sign_up_popupLabel">새 비밀번호 설정</h2>
                        <p>새로 설정하실 비밀번호를 입력하세요.</p>
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
                                                새 비밀번호
                                                <input name="name" type="password" required="" class="form-control">
                                            </div>
                                        </div>

                                        <div class="col-lg-12">
                                            <div class="form-group mb-3">
                                                비밀번호 확인
                                                <input name="name" type="password" required="" class="form-control">
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <button type="submit" class="site-button" data-bs-target="#sign_up_popup2" data-bs-toggle="modal" data-bs-dismiss="modal">변경완료</button>
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
    <!--Model Popup Section End-->

</body>
</html>