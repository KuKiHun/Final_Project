package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.API.KakaoAPILawyer;
import com.example.domain.LawfirmsVO;
import com.example.domain.LawyerVO;
import com.example.domain.PaymentVO;
import com.example.domain.ReportVO;
import com.example.domain.SnsLawyerVO;
import com.example.service.LawfirmsService;
import com.example.service.LawyerService;
import com.example.service.ReportService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/lawyer") 
public class LawyerController {
    
    @Autowired
	private LawyerService lawyerService;

    @Autowired
    private LawfirmsService lawfirmsService;

    @Autowired
    private ReportService reportService;

    @Autowired
    private KakaoAPILawyer kakaoApiLawyer;
	//KakaoAPI kakaoApi = new KakaoAPI(); // KakaoAPI 클래스의 인스턴스인 kakaoApi 생성

	//[요청] http://127.0.0.1:8080/lawyer/xxxxxxxxxxx
	@RequestMapping("/{step}")
	public String viewPage(@PathVariable String step) {
		return "lawyer/" + step; // /WEB-INF/views/ + lawyer + xxxxxxxx + .jsp
		
	}
    //아이디 중복확인
	@RequestMapping("/lawyerIdCheck")
	@ResponseBody
	public String lawyerIdCheck(LawyerVO vo) {
		System.out.println("LawyerController >> lawyerIdCheck vo / "+vo.getLawyer_id());
		LawyerVO result = lawyerService.getIdLawyer(vo);
		if(result == null) {
			System.out.println("LawyerController >> lawyerIdCheck result / null (id사용가능)");
			return "Available";
		} else {
			System.out.println("LawyerController >> lawyerIdCheck result / (id중복) " + result.getLawyer_id());
			return "Unavailable";
		}
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
    //카카오 로그인 (인증코드를 이용하여 엑세스 토큰을 받고 토큰을 사용하여 사용자정보 가져온 후 로그인 처리)
	@RequestMapping("/LawyerkakaoCallback")
		//1. 인가코드 받기 (@RequestParam String code)
		public String kakaoLawyerLogin(@RequestParam("code") String code,HttpSession session){
		//2. 토큰 받기
		String accessToken = kakaoApiLawyer.getAccessToken(code);
		System.out.println("kakaoCode(lawyerController):" + code);
		String userInfo  = kakaoApiLawyer.getUserInfo(accessToken); //엑세스토큰을 사용하여 사용자 정보를 HashMap 형태로 반환
		System.out.println("accessToken(lawyerController): " + accessToken);
		 //사용자 정보를 콘솔에 출력 (디버깅 목적)
		System.out.println("login info(lawyerController): " + userInfo );
		//사용자정보중에 email 이 존재하는 경우에만 로그인 처리함
		// 이메일이 존재하는 경우 , 세션에 사용자 이메일과 엑세스 토큰을 저장함
		//UsersVO result = usersService.login(vo);
        
            LawyerVO result = lawyerService.kakaoLawyerLogin(userInfo);
            System.out.println("[kakaoLawyerLogin result] :" + result);
            session.setAttribute("lawyer_id", result.getLawyer_id());
            session.setAttribute("lawyer_name", result.getLawyer_name());
            session.setAttribute("lawyer_tel", result.getLawyer_tel());
            session.setAttribute("lawyer_birth", result.getLawyer_birth());
            session.setAttribute("lawyer_area", result.getLawyer_area());
            //session.setAttribute("lawfirm_name", result.getLawfirm_name());
            session.setAttribute("lawyer_field", result.getLawyer_field());
            
            return "follaw/index";
        
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
    // 변호사 회원가입 (변호사 + 카카오)
    @RequestMapping("/insertLawyer")
    public String insertLawyer(LawyerVO vo, SnsLawyerVO slvo) {
        System.out.println("/lawyer/insertLawyer 요청:" + vo);
        System.out.println("/lawyer/insertLawyer 요청:" + slvo);
        lawyerService.insertLawyer(vo);
        lawyerService.insertSnsLawyer(slvo);
        return "/follaw/index";
    }

    //변호사 마이페이지 소속선택 및 정보 불러오기 01.22 김모세
    @RequestMapping("/mypage-lawyer")
    public String lawyerInfo(LawfirmsVO vo, Model model, HttpSession session) {
        List<LawfirmsVO> mypageLawfirm = lawfirmsService.signupLawfirm();
        String lawyer_id = (String) session.getAttribute("lawyer_id");

        LawyerVO lvo = new LawyerVO();
        lvo.setLawyer_id(lawyer_id);
        LawyerVO result = lawyerService.getLawyer(lvo);

        model.addAttribute("lawyerInfo", result);
        model.addAttribute("mypageLawfirm",mypageLawfirm);

        return "follaw/mypage/mypage-lawyer"; //"mypage"는 mypage.jsp 가리킴
    }

    //변호사 마이페이지 개인정보수정 불러오기 및 연결 01.22 김모세
    @RequestMapping("/mypage-lawyer-update")
    public String lawyerUpdate(LawyerVO vo) {
        lawyerService.lawyerUpdate(vo);
        return "redirect:mypage-lawyer";
    }
    //변호사 마이페이지 비밀번호변경진입 페이지 연결 01.22 김모세
    @RequestMapping("/mypage-pass-lawyer")
    public String lawyerPass() {
        return "follaw/mypage/mypage-pass-lawyer";
    }
    //변호사 마이페이지 비밀번호변경진입 01.23 김모세
    @RequestMapping("/mypage-pass-lawyer-confirm")
    public String lawyerPassConfirm(HttpSession session, String pass) {
        String lawyer_id = (String) session.getAttribute("lawyer_id");
        LawyerVO vo = new LawyerVO();
        
        vo.setLawyer_id(lawyer_id);
        vo.setLawyer_pass(pass);
        String result = lawyerService.lawyerPassConfirm(vo);
        if(result != null){
            return "redirect:mypage-newpass-lawyer";
        }else{
            return "follaw/mypage/mypage-pass-lawyer";
        }
    }
    //변호사 마이페이지 새비밀번호 페이지 연결 01.22 김모세
    @RequestMapping("/mypage-newpass-lawyer")
    public String lawyerNewPass() {
        return "follaw/mypage/mypage-newpass-lawyer";
    }
    //변호사 마이페이지 새비밀번호 변경 01.22 김모세
    @RequestMapping("/mypage-newpass-lawyer-update")
    public String lawyerNewPassUpdate(HttpSession session, String newpass) {
        String lawyer_id = (String) session.getAttribute("lawyer_id");
        LawyerVO vo = new LawyerVO();

        vo.setLawyer_id(lawyer_id);
        vo.setNewpass(newpass);
        lawyerService.lawyerNewPassUpdate(vo);
        return "redirect:mypage-pass-lawyer";
    }
    //변호사 마이페이지 멤버십 날짜 불러오기 01.22 김모세
    @RequestMapping("/mypage-membership")
    public String lawyerMembership(LawyerVO vo, Model model, HttpSession session) {
        String lawyer_id = (String) session.getAttribute("lawyer_id");

        vo.setLawyer_id(lawyer_id);
        LawyerVO result = lawyerService.getLawyer(vo);
        model.addAttribute("lawyerMembership", result);
        
        return "follaw/mypage/mypage-membership";
    }

    //변호사 마이페이지 결제연결 01.22 김모세
    @RequestMapping("/mypage-pay")
    public String lawyerPay() {
        return "follaw/mypage/mypage-pay";
    }
    //변호사 마이페이지 결제 01.22 김모세
    @RequestMapping("/mypage-pay-confirm")
    @ResponseBody
    public void insertMembership(HttpSession session, int pdate, int price, String product) {
        String lawyer_id = (String) session.getAttribute("lawyer_id");
        LawyerVO vo = new LawyerVO();

        vo.setLawyer_id(lawyer_id);
        vo.setPdate(pdate);
        vo.setPrice(price);
        vo.setProduct(product);
        lawyerService.insertMembership(vo);
        lawyerService.insertPayment(vo);
    }
    //변호사 마이페이지 결제완료페이지 01.22 김모세
    @RequestMapping("/mypage-pay-complete")
    public String lawyerPayComplete() {
        return "follaw/mypage/mypage-pay-complete";
    }
    //변호사 마이페이지 결제내역 연결 및 불러오기 01.24 김모세
    @RequestMapping("/mypage-paymentdetail")
    public String paymentDetail(PaymentVO vo, Model model, HttpSession session){
        String lawyer_id = (String) session.getAttribute("lawyer_id");
        vo.setLawyer_id(lawyer_id);

        List<PaymentVO> paymentDetail = lawyerService.paymentDetail(vo);

        model.addAttribute("paymentDetail", paymentDetail);

        return "follaw/mypage/mypage-paymentdetail";
    }
    //변호사 마이페이지 신고하기 연결 01.22 김모세
    @RequestMapping("/mypage-complaint-lawyer")
    public String lawyerComplaint() {
        return "follaw/mypage/mypage-complaint-lawyer";
    }
    //변호사 마이페이지 신고하기 제출 01.23 김모세
    @RequestMapping("/mypage-complaint-lawyer-send")
    public String lawyerReport(ReportVO vo) {
        reportService.insertReport(vo);
        return "redirect:mypage-complaint-lawyer";
    }



}