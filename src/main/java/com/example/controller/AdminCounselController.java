package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.domain.BoardVO;
import com.example.domain.ChatVO;
import com.example.domain.CounselVO;
import com.example.domain.ViewVO;
import com.example.service.BoardService;
import com.example.service.CounselService;
import com.example.service.ViewService;

@Controller
@RequestMapping("admin")
public class AdminCounselController {

    @Autowired
    BoardService board_service;

    @Autowired
    ViewService viewService;

    @Autowired
    CounselService counselService;
    
    @RequestMapping("/admin_counselList")
    public void getCounselBoardList(Model m){
        
        //리스트 출력
        BoardVO vo = new BoardVO();
        List<BoardVO> list = board_service.getCounselBoardList(vo);
        System.out.println("AdminCounselController >>> getCounselBoardList / list: " + list );

        m.addAttribute("counselBoardList", list);
    }

    @RequestMapping("/admin_chatCounsel")
    public void getChatCounselList(Model m){
        ChatVO vo = new ChatVO();
        List<ChatVO> list = counselService.getChatCounselList(vo);
        System.out.println("AdminCounselController >>> getChatCounselList / list: " + list );

        m.addAttribute("chatCounselList", list);
    }

    @RequestMapping("/admin_videoCounsel")
    public void getVideoCounselList(Model m){
        ChatVO vo = new ChatVO();
        List<ChatVO> list = counselService.getVideoCounselList(vo);
        System.out.println("AdminCounselController >>> getVideoCounselList / list: " + list );

        m.addAttribute("videoCounselList", list);
    }
    
}
