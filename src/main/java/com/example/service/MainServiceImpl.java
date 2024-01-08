package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.MainDAO;

@Service
public class MainServiceImpl implements MainService{

    @Autowired
    private MainDAO mainDAO;
    
//     @Override
//     public List<MainVO> getBoardList() {
//         return mainDAO.getBoardList();
// //        List<BoardVO> list = boardDAO.getBoardList();
// //        return list;
//     }
//     public MainVO getBoard() {
//     	return mainDAO.getBoard();
//     }
}