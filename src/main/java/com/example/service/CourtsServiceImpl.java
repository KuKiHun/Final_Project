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
    @Override //법원리스트 01.11 김모세
    public List<CourtsVO> courtList() {
        return courtsDAO.courtList();
    }
    
}
