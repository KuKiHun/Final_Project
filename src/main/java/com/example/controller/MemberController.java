package com.example.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.API.KakaoAPI;
import com.example.domain.MemberVO;
import com.example.service.MemberService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller 
@RequestMapping("/member") // 해당 어노테이션은 이 컨트롤러의 모든 메서드에 대한 기본 URL 경로를 /board로 지정
// @SessionAttributes("member") 
public class MemberController {
	
	@Autowired // 해당 어노테이션을 사용하여 BoardService 타입의 빈을 주입받습니다.
	private MemberService memberService; //게시판과 관련된 비즈니스 로직을 처리하는 서비스
	
	KakaoAPI kakaoApi = new KakaoAPI();

	//[요청] http://127.0.0.1:8080/board/xxxxxxxxxxx
	@RequestMapping("/{step}")
	public String viewPage(@PathVariable String step) {
		return "follaw/" + step;
		// /WEB-INF/views/ + board + xxxxxxxx + .jsp
	}
	//로그인
	@RequestMapping("/login")
	public String login(MemberVO vo, Model m, HttpSession session){
		//System.out.println("[[[ MemberController login()]]] :" + vo);

		MemberVO result = memberService.login(vo);

		System.out.println("[result] :" + result);
	
		if (result !=null) {
			session.setAttribute("user_name", result.getUser_name());
			//m.addAttribute("member", result);
			//return "loginSuccess"; // 뷰페이지 지정 (모델값 넘어감)
			return "/follaw/index"; // 리다이렉트 (모델값 안넘어감)
		}else {
			// 여기서는 뷰페이지 지정이 가능하지만
			// 일부러 리다이렉트 상황을 만듬
			return "redirect:/follaw/index" ; // 로그인 실패 시 폼 페이지로 리다이렉트
			
		}
	
	}
	//카카오 로그인
	@RequestMapping("/kakaoLogin")
	public String kakaoLogin(@RequestParam("code") String code, HttpSession session, HttpServletRequest request) {
		String accessToken = kakaoApi.getAccessToken("http://kauth.kakao.com/oauth/token?client_id=b03159e7697941a938317bd0edb04c62&redirect_uri=http://localhost:8080/member/kakaoLogin&code=" + code);
		HashMap<String, Object> userInfo = kakaoApi.getUserInfo(accessToken);
		
		System.out.println("login info: " + userInfo.toString());
		
		if (userInfo.get("email") != null) {
			session.setAttribute("user_id", userInfo.get("email"));
			session.setAttribute("accessToken", accessToken);
		}
		
		return "redirect:/follaw/index";
	}
	//sns 로그인
	@GetMapping("/sns-login")
    public ModelAndView snsLogin(@RequestParam("sns_login_site") String snsLoginSite,
                                 @RequestParam("user_id") String userId) {
        // SNS 로그인 시 users 테이블 정보를 불러오는 메소드 호출
        MemberVO member = memberService.getUserInfoBySnsLogin(snsLoginSite, userId);

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
	//로그아웃
	/*
	 * @RequestMapping("/logout") public String logout(HttpSession session) {
	 * System.out.println("성공적으로 로그아웃 되었습니다.");
	 * session.removeAttribute("user_name");
	 * 
	 * return "redirect:/follaw/index"; // 로그아웃 시 메인 페이지로 이동 }
	 */
	//마이페이지
	/*
	 * @RequestMapping("/mypage") public String myPage(Model m, HttpSession session)
	 * { // 세션에서 사용자 정보 가져오기 String user_id = (String)
	 * session.getAttribute("user_id");
	 * 
	 * if (user_id != null) { // 필요한 사용자 정보 조회 및 모델에 추가 MemberVO vo =
	 * memberService.getMemberById(user_id); m.addAttribute("member", vo); return
	 * "mypage"; } else { return "redirect:/follaw/index"; // 로그인이 되어있지 않다면 로그인 페이지로
	 * 리다이렉트 } }
	 */

	
	//로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		System.out.println(session.getAttribute("user_name")+" 님 로그아웃되었습니다. ");
    	session.removeAttribute("user_name");
    	return "redirect:/follaw/index";
	}
	//카카오 로그아웃
	@RequestMapping("/kakaoLogout")
	public String kakaoLogout(HttpSession session) {
		kakaoApi.kakaoLogout((String)session.getAttribute("accessToken"));
		session.removeAttribute("accessToken");
		session.removeAttribute("user_id");
		return "redirect:/follaw/index";
	}

	// 회원가입
	@RequestMapping("/insertMember")
	public String insertMember(MemberVO vo) {
		System.out.println("/member/insertMember 요청:" + vo);
		memberService.insertMember(vo);
		return "redirect:/follaw/index";
	}
	
    // 회원 탈퇴
    @RequestMapping("/deleteMember")
    public String deleteMember(@RequestParam("id") String id, Model model) {
        memberService.deleteMember(id);
        return "redirect:/member/deleteMember";
    }
    //삭제
//    @RequestMapping("/deleteMember")
//    public void deleteMember(@RequestBody MemberVO vo) {
//        memberService.deleteMember(vo);
//    }
//    @RequestMapping("/deleteMember")
//    public ModelAndView deleteMember(HttpServletRequest request, @RequestBody MemberVO vo) {
//    	System.out.println(vo);
//    	// 회원 삭제 수행
//        memberService.deleteMember(vo);
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
	public void updateMember(MemberVO vo) {
		System.out.println("/member/updateMember 요청" + vo);
		memberService.updateMember(vo);
	}
	

	
}