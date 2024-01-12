package com.example.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.domain.ChatVO;
import com.example.jwt.JwtUtil;

@RestController
@RequestMapping("follaw")
public class ChatController {

    private final JwtUtil jwtUtil;

    public ChatController(JwtUtil jwtUtil) {
        this.jwtUtil = jwtUtil;
    }

    @PostMapping(value = "/createToken")
    public String createToken(@RequestBody ChatVO chatVO, Model m) {
        // chatVO 필요한 정보 추출
        String user_id = chatVO.getUser_id();
        String user_name = chatVO.getUser_name();
        String chat_title = chatVO.getChat_title();
        int auth_idx = chatVO.getAuth_idx();

    //null값 존재해서 오류발생
    // public String createToken(@RequestBody Map<String, Object> chatVO) {
    //     // chatVO 필요한 정보 추출
    //     String user_id = (String) chatVO.get("user_id");
    //     String user_name = (String) chatVO.get("user_name");
    //     String chat_title = (String) chatVO.get("chat_title");
    //     int auth_idx = (int) chatVO.get("auth_idx");

        // JwtUtil 클래스의 createToken 메서드 호출하여 토큰 생성
        String token = jwtUtil.createToken(user_id, user_name, chat_title, auth_idx);

        String chatTitle = jwtUtil.getChatTitle(token);
        System.out.println("chatTitle : " + chatTitle);

        m.addAttribute("chatTitle", chatTitle);

        // 생성된 토큰 반환
        return token;
    }

    // @ResponseBody
    // @RequestMapping("/candidate_chat")
    // public String chatRoomName(HttpServletRequest request){
    //     //Request 객체에서 chat_title 값 추출
    //     String chat_title = (String) request.getAttribute("chat_title");

    //     System.out.println("chat_title : " + chat_title);

    //     return "candidate_chat";
    // }

}
