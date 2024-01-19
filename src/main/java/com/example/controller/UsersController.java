package com.example.controller;

import java.util.HashMap;
import java.util.Map;

import com.example.domain.UsersVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.API.KakaoAPI;
import com.example.domain.UsersVO;
import com.example.service.UsersService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/member") // 해당 어노테이션은 이 컨트롤러의 모든 메서드에 대한 기본 URL 경로를 /member 로 지정
public class UsersController { //UsersController 클래스 정의
	
	@Autowired // 해당 어노테이션을 사용하여 UsersService 타입의 빈을 주입받음
	private UsersService usersService; //멤버변수 usersService 선언
	
	@Autowired
    private KakaoAPI kakaoApi;
	//KakaoAPI kakaoApi = new KakaoAPI(); // KakaoAPI 클래스의 인스턴스인 kakaoApi 생성

	//[요청] http://127.0.0.1:8080/member/임의의 변수 경로
	@RequestMapping("/{step}")
	public String viewPage(@PathVariable String step) { //경로변수 인 step을 메서드의 파라미터로 받아옴
		return "follaw/" + step; // /WEB-INF/views/ + follaw + xxxxxxxx + .jsp 페이지로 이동
	}

	//로그인
	@RequestMapping("/login")
	public String login(UsersVO vo, Model m, HttpSession session){ // UsersVO, Model, HttpSession 타입의 파라미터를 받아옴

		// usersService 의 login 메서드를 호출하여 로그인 처리
		// 파리미터로는 vo 를전달
		// 그 결과로 로그인 결과를 담고있는 UsersVO 객체를 반환받아 result 변수에 저장
		UsersVO result = usersService.login(vo);

		System.out.println("[result] :" + result);
	
		//result 가 null 이 아닌경우 즉, 로그인 성공한경우 세션에 사용자 이름 저장하고 "/follaw/index" 로 리다이렉트
		//result 가 null 인 경우 즉, 로그인 실패한경우 "/follaw/index" 로 리다이렉트
		if (result !=null) {
			session.setAttribute("user_name", result.getUser_name());
			session.setAttribute("user_id", result.getUser_id());
			session.setAttribute("auth_idx", result.getAuth_idx());

			return "/follaw/index";
		}else {
			return "redirect:/follaw/index" ;
			
		}
	
	}
	//카카오 로그인 (인증코드를 이용하여 엑세스 토큰을 받고 토큰을 사용하여 사용자정보 가져온 후 로그인 처리)
	//getAccessToken : 카카오 서버에 엑세스 토큰을 요청하는 역할
	@RequestMapping("/kakaoLogin/{code}")
	public String kakaoLogin(@PathVariable("code") String code, HttpSession session) {
		String accessToken = kakaoApi.getAccessToken("http://kauth.kakao.com/oauth/token?client_id=b03159e7697941a938317bd0edb04c62&redirect_uri=http://localhost:8080/follaw/index&code=" + code);
		System.out.println("http://localhost:8080/follaw/index&code=" + code);
		HashMap<String, Object> userInfo = kakaoApi.getUserInfo(accessToken); //엑세스토큰을 사용하여 사용자 정보를 HashMap 형태로 반환
		
		System.out.println("login info: " + userInfo.toString()); //사용자 정보를 콘솔에 출력 (디버깅 목적)
		
		//사용자정보중에 email 이 존재하는 경우에만 로그인 처리함
		// 이메일이 존재하는 경우 , 세션에 사용자 이메일과 엑세스 토큰을 저장함

		String email = (String) userInfo.get("account_email");
		if (email != null) {
//			UsersVO vo

			session.setAttribute("user_id", email);
			session.setAttribute("accessToken", accessToken);
		}
		
		UsersVO result = usersService.kakaoLogin(email);
		System.out.println("[kakaoLogin result] :" + result);
	
		//result 가 null 이 아닌경우 즉, 로그인 성공한경우 세션에 사용자 이름 저장하고 "/follaw/index" 로 리다이렉트
		//result 가 null 인 경우 즉, 로그인 실패한경우 "/follaw/index" 로 리다이렉트
		if (result !=null) {
			session.setAttribute("user_name", result.getUser_name());
			session.setAttribute("user_id", result.getUser_id());
			session.setAttribute("auth_idx", result.getAuth_idx());

			return "/follaw/index";
		}else {
			return "redirect:/follaw/index" ;
			
		}
        
    }
	//sns 로그인
	@GetMapping("/sns-login")
    public ModelAndView snsLogin(@RequestParam("sns_login_site") String snsLoginSite,
                                 @RequestParam("user_id") String userId) {
        // SNS 로그인 시 users 테이블 정보를 불러오는 메소드 호출
        UsersVO member = usersService.getUserInfoBySnsLogin(snsLoginSite, userId);

        ModelAndView modelAndView = new ModelAndView();
        if (member != null) {
            // 로그인 성공 시 처리
            modelAndView.addObject("member", member);
            modelAndView.setViewName("success-page"); // 로그인 성공 후 이동할 페이지
        } else {
            // 로그인 실패 시 처리
            modelAndView.setViewName("error-page"); // 로그인 실패 시 이동할 페이지
        }

        return modelAndView;
    }

