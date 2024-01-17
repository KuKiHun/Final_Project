package com.example.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.LawFieldVO;

@Mapper
public interface LawFieldDAO {
    public List<LawFieldVO> getLawFieldList(LawFieldVO vo);
}
