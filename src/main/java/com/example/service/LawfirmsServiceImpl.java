package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.LawfirmsDAO;
import com.example.domain.LawfirmsVO;

@Service // Service 역할
public class LawfirmsServiceImpl implements LawfirmsService {

    @Autowired //LawfirmsDAO 자동주입 (의존성주입)
    private LawfirmsDAO lawfirmsDAO;

    @Override //법률사무소마커생성 01.11 김모세
    public List<LawfirmsVO> showLOMarker() {
        return lawfirmsDAO.showLOMarker();
    }

    @Override //법률사무소리스트 01.13 김모세
    public List<LawfirmsVO> lawfirmList() {
        return lawfirmsDAO.lawfirmList();
    }

    @Override //법률사무소검색 01.13 김모세
    public List<LawfirmsVO> searchLawfirm(String option, String name) {
        if (option != null || name != null) {
            return lawfirmsDAO.searchLawfirm(option, name);
        }else {
            return lawfirmsDAO.lawfirmList();
        }
    }

    @Override //변호사 회원가입 법률사무소리스트 불러오기 01.18 김모세
    public List<LawfirmsVO> signupLawfirm() {
        return lawfirmsDAO.signupLawfirm();
    }
    @Override //관리자 법률사무소 상세보기 01.27 김모세
    public LawfirmsVO lawfirmView(LawfirmsVO vo) {
        return lawfirmsDAO.lawfirmView(vo);
    }
    @Override //관리자 법률사무소정보 수정 01.27 김모세
    public int lawfirmUpdate(LawfirmsVO vo) {
        return lawfirmsDAO.lawfirmUpdate(vo);
    }
    @Override //관리자 법률사무소 추가 01.27 김모세
    public void lawfirmInsert(LawfirmsVO vo) {
        lawfirmsDAO.lawfirmInsert(vo);
    }
}
