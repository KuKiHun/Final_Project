package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.domain.PaymentVO;
import com.example.domain.ReportVO;
import com.example.service.LawyerService;
import com.example.service.ReportService;

@Controller
@RequestMapping("admin")
public class AdminDashBoardController {

    @Autowired
    ReportService reportService;

    @Autowired
    LawyerService lawyerService;

    @RequestMapping("/{step}")
    public String viewPage(@PathVariable String step) {
        return "admin/" + step;
    }

    @RequestMapping("main_dashboard")
    public void mainDashboard(PaymentVO Pvo,ReportVO Rvo, Model model){

        // 관리자 메인 대시보드 금주매출 01.26 김모세
        String salesSum = lawyerService.dashSales(Pvo);
        // 관리자 메인 대시보드 미확인신고 01.26 김모세
        String reportCnt = reportService.dashReport(Rvo);

        model.addAttribute("salesSum", salesSum);    // 금주매출
        model.addAttribute("reportCnt", reportCnt);  // 미확인신고
    }
}
