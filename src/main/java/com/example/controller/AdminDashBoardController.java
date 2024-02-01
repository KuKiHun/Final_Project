package com.example.controller;

import com.example.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.domain.PaymentVO;
import com.example.domain.ReportVO;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("admin")
public class AdminDashBoardController {

    @Autowired
    ReportService reportService;

    @Autowired
    LawyerService lawyerService;

    @Autowired
    PaymentService paymentService;

    @Autowired
    UsersService usersService;

    @Autowired
    BoardService boardService;

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

        // 관리자 메인 대시보드 오늘 등록된 지식인 게시글 수
        int counselSum = boardService.getCounselSum();


        model.addAttribute("salesSum", salesSum);    // 금주매출
        model.addAttribute("reportCnt", reportCnt);  // 미확인신고
        model.addAttribute("counselSum", counselSum); //오늘 등록된 지식인 게시글 수
    }

    // 관리자 메인 대시보드 매출 통계 01.29 박규휘
    @RequestMapping("payment_statics")
    @ResponseBody
    public List<Map<String, Integer>> getPayemntStatics(){
        List<Map<String, Integer>> dashboardData = paymentService.getDashboardData();
        return dashboardData;
    }

    // 관리자 메인 대시보드 지식인 통계 01.29 박규휘
    @RequestMapping("counsel_statics")
    @ResponseBody
    public List<Map<String, String>> getCounselStaticsInThisWeek(){
        return boardService.getCounselStaticsInThisWeek();
    } 
}
