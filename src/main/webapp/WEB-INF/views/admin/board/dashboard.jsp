<%--
  Created by IntelliJ IDEA.
  User: ICT03-16
  Date: 2024-01-14
  Time: PM 6:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시물 대시보드</title>
</head>
<body>
게시물 대시보드
<br/>
<a href="${pageContext.request.contextPath}/admin/board/notice"><span class="admin-nav-text">공지사항 관리</span></a>
<a href="${pageContext.request.contextPath}/admin/board/news"><span class="admin-nav-text">뉴스 관리</span></a>
<a href="${pageContext.request.contextPath}/admin/board/qna"><span class="admin-nav-text">지식인 관리</span></a>
</body>
</html>
