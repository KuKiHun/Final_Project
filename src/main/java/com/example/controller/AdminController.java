package com.example.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.domain.AdminVO;
import com.example.domain.BoardVO;
import com.example.mycommon.MyConstant;
import com.example.service.AdminService;
import com.example.util.Paging;

@Controller
@RequestMapping("/admin/")
public class AdminController {
	
	@Autowired
	AdminService admin_service;
	
	@RequestMapping("list")
	public String list() {

		return "admin/dashboard";
	}
	
	//공지사항 전체목록
	@RequestMapping("notice")
	public String notice(@RequestParam(value = "page", required = false, defaultValue = "1") int nowPage,
						Model model) {
		
		int start = (nowPage-1) * MyConstant.Notice.BLOCK_LIST+1;
		int end = start + MyConstant.Notice.BLOCK_LIST-1;
		
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		List<AdminVO> list = admin_service.notice_selectList_condition(map);
		System.out.println(list.size());
		
		//전체 게시물수 구하기
		int rowTotal = admin_service.notice_selectRowTotal();
		System.out.println(rowTotal);
		

		String pagingMenu = Paging.getPaging("notice", 
											nowPage, 
											rowTotal,
											MyConstant.Notice.BLOCK_LIST, 
											MyConstant.Notice.BLOCK_PAGE);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingMenu", pagingMenu);
		
		return "admin/admin_notice_list";
	}
	
	//공지사항
	@RequestMapping("view")
	public String view(Integer board_idx, Model model) {
		
		AdminVO vo = admin_service.notice_selectOne(board_idx);
		
		model.addAttribute("vo", vo);
		
		return "admin/admin_notice_view";
	}
	
	//공지사항 글쓰기폼
	@RequestMapping("insert_form")
	public String insert_form() {
		
		return "admin/admin_notice_insert_form";
	}
	
	//공지사항 추가
	@RequestMapping("insert")
	public String insert(AdminVO vo) {
		
		int res = admin_service.notice_insert(vo);
		System.out.println(res);
		
		return "redirect:notice";
	}
	
	//공지사항 수정폼
	@RequestMapping("modify_form")
	public String modify_form(Integer board_idx, Integer page, Model model) {
		
		//1.수정 데이터 정보 1건 얻어오기
		AdminVO vo = admin_service.notice_selectOne(board_idx);
		
		// <br> => \r\n 변경
		String board_content = vo.getBoard_content().replaceAll("<br>", "\r\n");
		vo.setBoard_content(board_content);
		
		//2.결과적으로 request binding
		model.addAttribute("vo", vo);
		model.addAttribute("page", page);
		
		return "admin/admin_notice_modify_form";
	}
	
	//공지사항 수정
	@RequestMapping("modify")
	public String modify(AdminVO vo, Integer page, Model model) {

		//DB Insert
		int res = admin_service.notice_update(vo);
		System.out.println(res);
		
		//\r\n -> <br>
		String board_content = vo.getBoard_content().replaceAll("\r\n", "<br>");
		vo.setBoard_content(board_content);
		
		//model 통해서 전달된 데이터가 query이용
		model.addAttribute("board_idx", vo.getBoard_idx());
		model.addAttribute("page", page);
		
		
		return "redirect:view";
	}
	
	//공지사항 삭제
	@RequestMapping("delete")
	public String delete(Integer board_idx,@RequestParam(value="page",required=false,defaultValue="1") Integer page,
						 Model model) {
		
		int res = admin_service.notice_delete(board_idx);
		System.out.println(res);
		
		model.addAttribute("page", page);
		
		return "redirect:notice";
	}
	
	

}