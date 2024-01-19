package com.example.dao;

import com.example.domain.NewsVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface NewsDAO {
    public List<NewsVO> getTotalNewsList();
    public List<NewsVO> getTodayNewsList(NewsVO vo);
    public List<NewsVO> getTotalNewsListPaging(Integer page);
    public int getPagingSize();
}
