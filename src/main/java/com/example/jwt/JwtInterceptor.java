package com.example.jwt;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import java.io.OutputStream;
import java.net.HttpURLConnection;

import java.net.URL;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class JwtInterceptor implements HandlerInterceptor {
    private static final Logger logger = LoggerFactory.getLogger(JwtInterceptor.class);

    private final JwtUtil jwtUtil;
    private final JwtChatTitleInclude jwtChatTitleInclude;
    private final JwtLogin jwtLogin;

    public JwtInterceptor(JwtUtil jwtUtil, JwtChatTitleInclude jwtChatTitleInclude, JwtLogin jwtLogin) {
        this.jwtUtil = jwtUtil;
        this.jwtChatTitleInclude = jwtChatTitleInclude;
        this.jwtLogin = jwtLogin;
    }

    //JWT를 생성하고 노드 서버로 전송
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //accessToken에서 유저 아이디, 이름 얻어오기

        //헤더에서 토큰 정보 가져오기
        String token = request.getHeader("Authorization");
        
        // 토큰 유효성 검사
        if (token == null || !jwtUtil.validateToken(token)) {
            // 유효하지 않은 토큰이거나 토큰이 없는 경우 에러 처리
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            return false;
        }

        //현재 요청 URI : 요청이 발생한 자원의 경로
        //localhost:8080/login 페이지에서 request.getRequestURI()를 호출하면 /login을 반환합니다. 즉, 값을 받을 URL을 나타내는 것입니다.
        String uri = request.getRequestURI();
        logger.info("URI: {}", uri);

        // 로그인한 유저의 아이디와 이름
        String user_id = jwtUtil.getId(token);
        String user_name = jwtUtil.getName(token);
        int auth_idx = jwtUtil.getAuthIdx(token);

        // 방 이름
        String chat_title = jwtUtil.getChatTitle(token);

        //추출한 사용자 정보를 요청에 저장 > 프론트에서 ${user_id}로 호출
        request.setAttribute("user_name", user_name);
        request.setAttribute("user_id", user_id);
        request.setAttribute("chat_title", chat_title);
        request.setAttribute("auth_idx", auth_idx);

        // 토큰 생성
        String accessToken = jwtLogin.createAccessToken(user_id, user_name, auth_idx);
        logger.info("Generated Access Token: {}", accessToken);

        // 토큰에 방 이름 추가한 토큰 생성
        String tokenWithRoomName = jwtChatTitleInclude.createTokenWithRoomName(user_id, user_name, chat_title, auth_idx);
        logger.info("Generated Token with Room Name: {}", tokenWithRoomName);

        // 노드 서버로 토큰 전송
        sendTokenToNodeServer(tokenWithRoomName);

        return true;
    }

    // 토큰을 노드 서버로 전송하는 함수
    private void sendTokenToNodeServer(String token) {

        try {
            URL url = new URL("http://localhost:3000/token-endpoint");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setDoOutput(true);
            
            // 토큰을 JSON 형식으로 포장하여 요청 본문에 전송
            JSONObject jsonRequest = new JSONObject();
            jsonRequest.put("token", token);
            String requestBody = jsonRequest.toString();

            OutputStream outputStream = connection.getOutputStream();
            outputStream.write(requestBody.getBytes("UTF-8"));
            outputStream.flush();
            outputStream.close();
        
            // 응답 처리
            int responseCode = connection.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) {
                // 성공적으로 토큰을 전송한 경우의 처리
                logger.info("Token sent to Node server successfully.");
            } else {
                // 토큰 전송에 실패한 경우의 처리
                logger.error("Failed to send token to Node server. Response code: {}", responseCode);
            }
            
        } catch (Exception e) {
            logger.error("Exception occurred while sending token to Node server: {}", e.getMessage());
        }

    }
}

