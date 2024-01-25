package com.example.service;

import java.util.List;

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
    @Override // 관리자 신고글 리스트 01.25 김모세
    public List<ReportVO> reportList(ReportVO vo){
        return reportDAO.reportList(vo);
    }
    
}
