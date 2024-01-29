package com.example.dao;

import com.example.domain.SystemVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SystemDAO {
    public SystemVO getSystemValue(SystemVO vo);
}
