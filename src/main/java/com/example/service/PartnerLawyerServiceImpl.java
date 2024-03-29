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

    @Override // 파워 파트너 변호사 검색 01.20 김모세
    public List<PartnerLawyerVO> searchPartnerLawyer(String searchname, String searchoffice, String searchfield) {
        if (searchname != null || searchoffice != null || searchfield != null) {
            return partnerLawyerDAO.searchPartnerLawyer(searchname, searchoffice, searchfield);
        }else {
            return partnerLawyerDAO.partnerLawyerList();
        }
    }
    @Override
    public List<PartnerLawyerVO> searchPowerLawyer(String searchname, String searchoffice, String searchfield) {
        if (searchname != null || searchoffice != null || searchfield != null) {
            return partnerLawyerDAO.searchPowerLawyer(searchname, searchoffice, searchfield);
        }else {
            return partnerLawyerDAO.powerLawyerList();
        }
    }
}
