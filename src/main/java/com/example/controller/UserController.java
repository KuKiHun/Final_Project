package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.domain.MemberVO;
import com.example.jwt.JwtUserLogin;
import com.example.service.MemberService;

import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private final MemberService memberService;
    private final JwtUserLogin jwtUserLogin;

    public UserController(JwtUserLogin jwtUserLogin) {
        this.jwtUserLogin = jwtUserLogin;
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginRequest loginRequest) {
        // 로그인 처리 로직
        // ...

        // 로그인 성공 시 액세스 토큰 생성
        String accessToken = jwtUserLogin.createAccessToken(user.getUser_id(), user.getUser_name(), user.getAuth_idx());

        // 응답에 액세스 토큰을 담아 반환
        return ResponseEntity.ok(new LoginResponse(accessToken));
    }

    @GetMapping("/protected")
    public ResponseEntity<?> protectedEndpoint(HttpServletRequest request) {
        // 액세스 토큰 검증
        String accessToken = jwtUserLogin.getAccessToken(request);
        if (!jwtUserLogin.validateToken(accessToken)) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        }

        // 액세스 토큰에서 필요한 정보 추출
        String user_id = jwtUserLogin.getUser_id(accessToken);
        String user_name = jwtUserLogin.getUser_name(accessToken);
        int auth_idx = jwtUserLogin.getAuth_idx(accessToken);

        // 보호된 엔드포인트 접근 로직
        // ...

        // 응답 처리
        return ResponseEntity.ok("Protected Endpoint Accessed");
    }

    @GetMapping("/redirect")
    public ResponseEntity<?> redirectEndpoint(HttpServletRequest request) {
        // 액세스 토큰 검증
        String accessToken = jwtUserLogin.getAccessToken(request);
        if (!jwtUserLogin.validateToken(accessToken)) {
            // 액세스 토큰이 없을 경우 nonMemberURI로 리다이렉트
            return ResponseEntity.status(HttpStatus.FOUND).header("Location", jwtUserLogin.nonMemberURI).build();
        }

        // 액세스 토큰이 있을 경우 memberURI로 리다이렉트
        return ResponseEntity.status(HttpStatus.FOUND).header("Location", jwtUserLogin.memberURI).build();
    }



	// 회원가입
	@RequestMapping("/insertMember")
	public String insertMember(MemberVO vo) {
		System.out.println("/user/insertUser 요청:" + vo);
		userService.insertMember(vo);
		return "redirect:/follaw/lawyer";
	}

}