package com.example.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.CourtsVO;

@Mapper
public interface CourtsDAO {
    
    //법원마커생성 01.10 김모세
    public List<CourtsVO> showCourtsMarker();
    //법원리스트 01.11 김모세
    public List<CourtsVO> courtList();
    //법원 검색 01.12 김모세
    public List<CourtsVO> searchCourt(String option, String name);
    //관리자 법원상세보기 01.27 김모세
    public CourtsVO courtView(CourtsVO vo);
    //관리자 법원정보수정 01.27 김모세
    public int courtUpdate(CourtsVO vo);
    //관리자 법원정보삭제 01.29 김모세
    public void courtDelete(CourtsVO Cvo);
    //관리자 법원정보추가 01.29 김모세
    public void courtInsert(CourtsVO Cvo);
    
}
