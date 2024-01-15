package com.example.service;

import com.example.dao.ViewDAO;
import com.example.domain.ViewVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ViewServiceImpl implements ViewService {
    @Autowired
    ViewDAO viewDAO;

    @Override
    public void insertView(ViewVO vo) {
        viewDAO.insertView(vo);
    }

    @Override
    public Integer getView(ViewVO vo) {
        return viewDAO.getView(vo);
    }
}
