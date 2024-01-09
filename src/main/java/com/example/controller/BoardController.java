package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.domain.BoardVO;
import com.example.service.BoardService;

@Controller
@RequestMapping("/board/")
public class BoardController {
	
	@Autowired
	BoardService board_service;
	
	@RequestMapping("notice")
	public String notice(Model model) {
		
		List<BoardVO> list = board_service.selectList();
		System.out.println(list);
		
		model.addAttribute("list", list);
		
		return "board/notice_list";
	}
	
	@RequestMapping("insert_form")
	public String insert_form() {
		
		return "board/notice_insert_form";
	}
	
	@RequestMapping("notice_insert")
	public String notice_insert(BoardVO vo) {
		
		int res = board_service.insert(vo);
		
		System.out.println(res);
		
		return "redirect:/follaw/index";
	}

}
