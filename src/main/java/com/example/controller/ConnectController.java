package com.example.controller;

import com.example.domain.LawsVO;
import com.example.domain.LawyerVO;
import com.example.domain.MemberVO;
import com.example.service.LawsService;
import com.example.service.LawyerService;
import com.example.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpSession;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class ConnectController {

    @Autowired
    LawyerService lawyerService;

    @Autowired
    MemberService memberService;
    //CORS (Cross-Origin Resource Sharing) 정책을 설정하는 데 사용된다.
    @CrossOrigin(origins = "http://localhost:3000")
    @GetMapping(value = "/lawyerConnect/{lawyer_id}")
    public Map<String, Object> getLawyerConnect(@PathVariable(name = "lawyer_id") String lawyer_id){
        LawyerVO vo = new LawyerVO();
        vo.setLawyer_id(lawyer_id);
        LawyerVO lawyer = lawyerService.getLawyer(vo);

        Map<String, Object> map = new HashMap<>();

        map.put("lawyer_name", lawyer.getLawyer_name());
        map.put("lawyer_id", lawyer_id);
        map.put("auth_idx", lawyer.getAuth_idx());

        System.out.println("ConnectController >>>> " + map);
        return map;
    }

    
    @CrossOrigin(origins = "http://localhost:3000")
    @GetMapping("/userConnect/{userId}")
    public Map<String, Object> getUserConnect(@PathVariable String userId){
        MemberVO result = memberService.getMemberById(userId);

        Map<String, Object> map = new HashMap<>();
        map.put("user_id", userId);
        map.put("user_name", result.getUser_name());
        map.put("auth_idx", result.getAuth_idx());

        System.out.println("ConnectController >>>> " + map);

        return map;
    }
}
