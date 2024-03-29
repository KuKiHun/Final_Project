package com.example.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.ReportVO;

@Mapper
public interface ReportDAO {

    // 신고글 등록 01.23 김모세
    public void insertReport(ReportVO vo);
    // 관리자 신고글 리스트 01.25 김모세
    public List<ReportVO> reportList(ReportVO vo);
    // 관리자 신고글 상세보기 01.26 김모세
    public ReportVO reportView(ReportVO vo);
    // 관리자 신고글 읽음 01.26 김모세
    public int reportRead(ReportVO vo);
    // 관리자 신고보관글 리스트 01.25 김모세
    public List<ReportVO> reportListConfirm(ReportVO vo);
    // 관리자 신고보관글 상세보기 01.26 김모세
    public ReportVO reportViewConfirm(ReportVO vo);
    // 관리자 메인 대시보드 미확인신고 01.26 김모세
    public String dashReport(ReportVO Rvo);
    // 관리자 신고보관글 삭제 01.29 김모세
    public void reportDelete(ReportVO vo);
    
}
