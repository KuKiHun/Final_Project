package com.example.service;

import com.example.dao.NewsDAO;
import com.example.domain.NewsVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NewsServiceImpl implements NewsService {
    @Autowired
    NewsDAO newsDAO;
    @Override
    public List<NewsVO> getTodayNewsList(NewsVO vo) {
        return newsDAO.getTodayNewsList(vo);
    }

    @Override
    public List<NewsVO> getTotalNewsList(NewsVO vo) {
        return newsDAO.getTotalNewsList(vo);
    }
}
