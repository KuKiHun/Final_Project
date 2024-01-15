package com.example.controller;

import com.example.domain.LawsVO;
import com.example.service.LawsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("admin/knowledge")
public class AdminKnowledgeController {

    @Autowired
    LawsService lawsService;

    @RequestMapping("/{step}")
    public String viewPage(@PathVariable String step) {
        return "admin/knowledge/" + step;
    }

    @RequestMapping(value = {"/laws", "/laws/{act}"})
    public String adminLawManage(@PathVariable(required = false) String act, Model m){
        List<String> sorts = lawsService.getLawsSort();
        m.addAttribute("sorts", sorts);
        if (act != null) {
            m.addAttribute("act", act);
            LawsVO vo = new LawsVO();
            vo.setLaws_act(act);
            m.addAttribute("laws", lawsService.getLawsByAct(vo));
        }
            return "admin/knowledge/laws";
    }
}
