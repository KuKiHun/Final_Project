package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.RealLawyerDAO;
import com.example.domain.RealLawyerVO;

@Service
public class RealLawyerServiceImpl implements RealLawyerService {
    
    @Autowired
    private RealLawyerDAO realLawyerDAO;

    @Override // real_lawyer 테이블 실존 변호사 리스트 01.15 김모세
    public List<RealLawyerVO> realLawyerList() {
        return realLawyerDAO.realLawyerList();
    }

    @Override // 변호사 검색 01.16 김모세
    public List<RealLawyerVO> searchRealLawyer(String searchname, String searchoffice, String searchfield) {
        if (searchname != null || searchoffice != null || searchfield != null) {
            return realLawyerDAO.searchRealLawyer(searchname, searchoffice, searchfield);
        }else {
            return realLawyerDAO.realLawyerList();
        }
    }
    
}
