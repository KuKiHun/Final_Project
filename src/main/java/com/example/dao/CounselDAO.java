package com.example.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.CounselVO;

@Mapper
public interface CounselDAO {
    public void insertCounsel(CounselVO vo);

    public void getCounsel(CounselVO vo);
    
    public void getCounselList(CounselVO vo);
}
