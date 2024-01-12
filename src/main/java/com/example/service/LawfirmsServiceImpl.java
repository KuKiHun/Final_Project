package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.LawfirmsDAO;
import com.example.domain.LawfirmsVO;

@Service // Service 역할
public class LawfirmsServiceImpl implements LawfirmsService {

    @Autowired //CourtsDAO 자동주입 (의존성주입)
    private LawfirmsDAO lawfirmsDAO;

    @Override //법률사무소마커생성 01.11 김모세
    public List<LawfirmsVO> showLOMarker() {
        return lawfirmsDAO.showLOMarker();
    }
    
}
