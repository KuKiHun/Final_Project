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
    public List<LawsVO> getLawsByAct(LawsVO vo) {
        System.out.println("LawsServiceImpl >> getLawsByAct : "+vo.getLaws_act());
        List<LawsVO> lawsByAct = lawsDAO.getLawsByAct(vo);
//        System.out.println("LawsServiceImpl >> getLawsByAct / result : "+lawsByAct);
        return lawsByAct;
    }

    @Override
    public List<String> getLawsSort() {
        return lawsDAO.getLawsSort();
    }

}
