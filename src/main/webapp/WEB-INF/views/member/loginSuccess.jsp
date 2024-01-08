<%@page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 성공 페이지</title>
</head>
<body>
	<h1>로그인 성공</h1>
	<p>Welcome, ${member.user_name}</p>
	<hr/>
	<a href="/logout">로그아웃</a>
</body>
</html>