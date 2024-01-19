package com.example.service;

import com.example.domain.NewsVO;
import org.springframework.stereotype.Service;

import java.util.List;

public interface NewsService {
    public List<NewsVO> getTodayNewsList(NewsVO vo);
    public List<NewsVO> getTotalNewsList(NewsVO vo);
    List<NewsVO> getTotalNewsListPaging(Integer page);
}
