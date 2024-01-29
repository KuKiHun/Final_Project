package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.domain.CourtsVO;
import com.example.domain.LawfirmsVO;
import com.example.service.CourtsService;
import com.example.service.LawfirmsService;

@Controller
@RequestMapping("admin/information")
public class AdminMapController {
    
    @Autowired
    CourtsService courtsService;

    @Autowired
    LawfirmsService lawfirmsService;

    // 관리자 법원리스트 01.27 김모세
    @RequestMapping("courts")
    public void courtsList(CourtsVO vo, Model model) {
        List<CourtsVO> courtsList;
        courtsList = courtsService.courtList();
        model.addAttribute("courtsList",courtsList);
    }

    // 관리자 법률사무소리스트 01.27 김모세
    @RequestMapping("lawfirms")
    public void lawfirmsList(LawfirmsVO vo, Model model) {
        List<LawfirmsVO> lawfirmsList;
        lawfirmsList = lawfirmsService.lawfirmList();
        model.addAttribute("lawfirmsList", lawfirmsList);
    }

    // 관리자 법원 상세보기 01.27 김모세
    @RequestMapping("courts_view")
    public void courtsView(CourtsVO vo, Model model) {
        CourtsVO courts = courtsService.courtView(vo);
        model.addAttribute("courts", courts);
    }

    // 관리자 법률사무소 상세보기 01.27 김모세
    @RequestMapping("lawfirms_view")
    public void lawfirmsView(LawfirmsVO vo, Model model) {
        LawfirmsVO lawfirms = lawfirmsService.lawfirmView(vo);
        model.addAttribute("lawfirms", lawfirms);
    }

    // 관리자 법원정보 수정 01.27 김모세
    @RequestMapping("courts_view_update")
    public String courtUpdate(CourtsVO vo) {
        courtsService.courtUpdate(vo);
        return "redirect:courts";
    }

    // 관리자 법률사무소정보 수정 01.27 김모세
    @RequestMapping("lawfirms_view_update")
    public String lawfirmUpdate(LawfirmsVO vo) {
        lawfirmsService.lawfirmUpdate(vo);
        return "redirect:lawfirms";
    }

    // 관리자 법률사무소 추가 01.27 김모세
    @RequestMapping("lawfirms_insert_submit")
    public String lawfirmInsert(LawfirmsVO vo) {
        lawfirmsService.lawfirmInsert(vo);
        return "redirect:lawfirms";
    }

}
