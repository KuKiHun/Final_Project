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
<title>비밀번호 찾기 : 인증번호 입력</title>
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
	  	<!--================ 인증번호 Area =================-->
    	
		  <main>
			<div class="find_info">
				
				<div class="find">
					<div id="find_by_email">
						<input type="radio" id="email" value="email" name="find">
						<label for="email">가입한 이메일로 찾기</label>
						
						<div class="auth">
							<input type="email" class="email" placeholder="이메일을 입력해주세요" maxlength="50">
							<button type="button" class="auth_num_send_eemail">인증번호받기</button>
							<input type="text" class="auth_num" name="authNum" readonly maxlength="6"  placeholder="인증번호6자리입력">
							<span class="timer"></span>
						</div>
					</div>
					
					
					<div id="find_by_phone">
						<input type="radio" id="phone" value="phone" name="find">
						<label for="phone">전화번호로 찾기</label>
						<div class="auth">
							<input type="text" class="phone" maxlength="11" placeholder="전화번호를 입력해주세요">
							<button type="button" class="auth_num_send_phone" >인증번호받기</button>
							<input type="text" class="auth_num" name="authNum" readonly maxlength="6"  placeholder="인증번호6자리입력">
							<span class="timer"></span>
						</div>
					</div>
					
				</div>
					
				<button class="move_modify">다음</button>
			</div>
		</main>
	
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

=======


</body>
</html>