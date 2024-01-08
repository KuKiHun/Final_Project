package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.service.MainService;

@Controller
@RequestMapping("follaw")
public class MainController {
	
	@Autowired
	private MainService mainService;
	
	// [요청] http://127.0.0.1:8080/board/xxxxxxxxxxxxxx
	@RequestMapping("/{step}")
	public String viewPage(@PathVariable String step) {
		return "/follaw/" + step;
	}
	
	// //그냥 이동
	// @RequestMapping("/index")
	// public void follaw() {
		
	// }

}
