<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>네이버로그인</title>
  </head>
  <body>
  <%
    String clientId = "bBV_Um5Yz2EDCd7w6sW0";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://118.217.203.46:8080/naver_callback.html", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=token&client_id=bBV_Um5Yz2EDCd7w6sW0&redirect_uri=http%3A%2F%2F118.217.203.46%3A8080%2Fnaver_callback.html&state=4d41c5b8-3294-455b-b21c-8e400f3f7179"
         + "&client_id=" + clientId
         + "&redirect_uri=" + redirectURI
         + "&state=" + state;
    session.setAttribute("state", state);
 %>
  <a href="<%=apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
  </body>
</html>