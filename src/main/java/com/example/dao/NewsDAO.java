package com.example.dao;

import com.example.domain.NewsVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface NewsDAO {
    public List<NewsVO> getTotalNewsList(NewsVO vo);
    public List<NewsVO> getTodayNewsList(NewsVO vo);
    List<NewsVO> getTotalNewsListPaging(Integer page);
}
