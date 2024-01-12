package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.BoardDAO;
import com.example.domain.BoardVO;

@Service(value = "board_service")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardDAO board_dao;

	@Override
	public List<BoardVO> selectList() {
		// TODO Auto-generated method stub
		return board_dao.selectList();
	}

	@Override
	public BoardVO selectOne(int board_idx) {
		// TODO Auto-generated method stub
		return board_dao.selectOne(board_idx);
	}

	@Override
	public int insert(BoardVO vo) {
		// TODO Auto-generated method stub
		return board_dao.insert(vo);
	}

}