	// }

	//마이페이지
	/*
	 * @RequestMapping("/mypage") public String myPage(Model m, HttpSession session)
	 * { // 세션에서 사용자 정보 가져오기 String user_id = (String)
	 * session.getAttribute("user_id");
	 * 
	 * if (user_id != null) { // 필요한 사용자 정보 조회 및 모델에 추가 UsersVO vo =
	 * usersService.getMemberById(user_id); m.addAttribute("member", vo); return
	 * "mypage"; } else { return "redirect:/follaw/index"; // 로그인이 되어있지 않다면 로그인 페이지로
	 * 리다이렉트 } }
	 */

	
	//로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) { //HttpSession 타입의 파라미터인 session을 받아옴
		System.out.println(session.getAttribute("user_name")+" 님 로그아웃되었습니다. ");
    	session.removeAttribute("user_name");
		session.removeAttribute("user_id");
		session.removeAttribute("auth_idx");
    	return "redirect:/follaw/index";
	}
	//카카오 로그아웃
	@RequestMapping("/kakaoLogout")
	public String kakaoLogout(HttpSession session) { //HttpSession 타입의 파라미터인 session 을 받아옴
		kakaoApi.kakaoLogout((String)session.getAttribute("accessToken")); //카카오 로그아웃 수행 (파리미터로는 세션에 저장된 accessToken 값을 전달)
		session.removeAttribute("accessToken"); //세션에서 "accessToken" 속성을 제거 > 사용자 카카오 엑세스 토큰 정보 삭제
		session.removeAttribute("user_id"); // 세션에서 "user_id" 속성을 제거 > 사용자 카카오 로그인 정보 삭제
		return "redirect:/follaw/index";
	}

	// 회원가입 > 일반유저
	@RequestMapping("/insertMember")
	public String insertMember(UsersVO vo) {
		System.out.println("/member/insertMember 요청:" + vo); //파리미터로 전달받은 vo 객체 출력
		usersService.insertMember(vo); //insertMember를 호출하여 회원가입 수행 (vo 파리미터 전달)
		return "/follaw/index";
	}

    // 회원 탈퇴
    @RequestMapping("/deleteMember")
    public String deleteMember(@RequestParam("id") String id, Model model) {
        usersService.deleteMember(id);
        return "redirect:/member/deleteMember";
    }
    //삭제
//    @RequestMapping("/deleteMember")
//    public void deleteMember(@RequestBody UsersVO vo) {
//        usersService.deleteMember(vo);
//    }
//    @RequestMapping("/deleteMember")
//    public ModelAndView deleteMember(HttpServletRequest request, @RequestBody UsersVO vo) {
//    	System.out.println(vo);
//    	// 회원 삭제 수행
//        usersService.deleteMember(vo);
//        
//        // 세션에서 로그인 정보 삭제
//        HttpSession session = request.getSession();
//        session.removeAttribute("member");
//        
//        // 로그인 성공 페이지로 이동 (이 부분은 필요에 따라 수정하세요)
//        ModelAndView modelAndView = new ModelAndView("loginSuccessPage");
//        modelAndView.addObject("message", vo.getName() + "님 회원탈퇴가 완료되었습니다.");
//
//        return modelAndView;
//    }
	//수정
	@RequestMapping("/updateMember")
	public void updateMember(UsersVO vo) {
		System.out.println("/member/updateMember 요청" + vo);
		usersService.updateMember(vo);
	}
	

	
}