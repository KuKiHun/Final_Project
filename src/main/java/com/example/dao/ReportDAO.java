package com.example.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.ReportVO;

@Mapper
public interface ReportDAO {

    // 신고글 등록 01.23 김모세
    public void insertReport(ReportVO vo);
    
}
