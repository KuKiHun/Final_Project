package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.ReportDAO;
import com.example.domain.ReportVO;

@Service
public class ReportServiceImpl implements ReportService {

    @Autowired
    private ReportDAO reportDAO;

    @Override // 신고글 등록 01.23 김모세
    public void insertReport(ReportVO vo){
        reportDAO.insertReport(vo);
    }
    
}
