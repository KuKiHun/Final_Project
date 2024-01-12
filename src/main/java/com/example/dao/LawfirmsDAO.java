package com.example.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.LawfirmsVO;

@Mapper
public interface LawfirmsDAO {
    
    //법률사무소마커생성 01.11 김모세
    public List<LawfirmsVO> showLOMarker ();
}
