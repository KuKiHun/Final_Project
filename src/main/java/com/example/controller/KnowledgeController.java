package com.example.controller;

import com.example.domain.LawsVO;
import com.example.service.LawsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("follaw/knowledge")
public class KnowledgeController {

    @Autowired
    LawsService lawsService;

    @RequestMapping(value = {"/law", "/law/{act}"})
    public String searchPage(@PathVariable(required = false) String act,Model m){
        if (act != null){
            LawsVO vo = new LawsVO();
            vo.setLaws_act(act);
            List<LawsVO> lawsByAct = lawsService.getLawsByAct(vo);
//            System.out.println("lawsService.getLawsByAct(vo) : "+lawsByAct);
            m.addAttribute("law_act", lawsByAct);
            m.addAttribute("law_act_name", act);
        }
        m.addAttribute("laws",lawsService.getLawsSort());
        return "follaw/knowledge/law";
    }

    @RequestMapping("/lawList")
    @ResponseBody
    public List<String> getLawList(){
        return lawsService.getLawsSort();
    }


    @RequestMapping(value = {"/cases", "/cases/{page}", "/cases/{category}/{keyword}","/cases/{category}/{keyword}/{page}"})
    public String casePage(@PathVariable(required = false) String category,
                           @PathVariable(required = false) String keyword,
                           @PathVariable(required = false) Integer page){
        return "follaw/knowledge/cases";
    }

    @RequestMapping("/case/{number}")
    public String detailCase(@PathVariable String number, Model m){
        m.addAttribute("number", number);
        return "follaw/knowledge/case";
    }
}
