package com.example.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.domain.BoardVO;
import com.example.mycommon.MyConstant;
import com.example.service.BoardService;
import com.example.util.Paging;

@Controller
@RequestMapping("/board/")
public class BoardController {
	
	@Autowired
	BoardService board_service;
	
	//목록보기
	@RequestMapping("notice")
	public String notice(@RequestParam(value = "page", required = false, defaultValue = "1") int nowPage, 
						@RequestParam(value = "search", required = false, defaultValue = "all" ) String search, 
						@RequestParam(value = "search_text", required = false, defaultValue = "search_text") String search_text, 
						Model model) {
		
		int start = (nowPage-1) * MyConstant.Notice.BLOCK_LIST+1;
		int end = start + MyConstant.Notice.BLOCK_LIST-1;
		
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		//검색 조건 Map에 추가
		if(search.equals("user")) {
			map.put("user", search_text);
		}else if(search.equals("title")) {
			map.put("title", search_text);
		}else if(search.equals("content")) {
			map.put("content", search_text);
		}else if(search.equals("regdate")) {
			map.put("regdate", search_text);
		}
		
		List<BoardVO> list = board_service.selectList_condition(map);
		System.out.println(list.size());
		
		//전체 게시물수 구하기
		int rowTotal = board_service.selectRowTotal_condition(map);
		System.out.println(rowTotal);
		
		//PagingMenu
		String search_filter = String.format("&search=%s&search_text=%s", search,search_text);
		String pagingMenu = Paging.getPaging("notice", 
											nowPage, 
										    rowTotal,
											search_filter,
											MyConstant.Notice.BLOCK_LIST, 
											MyConstant.Notice.BLOCK_PAGE);
		

		model.addAttribute("list", list);
		model.addAttribute("pagingMenu", pagingMenu);
		
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
	
	@RequestMapping("view")
	public String view(int board_idx, Model model) {
		
		BoardVO vo = board_service.selectOne(board_idx);
		
		model.addAttribute("vo", vo);
		
		return "board/notice_view";
	}

}
