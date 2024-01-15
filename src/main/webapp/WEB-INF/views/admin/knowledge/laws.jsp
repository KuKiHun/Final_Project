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
<%--법이 없을때--%>
<c:if test="${sorts == null}">
    <p>법률 정보가 존재하지 않습니다.</p>
</c:if>
<%--법이 있을때--%>
<c:if test="${sorts != null}">
    <c:forEach items="${sorts}" var="sort">
        <a href="${pageContext.request.contextPath}/admin/knowledge/laws/${sort}">${sort}</a>
    </c:forEach>
    <hr/>
    <%--  법을 선택하지 않은 경우  --%>
    <c:if test="${act == null}">
        법 종류를 선택해 주십시오.
    </c:if>
    <%--  법을 선택 한 경우 / js 에서 처리  --%>
    <c:if test="${act != null}">
        <p>${act}</p>
        <br/>
        <table id="law_table">
            <thead>
            <tr>
                <th>편</th>
                <th>장</th>
                <th>절</th>
                <th>조</th>
                <th>항</th>
                <th>호</th>
                <th>내용</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${laws}" var="law">
                <tr>
                    <td class="laws_part">${law.laws_part}</td>
                    <td class="laws_chapter">${law.laws_chapter}</td>
                    <td class="laws_section">${law.laws_section}</td>
                    <td class="laws_article">${law.laws_article}</td>
                    <td class="laws_paragraph">${law.laws_paragraph}</td>
                    <td class="laws_subparagraph">${law.laws_subparagraph}</td>
                    <td class="laws_content">${law.laws_content}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
</c:if>
</body>
</html>

