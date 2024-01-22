package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.domain.LawyerVO;
import com.example.domain.UsersVO;
import com.example.service.LawyerService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/lawyer") 
public class LawyerController {
    
    @Autowired
	private LawyerService lawyerService;


	//[요청] http://127.0.0.1:8080/lawyer/xxxxxxxxxxx
	@RequestMapping("/{step}")
	public String viewPage(@PathVariable String step) {
		return "lawyer/" + step; // /WEB-INF/views/ + lawyer + xxxxxxxx + .jsp
		
	}
	//변호사 로그인
    @RequestMapping("/loginLawyer")
    public String loginLawyer(LawyerVO vo, Model m, HttpSession session) {
        LawyerVO result = lawyerService.loginLawyer(vo);
        System.out.println("[result] :" + result);
    
        if (result != null) {
            session.setAttribute("lawyer_name", result.getLawyer_name());
            session.setAttribute("lawyer_id", result.getLawyer_id());
			session.setAttribute("auth_idx", result.getAuth_idx());
            return "redirect:/follaw/index"; // 리다이렉트 (모델값 안넘어감)
        } else {
            return "redirect:/follaw/index"; // 로그인 실패 시 폼 페이지로 리다이렉트
        }
    }
    //변호사 로그아웃
    @RequestMapping("/logoutLawyer")
    public String logoutLawyer(HttpSession session) {
        System.out.println(session.getAttribute("lawyer_name")+" 변호사님 로그아웃되었습니다. ");
        session.removeAttribute("lawyer_name");
        session.removeAttribute("lawyer_id");
        session.removeAttribute("auth_idx");
        return "redirect:/follaw/index";
    }
    // 변호사 회원가입
    @RequestMapping("/insertLawyer")
    public String insertLawyer(LawyerVO vo) {
        System.out.println("/lawyer/insertLawyer 요청:" + vo);
        lawyerService.insertLawyer(vo);
        return "redirect:/follaw/index";
    }

    //변호사 마이페이지
    @RequestMapping("/mypage-lawyer")
    public String getLawyer(Model model, String lawyer_id) {
        UsersVO lawyerInfo = lawyerService.getLawyer(lawyer_id);
        model.addAttribute("lawyerInfo", lawyerInfo);
        return "follaw/mypage/mypage-lawyer"; //"mypage"는 mypage.jsp 가리킴
    }

}