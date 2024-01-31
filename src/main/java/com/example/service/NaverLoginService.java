// package com.example.service;

// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.beans.factory.annotation.Value;
// import org.springframework.stereotype.Service;

// import oracle.jdbc.AccessToken;

// @Service
// public class NaverLoginService {

//     @Value("${naver.clientId}")
//     private String clientId;

//     @Value("${naver.clientSecret}")
//     private String clientSecret;

//     @Value("${naver.redirectUri}")
//     private String redirectUri;

//     @Autowired
//     private UsersService memberService;

//     public String getAuthorizationUrl() {
//         String state = UUID.randomUUID().toString();
//         String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code"
//                 + "&client_id=" + clientId
//                 + "&redirect_uri=" + redirectUri
//                 + "&state=" + state;
//         return apiURL;
//     }

//     public AccessToken getAccessToken(String code, String state) {
//         // 액세스 토큰 요청 및 처리
//         // ...
//         return accessToken;
//     }

//     public NaverProfile getNaverProfile(AccessToken accessToken) {
//         // 네이버 API를 사용하여 프로필 정보 요청 및 처리
//         // ...
//         return naverProfile;
//     }
// }
