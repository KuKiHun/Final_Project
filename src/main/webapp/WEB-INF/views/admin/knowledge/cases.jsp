<%--
  Created by IntelliJ IDEA.
  User: ICT03-16
  Date: 2024-01-14
  Time: PM 5:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test="${cases != null}">
    <table>
        <thead></thead>
        <tbody>
        <c:forEach items="${cases}" var="case">
            <tr>
                <td></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>
</body>
</html>
