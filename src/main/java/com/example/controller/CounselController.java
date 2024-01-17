package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.LawFieldVO;
import com.example.service.BoardService;
import com.example.service.LawFieldService;
import com.example.service.ViewService;

import jakarta.servlet.http.HttpSession;

@RequestMapping("follaw")
public class CounselController {

    @Autowired
	BoardService board_service;

	@Autowired
	ViewService viewService;

    @Autowired
	LawFieldService LawFieldService;

    //상담신청페이지 이동
    @RequestMapping("/counselWriting")
    @ResponseBody
    public void getLawFieldList(Model m, HttpSession session){

        System.out.println("123123123123");
        System.out.println(session);

        // // 유저 세션 불러오기
        String user_id = (String) session.getAttribute("user_id");
        System.out.println("CounselController >>> user_id : " + user_id);

        // law_field 에서 리스트 불러오기
        LawFieldVO vo = new LawFieldVO();
        System.out.println("CounselController >>> vo :" + vo);
        List<LawFieldVO> list = LawFieldService.getLawFieldList(vo);
        System.out.println("CounselController >>> list :" + list);

        m.addAttribute("lawFieldList", list);
        m.addAttribute("user_id", user_id);

    }

    // //지식인 상담 신청
	// @RequestMapping("/insertCounselBoard")
	// public void insertCounselBoard(BoardVO vo, HttpSession session){
	// 	//작성자 아이디 세션에서 가져오기
	// 	String user_id = (String) session.getAttribute("user_id");
	// 	vo.setUser_id(user_id);

	// 	System.out.println("BoardController : insertCounselBoard / vo >>> " + vo);

	// 	board_service.insertCounselBoard(vo);
	// }
    
}
