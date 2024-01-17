package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.LawFieldDAO;
import com.example.domain.LawFieldVO;

@Service
public class LawFieldServiceImpl implements LawFieldService{

    @Autowired
    LawFieldDAO lawFieldDAO;

    @Override
    public List<LawFieldVO> getLawFieldList(LawFieldVO vo) {
        System.out.println("LawFieldServiceImpl >>> " + vo);
        return lawFieldDAO.getLawFieldList(vo);
    }
    
}
