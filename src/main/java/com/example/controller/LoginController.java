// package com.example.controller;

// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.stereotype.Controller;
// import org.springframework.web.bind.annotation.GetMapping;
// import org.springframework.web.bind.annotation.RequestMapping;
// import org.springframework.web.bind.annotation.RequestParam;

// import com.example.service.NaverLoginService;

// import jakarta.servlet.http.HttpSession;
// import oracle.jdbc.AccessToken;

// @Controller
// @RequestMapping("/login")
// public class LoginController {
    
//     @Autowired
//     private NaverLoginService naverLoginService;

//     @RequestMapping("/naverLogin")
//     public String naverLogin(){
//         return "redirect:" + naverLoginService.getAuthorizationUrl();
//     }
//     @GetMapping("/naverLogin/callback")
//     public String naverCallback(@RequestParam("code") String code,
//                                 @RequestParam("state") String state,
//                                 HttpSession session) {
//         AccessToken accessToken = naverLoginService.getAccessToken(code, state);
//         if (accessToken != null) {
//             NaverProfile naverProfile = naverLoginService.getNaverProfile(accessToken);
//             // 네이버 프로필 정보를 기반으로 회원 가입 또는 로그인 처리
//             // ...
//             return "redirect:/follaw/index";
//         } else {
//             // 액세스 토큰을 가져오지 못한 경우 처리
//             // ...
//             return "redirect:/follaw/index";
//         }
//     }
// }
