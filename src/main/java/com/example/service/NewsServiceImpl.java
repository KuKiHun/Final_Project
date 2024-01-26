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
    public List<NewsVO> getTotalNewsListPaging(Integer page) {
        return newsDAO.getTotalNewsListPaging(page);
    }

    @Override
    public List<NewsVO> getTotalNewsList() {
        return newsDAO.getTotalNewsList();
    }

    @Override
    public int getPagingSize() {
        return newsDAO.getPagingSize();
    }

    @Override
    public void deleteNews(NewsVO vo) {
        newsDAO.deleteNews(vo);
    }

    @Override
    public void modifyNews(NewsVO vo) {
        newsDAO.modifyNews(vo);
    }
}
