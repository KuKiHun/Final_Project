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
    @Override // 관리자 신고글 상세보기 01.26 김모세
    public ReportVO reportView(ReportVO vo){
        return reportDAO.reportView(vo);
    }
    @Override // 관리자 신고글 읽음 01.26 김모세
    public int reportRead(ReportVO vo){
        return reportDAO.reportRead(vo);
    }
    @Override // 관리자 신고보관글 리스트 01.25 김모세
    public List<ReportVO> reportListConfirm(ReportVO vo){
        return reportDAO.reportListConfirm(vo);
    }
    @Override // 관리자 신고보관글 상세보기 01.26 김모세
    public ReportVO reportViewConfirm(ReportVO vo){
        return reportDAO.reportViewConfirm(vo);
    }
    @Override // 관리자 메인 대시보드 미확인신고 01.26 김모세
    public String dashReport(ReportVO vo){
        return reportDAO.dashReport(vo);
    }
    
}
