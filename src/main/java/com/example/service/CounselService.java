package com.example.service;


import java.util.List;
import com.example.domain.CounselVO;

public interface CounselService {
    public void insertCounselReply(CounselVO vo);

    public List<CounselVO> getCounselReplyList(CounselVO Cvo);

    public void updateIsSelected(CounselVO Cvo);
}
