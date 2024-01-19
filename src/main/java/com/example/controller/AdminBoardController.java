package com.example.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.domain.AdminVO;
import com.example.domain.NewsVO;
import com.example.domain.ViewVO;
import com.example.domain.NewsVO;
import com.example.mycommon.MyConstant;
import com.example.service.AdminBoardService;
import com.example.service.NewsService;
import com.example.service.ViewService;
import com.example.util.Paging;

@Controller
@RequestMapping("admin/board")
public class AdminBoardController {

	@Autowired
	AdminBoardService admin_service;
	
	@Autowired
	ViewService viewService;

	@Autowired
	NewsService newsService;

	@RequestMapping("/{step}")
	public String viewPage(@PathVariable String step) {
		return "admin/board/" + step;
	}
	
	//공지사항 전체목록
	@RequestMapping("notice")
	public String notice(@RequestParam(value = "page", required = false, defaultValue = "1") int nowPage, Model model) {
		
		//현재 보여질 페이지 : nowPage
		
		//가져올 범위계산
		int start = (nowPage-1) * MyConstant.Notice.BLOCK_LIST+1;
		int end = start + MyConstant.Notice.BLOCK_LIST-1;

		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		
		List<AdminVO> list = admin_service.notice_selectList_condition(map);
		//System.out.println(list.size());
		
		//전체 게시물수 구하기
		int rowTotal = admin_service.notice_selectRowTotal();
		//System.out.println(rowTotal);
		
		//PagingMenu
		String pagingMenu = Paging.getPaging("notice", 
											nowPage, 
											rowTotal,
											MyConstant.Notice.BLOCK_LIST, 
											MyConstant.Notice.BLOCK_PAGE);
		
		//model통해서 DispatcherServlet에게 전달 => 결과적으로 request binding
		model.addAttribute("list", list);
		model.addAttribute("pagingMenu", pagingMenu);

		return "admin/board/admin_notice_list";
	}

	//공지사항
	@RequestMapping("view")
	public String view(Integer board_idx, Model model) {
		
		ViewVO vo = new ViewVO();
		vo.setUser_id("qwer");
		vo.setBoard_idx(board_idx);
		Integer view = viewService.getView(vo);
		if (view == 0){
			viewService.insertView(vo);
		}
		
		AdminVO Bvo = admin_service.notice_selectOne(board_idx);
		
		model.addAttribute("vo", Bvo);
		
		return "admin/board/admin_notice_view";
	}
	
	//공지사항 추가
	@RequestMapping("insert")
	public String insert(AdminVO vo) {
		
		int res = admin_service.notice_insert(vo);
		//System.out.println(res);
		
		return "redirect:notice";
	}

	//공지사항 수정폼
	@RequestMapping("modify_form")
	public String modify_form(Integer board_idx, Integer page, Model model) {

		//1.수정 데이터 정보 1건 얻어오기
		AdminVO vo = admin_service.notice_selectOne(board_idx);
		
			
		//2.결과적으로 request binding
		model.addAttribute("vo", vo);
		model.addAttribute("page", page);

		return "admin/board/admin_notice_modify_form";
	}

	//공지사항 수정
	@RequestMapping("modify")
	public String modify(AdminVO vo, Integer page, Model model) {

		//DB Insert
		int res = admin_service.notice_update(vo);
		//System.out.println(res);
		
		//model 통해서 전달된 데이터가 query이용
		//model.addAttribute("board_idx", vo.getBoard_idx());
		//model.addAttribute("page", page);
		
		return "redirect:view?board_idx=" + vo.getBoard_idx() + "&page=" + page;
	}

	//공지사항 삭제
	@RequestMapping("delete")
	public String delete(Integer board_idx,@RequestParam(value="page",required=false,defaultValue="1") Integer page,
						 Model model) {
		
		int res = admin_service.notice_delete(board_idx);
		//System.out.println(res);
		
		//model.addAttribute("page", page);
		
		return "redirect:notice?page=" + page;
	}

	@RequestMapping(value = {"/news", "/news/{page}"})
	public String getTotalNewsList(@PathVariable(required = false) Integer page, Model m){
		page = page != null? page-1 : 0;
		List<NewsVO> result = newsService.getTotalNewsListPaging(page*10);
		int totalNews = newsService.getPagingSize();
		int max = totalNews%10 == 0? totalNews/10 : totalNews/10 + 1;
		// 최소 범위, 1 단위
		int rangeMin = page-page%10+1;

		// 최대 범위, 10 단위 혹은 최대 값
		int rangeMax = rangeMin+9 > max? max : rangeMin+9;
//		System.out.println("page : "+page+" / Min : "+rangeMin+" / Max : "+max);
		List<Integer> pagingList = new ArrayList<Integer>();
		for (int i = rangeMin; i < rangeMax+1; i++) {
			pagingList.add(i);
		}
//		System.out.println("TotalSize : "+totalNews+" / PagingSize : "+pagingList);
		m.addAttribute("min", rangeMin-1 <1 ? 1 : rangeMin-1);
		m.addAttribute("max", rangeMax+1 > max? max : rangeMax+1);
		m.addAttribute("newsList", result);
		m.addAttribute("pagingList", pagingList);
		return "admin/board/news";
	}
}