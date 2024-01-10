package com.example.jwt;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;


@Component
public class JwtChatTitleInclude {
    private static final Logger logger = LoggerFactory.getLogger(JwtChatTitleInclude.class);

    private JwtUserUtil jwtUserUtil;

    public JwtChatTitleInclude(JwtUserUtil jwtUserUtil) {
        this.jwtUserUtil = jwtUserUtil;
    }
    //멤버 아이디, 이름, 방 이름을 기반으로 토큰을 생성
    public String createTokenWithRoomName(String user_id, String user_name, String chat_title, int auth_idx) {
        logger.info("createTokenWithRoomName");
        System.out.println("chat_title : " + chat_title);
        System.out.println("user_id : " + user_id);
        System.out.println("user_name : " + user_name);
        System.out.println("auth_idx : " + auth_idx);

        return jwtUserUtil.createToken(user_id, user_name, chat_title, auth_idx);
    }

    public boolean validateToken(String token) {
        return jwtUserUtil.validateToken(token);
    }

    public String getUser_id(String token) {
        return jwtUserUtil.getUser_id(token);
    }

    public String getUser_name(String token) {
        return jwtUserUtil.getUser_name(token);
    }

    public String getChat_title(String token) {
        return jwtUserUtil.getChat_title(token);
    }

    public int getAuth_idx(String token) {
        return jwtUserUtil.getAuth_idx(token);
    }

    public String getTokenWithRoomName(HttpServletRequest httpServletRequest) {
        return jwtUserUtil.getTokenWithRoomName(httpServletRequest);
    }

    //HTTP 요청에 따라 리다이렉트 URI를 결정
    //액세스 토큰이 없을 경우 nonMemberURI를, 액세스 토큰이 있을 경우 memberURI를 반환
    public String determineRedirectURI(HttpServletRequest httpServletRequest, String memberURI, String nonMemberURI) {
        String token = getTokenWithRoomName(httpServletRequest);
        if (token == null) {
            return nonMemberURI;
        } else {
            return memberURI;
        }
    }

}
