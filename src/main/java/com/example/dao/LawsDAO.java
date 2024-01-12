package com.example.dao;

import com.example.domain.LawsVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface LawsDAO {
    public List<LawsVO> getLawsByAct(LawsVO vo);
    public List<String> getLawsSort();
}
