package com.example.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.CounselVO;

@Mapper
public interface CounselDAO {
    public void insertCounselReply(CounselVO vo);
    
    public List<CounselVO> getCounselReplyList(CounselVO vo);

    public void updateIsSelected(CounselVO Cvo);
}
