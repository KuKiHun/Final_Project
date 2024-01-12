package com.example.service;

import java.util.List;

import com.example.domain.BoardVO;

public interface BoardService {
	
	public List<BoardVO> selectList();
	
	public BoardVO selectOne(int board_idx);
	
	public int insert(BoardVO vo);
	
}
