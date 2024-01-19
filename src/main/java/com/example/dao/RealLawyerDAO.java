package com.example.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.RealLawyerVO;

@Mapper
public interface RealLawyerDAO {

    // real_lawyer 테이블 실존 변호사 리스트 01.15 김모세
    public List<RealLawyerVO> realLawyerList();

    // 변호사 검색 01.16 김모세
    public List<RealLawyerVO> searchRealLawyer(String searchname, String searchoffice, String searchfield);
    
}
