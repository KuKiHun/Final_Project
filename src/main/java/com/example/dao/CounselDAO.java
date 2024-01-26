package com.example.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.CounselVO;

@Mapper
public interface CounselDAO {
    //답글 추가
    public void insertCounselReply(CounselVO vo);
    
    //답글 리스트
    public List<CounselVO> getCounselReplyList(CounselVO vo);

    //답글 채택
    public void updateIsSelected(CounselVO Cvo);

    //채택된 답글 가져오기
    public CounselVO getCounselReplyIsSelected(CounselVO Cvo2);

    //답글 수정
    public void updateCounselReply(CounselVO Cvo);

    //채택 취소
    public void cancelSelected(int board_idx);
}
