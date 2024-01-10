package com.example.jwt;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;


@Component
public class JwtLawyerLogin {
    private static final Logger logger = LoggerFactory.getLogger(JwtLawyerLogin.class);

    private JwtLawyerUtil jwtLawyerUtil;

    public JwtLawyerLogin(JwtLawyerUtil jwtLawyerUtil) {
        this.jwtLawyerUtil = jwtLawyerUtil;
    }

    public String createAccessToken(String user_id, String user_name, int auth_idx) {
        logger.info("createAccessToken");

        return jwtLawyerUtil.createToken(user_id, user_name, null, auth_idx);
    }

    public boolean validateToken(String token) {
        return jwtLawyerUtil.validateToken(token);
    }

    public String getUser_id(String token) {
        return jwtLawyerUtil.getLawyer_id(token);
    }

    public String getUser_name(String token) {
        return jwtLawyerUtil.getLawyer_name(token);
    }

    public int getAuth_idx(String token) {
        return jwtLawyerUtil.getAuth_idx(token);
    }
    

    public String getAccessToken(HttpServletRequest httpServletRequest) {
        return jwtLawyerUtil.getAccessToken(httpServletRequest);
    }

    //URL 하드코딩
    String nonMemberURI = "/member/login";
    String memberURI = "/follaw/index";

    //HTTP 요청에 따라 리다이렉트 URI를 결정
    //액세스 토큰이 없을 경우 nonMemberURI를, 액세스 토큰이 있을 경우 memberURI를 반환
    public String determineRedirectURI(HttpServletRequest httpServletRequest, String memberURI, String nonMemberURI) {
        String token = getAccessToken(httpServletRequest);
        if (token == null) {
            return nonMemberURI;
        } else {
            return memberURI;
        }
    }
}