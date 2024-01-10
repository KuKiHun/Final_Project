package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.domain.LawyerVO;
import com.example.jwt.JwtLawyerLogin;
import com.example.service.LawyerService;

@RestController
@RequestMapping("/lawyer") 
public class LawyerController {
    
    @Autowired
    private final LawyerService lawyerService;
	private final JwtLawyerLogin jwtLawyerLogin;


	//[요청] http://127.0.0.1:8080/board/xxxxxxxxxxx
	@RequestMapping("/{step}")
	public String viewPage(@PathVariable String step) {
		return "lawyer/" + step;
		// /WEB-INF/views/ + board + xxxxxxxx + .jsp
	}
	//변호사 로그인
@PostMapping("/loginLawyer")
    public ResponseEntity<?> login(@RequestBody LoginRequest loginRequest) {
        // 로그인 처리 로직
        // ...

        // 로그인 성공 시 액세스 토큰 생성
        String accessToken = jwtLawyerLogin.createAccessToken(lawyer.getUser_id(), lawyer.getUser_name(), lawyer.getAuth_idx());

        // 응답에 액세스 토큰을 담아 반환
        return ResponseEntity.ok(new LoginResponse(accessToken));
    }

    @GetMapping("/protected")
    public ResponseEntity<?> protectedEndpoint(HttpServletRequest request) {
        // 액세스 토큰 검증
        String accessToken = jwtLawyerLogin.getAccessToken(request);
        if (!jwtLawyerLogin.validateToken(accessToken)) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        }

        // 액세스 토큰에서 필요한 정보 추출
        String user_id = jwtLawyerLogin.getUser_id(accessToken);
        String user_name = jwtLawyerLogin.getUser_name(accessToken);
        int auth_idx = jwtLawyerLogin.getAuth_idx(accessToken);

        // 보호된 엔드포인트 접근 로직
        // ...

        // 응답 처리
        return ResponseEntity.ok("Protected Endpoint Accessed");
    }

    @GetMapping("/redirect")
    public ResponseEntity<?> redirectEndpoint(HttpServletRequest request) {
        // 액세스 토큰 검증
        String accessToken = jwtLawyerLogin.getAccessToken(request);
        if (!jwtLawyerLogin.validateToken(accessToken)) {
            // 액세스 토큰이 없을 경우 nonMemberURI로 리다이렉트
            return ResponseEntity.status(HttpStatus.FOUND).header("Location", jwtLawyerLogin.nonMemberURI).build();
        }

        // 액세스 토큰이 있을 경우 memberURI로 리다이렉트
        return ResponseEntity.status(HttpStatus.FOUND).header("Location", jwtLawyerLogin.memberURI).build();
    }
    //변호사 로그아웃
    // @RequestMapping("/logoutLawyer")
    // public String logoutLawyer(HttpSession session) {
    //     System.out.println(session.getAttribute("lawyer_name")+" 변호사님 로그아웃되었습니다. ");
    //     session.removeAttribute("lawyer_name");
    //     return "redirect:/follaw/index";
    // }
    // 변호사 회원가입
    @RequestMapping("/insertLawyer")
    public String insertLawyer(LawyerVO vo) {
        System.out.println("/lawyer/insertLawyer 요청:" + vo);
        lawyerService.insertLawyer(vo);
        return "redirect:/follaw/index";
    }

}
