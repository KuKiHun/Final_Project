package com.example.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.BoardVO;

@Mapper
public interface BoardDAO {
	
	public List<BoardVO> selectList();
	
	public BoardVO selectOne(int board_idx);
	
	public int insert(BoardVO vo);
	
}
