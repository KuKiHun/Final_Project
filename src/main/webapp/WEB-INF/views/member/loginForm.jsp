<%@page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인페이지</title>
</head>
<body>

<h3>로그인</h3>
<hr>
<!-- 폼을 제출할떄 데이터를 insertBoard 라는 URL 로 전송 -->
<!-- 이경우, insertBoard.jsp 페이지나 해당 URL을 처리할 서버 측 코드가 있어야 함 -->
<!-- 폼을 제출하면 서버에서 데이터를 처리하고 그에 따른 응답을 사용자에게 보여줌 -->
<!-- 즉, insertBoard.jsp 파일이 있어야함 -->
<form action="loginSuccess" method="post">
<table border="1">
		<tr>
			<td bgcolor="orange" width="70">아이디</td>
			<td align="left"><input type="text" name="user_id"/></td>
		</tr>
		<tr>
			<td bgcolor="orange">패스워드</td>
			<td align="left"><input type="password" name="user_pass" size="10"/></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit"	value=" 로그인 "/></td>
		</tr>
</table>
</form>
<hr>

</body>
</html>
