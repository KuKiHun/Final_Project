package com.example.service;


import java.util.List;

import com.example.domain.ChatVO;
import com.example.domain.CounselVO;

public interface CounselService {
    //답글 추가
    public void insertCounselReply(CounselVO vo);

    //답글 리스트
    public List<CounselVO> getCounselReplyList(CounselVO Cvo);

    //답글 채택
    public void updateIsSelected(CounselVO Cvo);
    
    //채택된 답글 가져오기
    public CounselVO getCounselReplyIsSelected(CounselVO Cvo2);

    //답글 수정
    public void updateCounselReply(CounselVO Cvo);

    //채택 취소
    public void cancelSelected(int board_idx);

    //채팅리스트
    public List<ChatVO> getChatCounselList(ChatVO vo);

    //영상채팅 리스트
    public List<ChatVO> getVideoCounselList(ChatVO vo);
}
