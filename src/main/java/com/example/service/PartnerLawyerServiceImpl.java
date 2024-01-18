package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.PartnerLawyerDAO;
import com.example.domain.PartnerLawyerVO;

@Service
public class PartnerLawyerServiceImpl implements PartnerLawyerService {
    
    @Autowired
    private PartnerLawyerDAO partnerLawyerDAO;

    @Override // 파트너 변호사 리스트 조회 01.18 김모세
    public List<PartnerLawyerVO> partnerLawyerList() {
        return partnerLawyerDAO.partnerLawyerList();
    }

    @Override // 파워 변호사 리스트 조회 01.18 김모세
    public List<PartnerLawyerVO> powerLawyerList() {
        return partnerLawyerDAO.powerLawyerList();
    }
}
