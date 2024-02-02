package com.example.controller;
import java.io.IOException;
import java.util.Random;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.API.KakaoAPI;
import com.example.domain.BoardVO;
import com.example.domain.ReportVO;
import com.example.domain.SnsVO;
import com.example.domain.UsersVO;
import com.example.service.BoardService;
import com.example.service.ReportService;
import com.example.service.UsersService;

import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@Controller
@RequestMapping("/member") // 해당 어노테이션은 이 컨트롤러의 모든 메서드에 대한 기본 URL 경로를 /member 로 지정
public class UsersController { //UsersController 클래스 정의
	@Autowired
	private JavaMailSender mailSender;
	@Autowired // 해당 어노테이션을 사용하여 UsersService 타입의 빈을 주입받음
	private UsersService usersService; //멤버변수 usersService 선언
	@Autowired
    private KakaoAPI kakaoApi;
	// @Autowired
    // private NaverAPI naverApi;
	@Autowired
    private ReportService reportService;
	@Autowired
	private BoardService boardService;

	//[요청] http://127.0.0.1:8080/member/임의의 변수 경로
	@RequestMapping("/{step}")
	public String viewPage(@PathVariable String step) { //경로변수 인 step을 메서드의 파라미터로 받아옴
		return "follaw/" + step; // /WEB-INF/views/ + follaw + xxxxxxxx + .jsp 페이지로 이동
	}
	//아이디 중복확인
	@RequestMapping("/userIdCheck")
	@ResponseBody
	public String userIdCheck(UsersVO vo) {
		System.out.println("UserController >> userIdCheck vo :  " + vo.getUser_id());
		UsersVO result = usersService.getUser(vo);
		if(result == null) {
			System.out.println("UserController >> userIdCheck result : null (id사용가능)");
			return "Available";
		} else {
			System.out.println("UserController >> userIdCheck result : (id중복) " + result.getUser_id());
			return "Unavailable";
		}
	}
	//로그인
	@RequestMapping("/login")
	public String login(UsersVO vo, Model m, HttpSession session){ // UsersVO, Model, HttpSession 타입의 파라미터를 받아옴

		// usersService 의 login 메서드를 호출하여 로그인 처리
		// 파리미터로는 vo 를전달
		// 그 결과로 로그인 결과를 담고있는 UsersVO 객체를 반환받아 result 변수에 저장
		UsersVO result = usersService.login(vo);

		System.out.println("[userLogin result] :" + result);
	
		//result 가 null 이 아닌경우 즉, 로그인 성공한경우 세션에 사용자 이름 저장하고 "/follaw/index" 로 리다이렉트
		//result 가 null 인 경우 즉, 로그인 실패한경우 "/follaw/index" 로 리다이렉트
		
		if (result !=null) {
			session.setAttribute("user_name", result.getUser_name());
			session.setAttribute("user_id", result.getUser_id());
			session.setAttribute("user_pw", result.getUser_pw());
			session.setAttribute("user_tel", result.getUser_tel());
			session.setAttribute("user_birth", result.getUser_birth());
			session.setAttribute("auth_idx", result.getAuth_idx());
			
			if (result.getAuth_idx() == 2) {
				return "redirect:/follaw/admin_login";
			} else {
				return "redirect:/follaw/index";
			}
		}else {
			return "redirect:/follaw/index" ;
			
		}
	}
	//카카오 로그인 (인증코드를 이용하여 엑세스 토큰을 받고 토큰을 사용하여 사용자정보 가져온 후 로그인 처리)
	//getAccessToken : 카카오 서버에 엑세스 토큰을 요청하는 역할
	@RequestMapping("/kakaoCallback")
		//1. 인가코드 받기 (@RequestParam String code)
		public String kakaoLogin(@RequestParam("code") String code,HttpSession session){
		//2. 토큰 받기
		String accessToken = kakaoApi.getAccessToken(code);
		System.out.println("kakaoCode(controller):" + code);
		String userInfo  = kakaoApi.getUserInfo(accessToken); //엑세스토큰을 사용하여 사용자 정보를 HashMap 형태로 반환
		System.out.println("accessToken(controller): " + accessToken);
		 //사용자 정보를 콘솔에 출력 (디버깅 목적)
		System.out.println("login info(controller): " + userInfo );
		
		UsersVO result = usersService.kakaoLogin(userInfo );
		System.out.println("[kakaoLogin result] :" + result);
		
		session.setAttribute("user_id", result.getUser_id());
		session.setAttribute("user_name", result.getUser_name());
		session.setAttribute("user_tel", result.getUser_tel());
		session.setAttribute("user_birth", result.getUser_birth());

		return "follaw/index";
        
    }
	// @RequestMapping("/naverCallback")
	// public String naverLogin(@RequestParam("code") String code, @RequestParam("state") String state, HttpSession session) {
	//     // 1. 토큰 받기
	//     String clientId = "bBV_Um5Yz2EDCd7w6sW0";
	//     String clientSecret = "kV5FP9s3C0";
	//     String redirectUri = "http://localhost:8080/member/naverCallback";

