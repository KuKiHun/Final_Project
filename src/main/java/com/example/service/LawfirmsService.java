package com.example.service;

import java.util.List;

import com.example.domain.LawfirmsVO;

public interface LawfirmsService {
    //법률사무소마커생성 01.11 김모세
    public List<LawfirmsVO> showLOMarker();

    //법률사무소리스트 01.13 김모세
    public List<LawfirmsVO> lawfirmList();

    //법률사무소검색 01.13 김모세
    public List<LawfirmsVO> searchLawfirm(String option, String name);
    
}
