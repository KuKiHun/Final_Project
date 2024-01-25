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
    
}
