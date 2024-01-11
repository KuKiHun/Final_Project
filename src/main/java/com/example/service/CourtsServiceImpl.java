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

    @Override
    public List<CourtsVO> showCourtsMarker() {
        return courtsDAO.showCourtsMarker();
    }
    
}
