package com.example.service;

import java.util.List;

import com.example.domain.CourtsVO;

public interface CourtsService {
    //법원마커생성 01.10 김모세
    public List<CourtsVO> showCourtsMarker();

    //법원리스트 01.11 김모세
    public List<CourtsVO> courtList();

    //법원검색 01.12 김모세
    public List<CourtsVO> searchCourt(String option, String name);
}
