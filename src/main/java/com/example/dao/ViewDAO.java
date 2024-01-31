package com.example.dao;

import com.example.domain.ViewVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ViewDAO {
    public void insertView(ViewVO vo);
    public Integer getView(ViewVO vo);
}
