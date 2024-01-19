package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.CounselDAO;
import com.example.domain.CounselVO;

@Service
public class CounselServiceImpl implements CounselService{

    @Autowired
    CounselDAO counselDAO;

    @Override
    public void insertCounselReply(CounselVO vo) {
        counselDAO.insertCounselReply(vo);
    }

    @Override
    public List<CounselVO> getCounselReplyList(CounselVO Cvo) {
        return counselDAO.getCounselReplyList(Cvo);
    }

    @Override
    public void updateIsSelected(CounselVO Cvo) {
        counselDAO.updateIsSelected(Cvo);
    }

    @Override
    public CounselVO getCounselReplyIsSelected(CounselVO Cvo2) {
        return counselDAO.getCounselReplyIsSelected(Cvo2);
    }

    
}
