package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.domain.PaymentVO;
import com.example.service.LawyerService;

@Controller
@RequestMapping("admin/sales")
public class AdminPayContorller {

    @Autowired
    LawyerService lawyerService;

    @RequestMapping("/{step}")
    public String viewPage(@PathVariable String step) {
        return "admin/sales/" + step;
    }

    //관리자 신고목록 리스트 01.25 김모세
    @RequestMapping("sales_detail")
    public String salesList(PaymentVO vo, Model model) {
        List<PaymentVO> salesList = lawyerService.salesList(vo);
        model.addAttribute("salesList", salesList);
        return "admin/sales/sales_detail";
    }
    
}
