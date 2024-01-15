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
@RequestMapping("/follaw/board/")
public class BoardController {
	
	@Autowired
	BoardService board_service;
	
	//목록보기
	@RequestMapping("notice")
	public String notice(@RequestParam(value = "page", required = false, defaultValue = "1") int nowPage, 
						@RequestParam(value = "search", required = false, defaultValue = "all" ) String search, 
						@RequestParam(value = "search_text", required = false, defaultValue = "") String search_text, 
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
		
		//조건별 조회
		List<BoardVO> list = board_service.selectList_condition(map);
		System.out.println("조건별 조회 : "+ list.size());
		
		//검색 조건별 게시물수
		int rowTotal = board_service.selectRowTotal_condition(map);
		System.out.println("검색 조건별 게시물 : "+ rowTotal);
		
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
		
		return "follaw/board/notice_list";
	}
	
	@RequestMapping("view")
	public String view(int board_idx, Model model) {
		
		BoardVO vo = board_service.selectOne(board_idx);
		
		model.addAttribute("vo", vo);
		
		return "follaw/board/notice_view";
	}

}