	//     String naverTokenEndpoint = "https://nid.naver.com/oauth2.0/token";
	//     String requestBody = "grant_type=authorization_code" +
	//             "&client_id=" + clientId +
	//             "&client_secret=" + clientSecret +
	//             "&code=" + code +
	//             "&state=" + state +
	//             "&redirect_uri=" + redirectUri;

	//     // Make a POST request to the Naver token endpoint
	//     // Parse the JSON response to get access token
	//     String accessToken = naverApi.getAccessToken(naverTokenEndpoint, requestBody);

	//     // 2. 사용자 정보 받기
	//     String naverUserInfoEndpoint = "https://openapi.naver.com/v1/nid/me";
	//     String userInfo = naverApi.getUserInfo(accessToken, naverUserInfoEndpoint);

	//     // 3. 사용자 정보를 콘솔에 출력 (디버깅 목적)
	//     System.out.println("Naver Login Info: " + userInfo);

	//     // 4. 사용자 정보를 이용하여 로그인 처리 등 필요한 로직 수행
	//     UsersVO result = usersService.naverLogin(userInfo);

	//     // 5. 세션에 사용자 정보 저장
	// 	session.setAttribute("user_id", result.getUser_id());
	// 	session.setAttribute("user_name", result.getUser_name());
	// 	session.setAttribute("user_tel", result.getUser_tel());
	// 	session.setAttribute("user_birth", result.getUser_birth());

	//     return "follaw/index"; // 로그인 후 리다이렉트할 페이지 설정
	// }

	//마이페이지 정보 조회
    @RequestMapping("/mypage")
    public String getUserInfo(Model model, String user_id) {
        UsersVO userInfo = usersService.getUserInfo(user_id);
		//SnsVO 
		System.out.println("UsersVO 마이페이지 userInfo : "+userInfo);
        model.addAttribute("userInfo", userInfo);
		
        return "follaw/mypage/mypage"; //"mypage"는 mypage.jsp 가리킴
    }
	//마이페이지 정보 수정
	@RequestMapping("/mypage-update")
	public String updateUserInfo(UsersVO vo, Model model, HttpSession session){
		usersService.updateUserInfo(vo);
		// 수정된 정보를 세션에 업데이트
		session.setAttribute("user_id", vo.getUser_id());
		session.setAttribute("user_name", vo.getUser_name());
		session.setAttribute("user_tel", vo.getUser_tel());
		session.setAttribute("user_birth", vo.getUser_birth());
		//model.addAttribute("message", "마이페이지 수정 성공");
		System.out.println("updateUserInfo:" + vo);
		return "follaw/mypage/mypage";
	}
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
	// 일반유저 회원가입 (일반 + 카카오)
	@RequestMapping("/insertMember")
	public String insertMember(UsersVO vo, SnsVO svo) {
		System.out.println("/member/insertMember 요청:" + vo); //파리미터로 전달받은 vo 객체 출력
		System.out.println("/member/insertMember 요청:" + svo); //파리미터로 전달받은 vo 객체 출력
		usersService.insertMember(vo); //insertMember를 호출하여 회원가입 수행 (vo 파리미터 전달)
		usersService.insertSnsMember(svo);
		return "/follaw/index";
	}

