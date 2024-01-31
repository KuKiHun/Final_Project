package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.CounselDAO;
import com.example.domain.ChatVO;
import com.example.domain.CounselVO;

@Service
public class CounselServiceImpl implements CounselService{

    @Autowired
    CounselDAO counselDAO;

    //답글 추가
    @Override
    public void insertCounselReply(CounselVO vo) {
        counselDAO.insertCounselReply(vo);
    }

    //답글 리스트
    @Override
    public List<CounselVO> getCounselReplyList(CounselVO Cvo) {
        return counselDAO.getCounselReplyList(Cvo);
    }

    //답글 채택
    @Override
    public void updateIsSelected(CounselVO Cvo) {
        counselDAO.updateIsSelected(Cvo);
    }

    //채택된 답글 가져오기
    @Override
    public CounselVO getCounselReplyIsSelected(CounselVO Cvo2) {
        return counselDAO.getCounselReplyIsSelected(Cvo2);
    }

    //답글 수정
    @Override
    public void updateCounselReply(CounselVO Cvo) {
        counselDAO.updateCounselReply(Cvo);
    }

    //채택 취소
    @Override
    public void cancelSelected(int board_idx) {
        counselDAO.cancelSelected(board_idx);
    }

    //채팅 리스트
    @Override
    public List<ChatVO> getChatCounselList(ChatVO vo) {
        return counselDAO.getChatCounselList(vo);
    }

    //영상채팅 리스트
    @Override
    public List<ChatVO> getVideoCounselList(ChatVO vo) {
        return counselDAO.getVideoCounselList(vo);
    }
}
