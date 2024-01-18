package com.example.service;

import java.util.List;

import com.example.domain.PartnerLawyerVO;

public interface PartnerLawyerService {

    //파트너 변호사 리스트 01.18 김모세
    public List<PartnerLawyerVO> partnerLawyerList();

    //파워 파트너 변호사 리스트 01.18 김모세
    public List<PartnerLawyerVO> powerLawyerList();
    
}
