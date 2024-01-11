package com.example.controller;

import com.example.domain.NewsVO;
import com.example.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.service.MainService;
import org.springframework.web.bind.annotation.ResponseBody;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("follaw")
public class MainController {
	
	@Autowired
	private MainService mainService;
	@Autowired
	private NewsService newsService;
	
	// [요청] http://127.0.0.1:8080/board/xxxxxxxxxxxxxx
	@RequestMapping("/{step}")
	public String viewPage(@PathVariable String step) {
		return "/follaw/" + step;
	}

	/**
	 * 기능 : json 데이터를 받아서 리턴
	 */


	 @RequestMapping("/index")
	 public void follaw(Model m) {
		 NewsVO vo = new NewsVO();
		 vo.setNews_date(LocalDate.now());
		 List<NewsVO> result = newsService.getTotalNewsList(vo);
		 System.out.println(result.toString());
		 m.addAttribute("newsList", result);
	 }
	@RequestMapping("/case/{number}")
	public String detailCase(@PathVariable String number, Model m){
		m.addAttribute("number", number);
		return "follaw/case";
	}

	@RequestMapping("/news")
	public void getTotalNewsList(NewsVO vo, Model m){
		List<NewsVO> totalNewsList = newsService.getTotalNewsList(vo);
		System.out.println(totalNewsList.toString());
		m.addAttribute("newsTotalList", totalNewsList);
//		return totalNewsList;
	}

}
