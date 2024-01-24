package com.example.controller;

import com.example.domain.LawyerVO;
import com.example.domain.PartnerLawyerVO;
import com.example.service.LawsService;
import com.example.service.LawyerService;
import com.example.service.PartnerLawyerService;
import com.example.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController("/flutter")
public class FlutterController {
    @Autowired
    PartnerLawyerService partnerLawyerService;

    @Autowired
    LawsService lawsService;

    @Autowired
    UsersService usersService;

    @RequestMapping("/lawyerList")
    public List<PartnerLawyerVO> getLawyerList(){
        List<PartnerLawyerVO> partnerLawyerList = partnerLawyerService.partnerLawyerList();
        List<PartnerLawyerVO> powerLawyerList = partnerLawyerService.powerLawyerList();
        System.out.println("partnerLawyerList.size() : "+partnerLawyerList.size());
        System.out.println("powerLawyerList.size() : "+powerLawyerList.size());
        partnerLawyerList.addAll(powerLawyerList);
        System.out.println("partnerLawyerList.size() : "+partnerLawyerList.size());
        return partnerLawyerList;
    }
}
