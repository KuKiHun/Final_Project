package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.domain.CounselVO;
import com.example.service.CounselService;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/follaw")
public class CounselReplyController {

    @Autowired
    CounselService counselService;
    
    @RequestMapping("/insertCounsel")
    public void insertCounsel(@RequestParam("content") String content, HttpSession session){
        CounselVO vo = new CounselVO();
        vo.setBoard_reply_content(content);
        System.out.println("CounselController vo>>> " + vo);
        counselService.insertCounsel(vo);
    }

    @RequestMapping("/getCounsel")
    public void getCounsel(CounselVO vo){
        counselService.getCounsel(vo);
    }

    @RequestMapping("/getCounselList")
    public void getCounselList(CounselVO vo){
        counselService.getCounselList(vo);
    }

}
