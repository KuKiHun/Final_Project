package com.example.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.PartnerLawyerVO;

@Mapper
public interface PartnerLawyerDAO {

    // 파트너변호사 리스트 01.18 김모세
    public List<PartnerLawyerVO> partnerLawyerList();

    // 파워변호사 리스트 01.18 김모세
    public List<PartnerLawyerVO> powerLawyerList();
    
}