	//비밀번호 찾기 이메일 인증
	@RequestMapping("/pw_auth")
    public ModelAndView pw_auth(HttpSession session, 
         HttpServletRequest request, HttpServletResponse response) throws IOException {
      String user_id = (String)request.getParameter("user_id");
      System.out.println("이메일인증 user_id :" + user_id);
      UsersVO vo = usersService.selectMember(user_id);
			
      if(vo != null) {
      Random r = new Random();
      int num = r.nextInt(999999); // 랜덤난수설정

      if (vo.getUser_id().equals(user_id)) {
         session.setAttribute("user_id", vo.getUser_id());

         String setfrom = "kukh0113@naver.com"; // naver 
         String tomail = user_id; //받는사람
         String title = "[FolLaw] 비밀번호변경 인증 이메일 입니다"; 
         String content = System.getProperty("line.separator") + "안녕하세요 회원님" + System.getProperty("line.separator")
               + "FolLaw 비밀번호찾기(변경) 인증번호는 " + num + " 입니다." + System.getProperty("line.separator"); // 

         try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");

            messageHelper.setFrom(setfrom); 
            messageHelper.setTo(tomail); 
            messageHelper.setSubject(title);
            messageHelper.setText(content); 

            mailSender.send(message);
			System.out.println("이메일발송 성공");
         } catch (Exception e) {
            System.out.println("이메일 발송 실패"+e.getMessage());
         }

         ModelAndView mv = new ModelAndView();
         mv.setViewName("follaw/pw_auth");
         mv.addObject("num", num);
         return mv;
      }else {
         ModelAndView mv = new ModelAndView();
         mv.setViewName("follaw/pw_find");
         return mv;
      }

      }else {
         ModelAndView mv = new ModelAndView();
         mv.setViewName("follaw/pw_find");
         return mv;
      }
   
}

// 인증번호 확인
@RequestMapping(value = "/pw_set", method = RequestMethod.POST)
public ModelAndView pw_set(@RequestParam(value="email_injeung") String email_injeung,
                            @RequestParam(value = "num") String num) throws IOException {
    ModelAndView mv = new ModelAndView();

    if(email_injeung.equals(num)) {
        mv.setViewName("follaw/pw_new");
        mv.addObject("num", num);
		System.out.println("num:"+num);
    } else {
        mv.setViewName("follaw/pw_find");
    }

    return mv;
}
   
   // 새 비밀번호 설정
@RequestMapping(value = "/pw_new", method = RequestMethod.POST)
public ModelAndView pw_new(UsersVO vo, HttpSession session) throws IOException {
    ModelAndView mv = new ModelAndView();
    int result = usersService.pwUpdate_M(vo);

    if(result == 1) {
        mv.setViewName("follaw/index");
    } else {
        mv.setViewName("follaw/pw_new");
    }

    return mv;
}

	//일반 마이페이지 신고하기 연결
    @RequestMapping("/mypage-complaint")
    public String userComplaint() {
        return "follaw/mypage/mypage-complaint";
    }
    //일반 마이페이지 비밀번호변경진입 페이지 연결
    @RequestMapping("/mypage-pass")
    public String userPass() {
        return "follaw/mypage/mypage-pass";
    }
    //일반 마이페이지 비밀번호변경진입
    @RequestMapping("/mypage-pass-confirm")
    public String userPassConfirm(HttpSession session, String pass) {
        String user_id = (String) session.getAttribute("user_id");
        UsersVO vo = new UsersVO();
        
        vo.setUser_id(user_id);
        vo.setUser_pw(pass);
        String result = usersService.userPassConfirm(vo);
        if(result != null){
            return "redirect:mypage-newpass";
        }else{
            return "follaw/mypage/mypage-pass";
        }
    }
    //일반 마이페이지 새비밀번호 페이지 연결
    @RequestMapping("/mypage-newpass")
    public String userNewPass() {
        return "follaw/mypage/mypage-newpass";
    }
    //일반 마이페이지 새비밀번호 변경
    @RequestMapping("/mypage-newpass-update")
    public String userNewPassUpdate(HttpSession session, String new_user_pw) {
        String user_id = (String) session.getAttribute("user_id");	
        UsersVO vo = new UsersVO();
        vo.setUser_id(user_id);
		//vo.setUser_pw(user_pw);
        vo.setNew_user_pw(new_user_pw);
        usersService.userNewPassUpdate(vo);
		System.out.println("userUpdatepassword:" + vo);
        return "redirect:mypage-pass";
    }
    //일반 마이페이지 신고하기 제출
    @RequestMapping("/mypage-complaint-send")
    public String userReport(ReportVO vo) {
        reportService.insertReport(vo);
        return "redirect:mypage-complaint";
    }
	//일반 마이페이지 내가쓴 게시물 김모세 02.01
	@RequestMapping("/mypage-post")
	public String userPost(BoardVO vo, HttpSession session, Model model){
		String user_id = (String) session.getAttribute("user_id");
		vo.setUser_id(user_id);

		List<BoardVO> mypost = boardService.userPost(vo);
		model.addAttribute("mypost", mypost);
		return "follaw/mypage/mypage-post";
	}

}