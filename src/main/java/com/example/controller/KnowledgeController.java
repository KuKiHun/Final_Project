package com.example.controller;

import com.example.domain.LawsVO;
import com.example.service.LawsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("follaw")
public class KnowledgeController {

    @Autowired
    LawsService lawsService;

    @RequestMapping("/knowledge/law")
    public void searchPage(Model m){
        m.addAttribute("laws",lawsService.getLawsSort());
    }

    @RequestMapping("/knowledge/case")
    public void casePage(){
//        return "/follaw/" + step;
    }
}
