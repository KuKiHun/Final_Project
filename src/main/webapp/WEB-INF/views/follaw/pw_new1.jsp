<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html lang="en">
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>비밀번호 찾기 : 비밀번호 변경</title>
	<link rel="icon" href="img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="../resources/join_login/vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="../resources/join_login/vendors/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="../resources/join_login/vendors/themify-icons/themify-icons.css">
	<link rel="stylesheet" href="../resources/join_login/vendors/linericon/style.css">
  <link rel="stylesheet" href="../resources/join_login/vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="../resources/join_login/vendors/owl-carousel/owl.carousel.min.css">
  <link rel="stylesheet" href="../resources/join_login/vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="../resources/join_login/vendors/nouislider/nouislider.min.css">

  <link rel="stylesheet" href="../resources/join_login/css/style.css">

</head>
<body>
 


  	<!--================Login Box Area =================-->
    	
		<section class="login_box_area section-margin">
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<div class="login_box_img" id="login_box">
							<div class="hover">
								<h4>새롭게 변경할 비밀번호를 입력해주세요</h4>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="newpass_form_inner">
							<h3>새 비밀번호 설정</h3>
							<form class="row login_form login" action="pw_new" id="contactForm" method="POST">
								<div class="col-md-12 form-group" id="col-md-12">
									<input type="password" class="form-control" id="user_pw" name="user_pw" placeholder="새 비밀번호">
								</div>
								<div class="col-md-12 form-group">
									<span id=same></span>
									<button type="submit" id="check" value="비밀번호변경" class="button button-login w-100">비밀번호 변경</button>
									<input type="hidden" name="m_email" value="${m_email }">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
	
	<!--================End Login Box Area =================-->
	
	
  <script src="../resources/join_login/vendors/jquery/jquery-3.2.1.min.js"></script>
  <script src="../resources/join_login/vendors/bootstrap/bootstrap.bundle.min.js"></script>
  <script src="../resources/join_login/vendors/skrollr.min.js"></script>
  <script src="../resources/join_login/vendors/owl-carousel/owl.carousel.min.js"></script>
  <script src="../resources/join_login/vendors/nice-select/jquery.nice-select.min.js"></script>
  <script src="../resources/join_login/vendors/jquery.ajaxchimp.min.js"></script>
  <script src="../resources/join_login/vendors/mail-script.js"></script>
  <script src="../resources/join_login/js/main.js"></script>	
  <script  src="${pageContext.request.contextPath}/js/mail.js"></script>
	</form>

</body>
</html>