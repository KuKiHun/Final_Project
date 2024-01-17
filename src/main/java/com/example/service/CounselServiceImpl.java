package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.CounselDAO;
import com.example.domain.CounselVO;

@Service
public class CounselServiceImpl implements CounselService{

    @Autowired
    CounselDAO counselDAO;

    @Override
    public void insertCounsel(CounselVO vo) {
        counselDAO.insertCounsel(vo);
    }

    @Override
    public void getCounsel(CounselVO vo) {
        counselDAO.getCounsel(vo);
    }

    @Override
    public void getCounselList(CounselVO vo) {
        counselDAO.getCounselList(vo);
    }
    
}
