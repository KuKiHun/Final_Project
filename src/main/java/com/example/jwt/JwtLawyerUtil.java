package com.example.jwt;

import java.security.Key;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import com.example.domain.MemberVO;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.MalformedJwtException;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;
import io.jsonwebtoken.security.SignatureException;

@Component
public class JwtLawyerUtil {
    private static final Logger logger = LoggerFactory.getLogger(JwtLawyerUtil.class);

    private static final Key secretKey = Keys.secretKeyFor(SignatureAlgorithm.HS256);

    public final static long ACCESS_TOKEN_VALIDATION_SECOND = 1000L * 60 * 60 * 12; // 12시간
    public static final String AUTHORIZATION_HEADER = "Authorization";

    //공통적인 부분(클레임의 경우 원하는 인자만 넣으면 된다)
    public String createToken(String lawyer_id, String lawyer_name, String chat_title, int auth_idx) {
        logger.info("createToken");
        System.out.println("createToken >> " + lawyer_id + lawyer_name + chat_title + auth_idx);

        Date now = new Date();
        Date expiration = new Date(now.getTime() + ACCESS_TOKEN_VALIDATION_SECOND);

        return Jwts.builder()
                .setSubject(lawyer_id)
                .claim("lawyer_name", lawyer_name)
                .claim("chat_title", chat_title)
                .claim("auth_idx", auth_idx)
                .setIssuedAt(now)
                .setExpiration(expiration)
                .signWith(secretKey)
                .compact();
    }

    public boolean validateToken(String token) {
        try {
            parseToken(token);
            return true;
        } catch (SignatureException e) {
            logger.error("Invalid token signature.");
        } catch (ExpiredJwtException e) {
            logger.error("Expired token.");
        } catch (MalformedJwtException | IllegalArgumentException e) {
            logger.error("Invalid token.");
        }
        return false;
    }

    private Jws<Claims> parseToken(String token) {
        return Jwts.parserBuilder().setSigningKey(secretKey).build().parseClaimsJws(token);
    }

    public String getLawyer_id(String token) {
        return parseToken(token).getBody().getSubject();
    }

    public String getLawyer_name(String token) {
        return parseToken(token).getBody().get("lawyer_name", String.class);
    }

    public String getChat_title(String token) {
        return parseToken(token).getBody().get("chat_title", String.class);
    }

    public int getAuth_idx(String token) {
        return parseToken(token).getBody().get("auth_idx", int.class);
    }

    //HttpServletRequest에서 헤더를 확인하여 액세스 토큰을 추출하는 역할
    public String getAccessToken(HttpServletRequest httpServletRequest) {
        String bearerToken = httpServletRequest.getHeader(AUTHORIZATION_HEADER);
        if (StringUtils.hasText(bearerToken) && bearerToken.startsWith("Bearer ")) {
            return bearerToken.substring(7);
        }
        return null;
    }

    //HttpServletRequest에서 헤더를 확인하여 액세스 토큰을 추출하는 역할
    public String getTokenWithRoomName(HttpServletRequest httpServletRequest) {
        String bearerToken = httpServletRequest.getHeader(AUTHORIZATION_HEADER);
        if (StringUtils.hasText(bearerToken) && bearerToken.startsWith("Bearer ")) {
            return bearerToken.substring(7);
        }
        return null;
    }

    public String generateToken(MemberVO result) {
        return null;
    }
}

