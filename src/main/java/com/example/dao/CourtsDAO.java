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
}
