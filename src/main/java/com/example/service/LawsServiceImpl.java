package com.example.service;

import com.example.dao.LawsDAO;
import com.example.domain.LawsVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LawsServiceImpl implements LawsService {
    @Autowired
    LawsDAO lawsDAO;
    @Override
    public List<LawsVO> getLaws(LawsVO vo) {
        return lawsDAO.getLaws(vo);
    }

    @Override
    public List<String> getLawsSort() {
        return lawsDAO.getLawsSort();
    }

}
