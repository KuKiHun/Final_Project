<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>회원가입페이지</title>
</head>
<body>
<h1>회원가입</h1>
<form action="saveMember" method="post">
	<table border="1" cellpadding="0" cellspacing="0">
		<tr>
			<td bgcolor="orange" width="70">아이디</td>
			<td align="left"><input type="text" name="user_id"/></td>
		</tr>
		<tr>
			<td bgcolor="orange">패스워드</td>
			<td align="left"><input type="password" name="user_pass" size="10"/></td>
		</tr>
		<tr>
			<td bgcolor="orange">이름</td>
			
			<td align="left"><input type="text" name="user_name" size="10"/></td>
		</tr>
		<tr>
			<td bgcolor="orange">전화번호</td>
			
			<td align="left"><input type="text" name="user_tel" size="10"/></td>
		</tr>
		<tr>
			<td bgcolor="orange">생년월일</td>
			
			<td align="left"><input type="text" name="user_birth" size="10"/></td>
		</tr>
		<tr>
			<td bgcolor="orange">주소</td>
			
			<td align="left"><input type="text" name="user_addr" size="10"/></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit"	 value=" 회원가입 "/></td>
		</tr>
	</table>
</form>
</body>
</html>