<%--
  Created by IntelliJ IDEA.
  User: ICT03-16
  Date: 2024-01-14
  Time: PM 6:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>뉴스 관리자</title>
</head>
<body>
<c:if test="${newsList == null}">
    뉴스 목록이 비어 있습니다.
</c:if>
<c:if test="${newsList != null}">
    <table>
        <thead>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>URL</th>
            <th>Img URL</th>
            <th>날자</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${newsList}" var="news">
            <tr>
                <td>${news.news_idx}</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</c:if>

</body>
</html>
