package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.domain.ReportVO;
import com.example.service.ReportService;

@Controller
@RequestMapping("admin")
public class AdminDashBoardController {

    @Autowired
    ReportService reportService;

    @RequestMapping("/{step}")
    public String viewPage(@PathVariable String step) {
        return "admin/" + step;
    }

    @RequestMapping("main_dashboard")
    public void mainDashboard(ReportVO vo, Model model){

        // 관리자 메인 대시보드 미확인신고 01.26 김모세
        String reportCnt = reportService.dashReport(vo);
        model.addAttribute("reportCnt", reportCnt);


    }
}
