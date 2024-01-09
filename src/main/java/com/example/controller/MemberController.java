package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.domain.MemberVO;
import com.example.service.MemberService;

import jakarta.servlet.http.HttpSession;

@Controller 
@RequestMapping("/member") // 해당 어노테이션은 이 컨트롤러의 모든 메서드에 대한 기본 URL 경로를 /board로 지정
// @SessionAttributes("member") 
public class MemberController {
	
	@Autowired // 해당 어노테이션을 사용하여 BoardService 타입의 빈을 주입받습니다.
	private MemberService memberService; //게시판과 관련된 비즈니스 로직을 처리하는 서비스
	
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
		//로그인
	// @RequestMapping("/login")
	// @ResponseBody
	// public String login(MemberVO vo) {
	// 	System.out.println("UserController >> userIdCheck vo / "+vo.getUser_id());
	// 	MemberVO result = memberService.login(vo);
	// 	if(result == null) {
	// 		System.out.println("MemberController >> login result / null");
	// 		return "Available";
	// 	} else {
	// 		System.out.println("MemberController >> login result / "+result.getUser_id());
	// 		return "Not_Available";
	// 	}
	// }
	//로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
    	session.removeAttribute("user_name");
    	return "redirect:/follaw/index";
	}
	// 회원가입
	@RequestMapping("/insertMember")
	public String insertMember(MemberVO vo) {
		System.out.println("/member/insertMember 요청:" + vo);
		memberService.insertMember(vo);
		return "redirect:/follaw/lawyer";
	}
	
    // 회원가입 페이지로 이동
    @RequestMapping("/insertMemberForm")
    public String insertMemberForm() {
        return "/member/insertMemberForm";
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