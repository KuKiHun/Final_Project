package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.domain.LawfirmsVO;
import com.example.service.LawfirmsService;

@Controller
@RequestMapping("follaw")
public class ImsiController {

    @Autowired
    private LawfirmsService lawfirmsService;

    //변호사 회원가입 법률사무소리스트 불러오기 01.18 김모세
    @RequestMapping("sign-up-lawyer")
    public String signupLawfirm(LawfirmsVO vo, Model model) {
        List<LawfirmsVO> signupLawfirm = lawfirmsService.signupLawfirm();
        
        model.addAttribute("signupLawfirm",signupLawfirm);
        return "follaw/sign-up-lawyer";
    }

    
}
