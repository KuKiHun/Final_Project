package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.domain.PartnerLawyerVO;
import com.example.service.PartnerLawyerService;

@Controller
@RequestMapping("follaw")
public class PartnerLawyerController {

    @Autowired
    private PartnerLawyerService partnerLawyerService;

    //파트너 변호사 리스트 01.18 김모세
    @RequestMapping("/partner-lawyer")
    public String partnerLawyerList(PartnerLawyerVO vo, Model model) {
        List<PartnerLawyerVO> partnerLawyerList = partnerLawyerService.partnerLawyerList();
        List<PartnerLawyerVO> powerLawyerList = partnerLawyerService.powerLawyerList();

        model.addAttribute("partnerLawyerList", partnerLawyerList);
        model.addAttribute("powerLawyerList", powerLawyerList);

        return "follaw/partner-lawyer";
    }
    
}
