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
    //관리자 신고글 상세보기 01.26 김모세
    @RequestMapping("report_view")
    public String reportView(ReportVO vo, Model model) {
        ReportVO report = reportService.reportView(vo);
        model.addAttribute("report", report);
        return "admin/report/report_view";
    }
    //관리자 신고글 읽음처리 01.26 김모세
    @RequestMapping("report_view-read")
    public String reportRead(ReportVO vo) {
        reportService.reportRead(vo);
        return "redirect:report_list";
    }
    //관리자 신고보관글 리스트 01.25 김모세
    @RequestMapping("report_list_confirm")
    public String reportListConfirm(ReportVO vo, Model model) {
        List<ReportVO> reportList = reportService.reportListConfirm(vo);
        model.addAttribute("reportList", reportList);
        return "admin/report/report_list_confirm";
    }
    //관리자 신고보관글 상세보기 01.26 김모세
    @RequestMapping("report_view_confirm")
    public String reportViewConfirm(ReportVO vo, Model model) {
        ReportVO report = reportService.reportViewConfirm(vo);
        model.addAttribute("report", report);
        return "admin/report/report_view_confirm";
    }
    //관리자 신고보관글 삭제 01.29 김모세
    @RequestMapping("report_delete")
    public String reportDelete(ReportVO vo) {
        reportService.reportDelete(vo);
        return "redirect:report_list_confirm";
    }

    
}
