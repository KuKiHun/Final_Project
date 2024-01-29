package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.CourtsDAO;
import com.example.domain.CourtsVO;

@Service // Service 역할
public class CourtsServiceImpl implements CourtsService {

    @Autowired //CourtsDAO 자동주입 (의존성주입)
    private CourtsDAO courtsDAO;

    @Override //법원마커생성 01.10 김모세
    public List<CourtsVO> showCourtsMarker() {
        return courtsDAO.showCourtsMarker();
    }
    @Override //법원 리스트 01.11 김모세
    public List<CourtsVO> courtList() {
        return courtsDAO.courtList();
    }

    @Override //법원리스트 01.11 김모세
    public List<CourtsVO> searchCourt(String option, String name) {
        if (option != null || name != null) {
            return courtsDAO.searchCourt(option, name);
        }else {
            return courtsDAO.courtList();
        }
    }

    @Override //관리자 법원상세보기 01.27 김모세
    public CourtsVO courtView(CourtsVO vo) {
        return courtsDAO.courtView(vo);
    }

    @Override //관리자 법원정보수정 01.27 김모세
    public int courtUpdate(CourtsVO vo) {
        return courtsDAO.courtUpdate(vo);
    }
}
