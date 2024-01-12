package com.example.controller;

import com.example.domain.NewsVO;
import com.example.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.service.MainService;

import java.time.LocalDate;
import java.util.List;

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
	 * index 페이지에서 오늘자 뉴스 띄우는 기능
	 * @param m
	 */
	  @RequestMapping("/index")
	  public void follaw(Model m) {
	 	 NewsVO vo = new NewsVO();
	 	 vo.setNews_date(LocalDate.now());
	 	 List<NewsVO> result = newsService.getTodayNewsList(vo);
	 	 System.out.println("Today : "+vo.getNews_date()+"News List Size : "+result.size());
	 	 m.addAttribute("newsList", result);
	  }

	@RequestMapping("/case/{number}")
	public String detailCase(@PathVariable String number, Model m){
		m.addAttribute("number", number);
		return "follaw/case";
	}

	/**
	 * 뉴스 페이지에서 뉴스 출력하는 기능
	 * @param vo
	 * @param m
	 */
	@RequestMapping("/news")
	public void getTotalNewsList(NewsVO vo, Model m){
		List<NewsVO> totalNewsList = newsService.getTotalNewsList(vo);
		System.out.println("News List Size : "+totalNewsList.size());
		m.addAttribute("newsTotalList", totalNewsList);
	}
}
