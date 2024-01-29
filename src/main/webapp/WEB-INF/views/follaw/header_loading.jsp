<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
   <!--  b03159e7697941a938317bd0edb04c62 -->
   <!-- cdb167e549c841a2a26e863885445582 -->
<!--    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
 -->   
 <script>
/* window.Kakao.init('cdb167e549c841a2a26e863885445582'); */

/* function kakaoLogin() {
    window.Kakao.Auth.login({
    scope: 'account_email,talk_message',
    success: function(response) {
        console.log("kakaopopup :", response);

        // 'response' 객체에서 'code' 가져오기
        const code = response.code;
        console.log("Received code:", code);  // 코드가 올바르게 받아졌는지 콘솔에 출력

        // 'code'를 서버에 보내기 위한 AJAX 요청
        $.ajax({
            type: 'POST',
            url: `/member/login/oauth2/code/kakao?code=${code}`,
            success: function(data) {
                console.log("서버 응답:", data);
                // 성공적으로 처리된 경우의 로직 추가
            },
            error: function(error) {
                console.log("에러 발생:", error);
                // 오류 처리 로직 추가
            }
        });
    },
    fail: function(error) {
        console.log(error);
        // 사용자가 취소한 경우 등 예외처리
    }
});
} */
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
                            <li class="has-child"><a href="javascript:;">검색</a>
                                <ul class="sub-menu">
                                    <li><a href="${pageContext.request.contextPath}/follaw/search/court">법원</a></li>
                                    <li><a href="${pageContext.request.contextPath}/follaw/search/lawoffice">법률사무소</a></li>
                                    <li class="has-child"><a href="javascript:;">변호사</a>
                                        <ul class="sub-menu">
                                            <li><a href="${pageContext.request.contextPath}/follaw/search/partner-lawyer">파트너변호사</a>
                                            <li><a href="${pageContext.request.contextPath}/follaw/search/lawyer">일반변호사</a>
                                        </ul> 
                                    </li>
                                </ul>
                            </li>
                            <li class="has-child"><a href="javascript:;">법률상담</a>
                                <ul class="sub-menu">
                                    <li><a href="${pageContext.request.contextPath}/follaw/counsel/videoCounsel">화상상담</a></li>
                                    <li><a href="${pageContext.request.contextPath}/follaw/counsel/chatting">채팅상담</a></li>
                                    <li><a href="${pageContext.request.contextPath}/follaw/counsel/counsel">지식인상담</a></li>
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
                                        <a href="${pageContext.request.contextPath}/member/mypage" class="twm-nav-post-a-job">
                                            <i class="feather-briefcase"></i> 마이페이지
                                        </a>
                                    </c:if>
                                </div>
                                <!-- 세션에 유저 로그인 정보가 있는 경우에만 유저이름을 표시 --> 
                                <c:if test="${not empty sessionScope.user_name}">
                                    <p>일반회원 ${sessionScope.user_name}님</p>
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
                                        <a href="${pageContext.request.contextPath}/lawyer/mypage-lawyer" class="twm-nav-post-a-job">
                                            <i class="feather-briefcase"></i> 마이페이지
                                        </a>
                                    </c:if>
                                </div>
                                <!-- 세션에 로그인 정보가 있는 경우에만 변호사이름을 표시 -->
                                <c:if test="${not empty sessionScope.lawyer_name}">
                                    <p>변호사 ${sessionScope.lawyer_name}님</p>
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
                                                    <label class="form-check-label rem-forgot" for="Password3">아이디 저장<a href="find-pass">비밀번호 찾기</a></label>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <button type="submit" class="site-button">로그인</button>
                                            <div class="mt-3 mb-3">아직 회원이 아니신가요?
                                                <button class="twm-backto-login" onclick="window.location.href='/follaw/sign-up-landing'">회원가입</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>

                                    <ul class="twm-modal-social">
                                        <a id="kakao-login-btn" href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=b03159e7697941a938317bd0edb04c62&redirect_uri=http://localhost:8080/member/kakaoCallback"><img src="/images/kakao/kakao_login_large_wide.png" data-bs-dismiss="modal" aria-label="Close" /></a>
                                    </ul>
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
                                                <input name="lawyer_pass" type="password" class="form-control" required="" placeholder="비밀번호">
                                            </div>
                                        </div>


                                        <div class="col-lg-12">
                                            <div class="form-group mb-3">
                                                <div class=" form-check">
                                                    <input type="checkbox" class="form-check-input" id="Password4">
                                                    <label class="form-check-label rem-forgot" for="Password4">아이디 저장<a href="find-pass">비밀번호 찾기</a></label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <button type="submit" class="site-button">로그인</button>
                                            <div class="mt-3 mb-3">아직 회원이 아니신가요?
                                                <button class="twm-backto-login" onclick="window.location.href='/follaw/sign-up-landing'">회원가입</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>

                                    <ul class="twm-modal-social">
                                        <a id="kakao-login-btn" href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=b03159e7697941a938317bd0edb04c62&redirect_uri=http://localhost:8080/lawyer/LawyerkakaoCallback"><img src="/images/kakao/kakao_login_large_wide.png" data-bs-dismiss="modal" aria-label="Close" /></a>
                                    </ul>

                            </div>

                        </div>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
        <!--이용약관-->
        <div class="modal fade twm-sign-up" id="user_agreement" aria-hidden="true" aria-labelledby="sign_up_popupLabel" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
    
                    <div class="modal-header">
                        <h2 class="modal-title" id="sign_up_popupLabel">이용약관</h2>
                        <p>서비스 이용약관 및 개인정보 동의 약관</p>
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
                                                서비스 및 개인정보 이용약관
                                                <textarea name="useragreement" class="form-control" style="overflow-y: auto; height: 490px; "readonly>
    ㈜FolLaw은 개인정보보호법 등을 준수하여 회원들의 개인정보 취급방침을 공개합니다.
    
    1. 수집하는 개인정보의 정의
       - 개인정보의 정의: 실명, 주민번호 등으로 식별 가능한 정보 포함
    
    2. 개인정보수집 및 이용목적
       - 서비스 제공, 회원 관리, 자료분석, 마케팅 등 활용 목적
    
    3. 개인정보의 파기 절차 및 방법
       - 보유기간 경과 시 일정 절차에 따라 파기됨
    
    4. 개인정보의 제공
       - 제휴사 및 회원들에게 서비스 제공, 통계 작성 등 제공
    
    5. 개인정보 수집방법
       - 회원가입, 상담요청글 게시, 채팅상담 등을 통한 수집, 쿠키 사용
    
    ㈜FolLaw의 서비스 이용약관을 공개합니다.                                                        
    
    1. 서비스 개요
       - ㈜FolLaw(이하 "회사"라 함)은 법률정보 제공 및 변호사와의 화상, 텍스트 채팅 서비스를 제공합니다.
       - 본 서비스는 회사의 웹사이트 또는 모바일 애플리케이션을 통해 이용할 수 있습니다.
                                                            
    2. 서비스 이용자의 권리와 의무
       - 회원은 회사의 서비스를 이용함에 있어서 관련 법령과 이용약관에 따라야 합니다.
       - 회원은 타인의 정보를 도용하거나 부정한 목적으로 서비스를 이용해서는 안 됩니다.
       - 회원은 회사의 서비스를 이용하여 얻은 법률정보를 상업적으로 이용하거나 제3자에게 제공하는 행위를 금지합니다.
       - 회원은 회사의 서비스를 이용하여 법률적인 조언을 받을 경우, 변호사의 의견을 잘 듣고 필요한 조치를 취해야 합니다.
                                                            
    3. 서비스 이용료와 결제
       - 회사의 서비스 이용은 일부 유료로 제공될 수 있습니다.
       - 이용자는 회사가 제공하는 결제 방법을 통해 서비스 이용료를 납부해야 합니다.
       - 결제와 관련된 세부 사항은 회사의 결제 정책에 따릅니다.
                                                            
    4. 개인정보 보호
       - 회사는 이용자의 개인정보를 적절히 보호하기 위해 노력합니다.
       - 회사는 개인정보 처리에 대한 자세한 내용을 개인정보 처리방침에서 안내합니다.
                                                            
    5. 서비스 제공 중지 및 해지
       - 회사는 서비스의 제공을 중지하거나 이용자의 회원 자격을 해지할 수 있습니다.
       - 이용자는 언제든지 회원 자격 해지를 요청할 수 있습니다.
                                                            
    6. 책임의 한계
       - 회사는 법률정보의 정확성, 완전성, 신뢰성 등에 대한 어떠한 보증도 하지 않습니다.
       - 회사는 이용자가 서비스를 이용함으로써 입게 되는 어떠한 손해에 대해서도 책임을 지지 않습니다.
                                                            
    7. 그 외
       - 본 약관은 한국법에 따라 해석되고 적용됩니다.
       - 본 약관에 명시되지 않은 사항은 관련 법령 및 회사의 개인정보 처리방침에 따릅니다.
                                                        </textarea>
                                                <br/>
                                            </div>
                                        </div>
    
                                        <div class="col-md-12">
                                            <button class="site-button" data-bs-target="#sign_up_popup" data-bs-toggle="modal" data-bs-dismiss="modal">확인</button>
                                        </div>
    
                                    </div>
                                </div>
    
                            </div>
                        </div>
                    </div>
    
                </div>
            </div>
    
        </div>

    <!--Model Popup Section End-->

</body>
</html>