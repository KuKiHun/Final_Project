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
	 * index 페이지에서 오늘자 뉴스 띄우는 기능
	 * @param m
	 */
	  @RequestMapping("/index")
	  public void follaw(Model m) {
	 	 NewsVO vo = new NewsVO();
	 	 vo.setNews_date(LocalDate.now());
	 	 List<NewsVO> result = newsService.getTodayNewsList(vo);
//	 	 System.out.println("Today : "+vo.getNews_date()+"News List Size : "+result.size());
	 	 m.addAttribute("newsList", result);
	  }

	@RequestMapping("/case/{number}")
	public String detailCase(@PathVariable String number, Model m){
		m.addAttribute("number", number);
		return "follaw/case";
	}

	/**
	 * 뉴스 페이지에서 뉴스 출력하는 기능
	 * @param
	 * @param m
	 */
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
		m.addAttribute("newsTotalList", result);
		m.addAttribute("pagingList", pagingList);
		return "follaw/news";
	}

	@RequestMapping("/todayNews")
	@ResponseBody
	public List<NewsVO> jsonTodayNews(){
		NewsVO vo = new NewsVO();
		vo.setNews_date(LocalDate.now());
		return newsService.getTodayNewsList(vo);
	}
}
