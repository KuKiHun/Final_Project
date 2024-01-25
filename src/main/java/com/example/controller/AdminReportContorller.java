package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.domain.ReportVO;
import com.example.service.ReportService;

@Controller
@RequestMapping("admin/report")
public class AdminReportContorller {

    @Autowired
    ReportService reportService;

    @RequestMapping("/{step}")
    public String viewPage(@PathVariable String step) {
        return "admin/report/" + step;
    }

    //관리자 신고목록 리스트 01.25 김모세
    @RequestMapping("report_list")
    public String reportList(ReportVO vo, Model model) {
        List<ReportVO> reportList = reportService.reportList(vo);
        model.addAttribute("reportList", reportList);
        return "admin/report/report_list";
    }
    
}
