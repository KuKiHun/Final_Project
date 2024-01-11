package com.example.jwt;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;


@Component
public class JwtLogin {
    private static final Logger logger = LoggerFactory.getLogger(JwtLogin.class);

    private JwtUtil jwtUtil;

    public JwtLogin(JwtUtil jwtUtil) {
        this.jwtUtil = jwtUtil;
    }

    public String createAccessToken(String user_id, String user_name, int auth_idx) {
        logger.info("createAccessToken");

        return jwtUtil.createToken(user_id, user_name, null, auth_idx);
    }

    public boolean validateToken(String token) {
        return jwtUtil.validateToken(token);
    }

    public String getId(String token) {
        return jwtUtil.getId(token);
    }

    public String getName(String token) {
        return jwtUtil.getName(token);
    }

    public int getAuthIdx(String token) {
        return jwtUtil.getAuthIdx(token);
    }
    

    public String getAccessToken(HttpServletRequest httpServletRequest) {
        return jwtUtil.getAccessToken(httpServletRequest);
    }

    //URL 하드코딩
    String nonMemberURI = "/member/login";
    String memberURI = "/follaw/index";

    //HTTP 요청에 따라 리다이렉트 URI를 결정
    //액세스 토큰이 없을 경우 nonMemberURI를, 액세스 토큰이 있을 경우 memberURI를 반환
    public String determineRedirectURI(HttpServletRequest httpServletRequest) {
        return "/follaw/index";
    }
}