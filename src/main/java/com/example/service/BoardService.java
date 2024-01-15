package com.example.service;

import java.util.List;
import java.util.Map;

import com.example.domain.BoardVO;

public interface BoardService {
	
	//목록 조회
	public List<BoardVO> selectList();
	public List<BoardVO> selectList_condition(Map map);
	
	//1건 가져오기
	public BoardVO selectOne(int board_idx);
	
	//전체 게시물 갯수
	public int selectRowTotal();
	
	//검색 조건별 게시물수
	public int selectRowTotal_condition(Map map);
	
	//추가
	public int insert(BoardVO vo);
	
	//삭제
	public int delete(int board_idx);
	
	//수정
	public int update(BoardVO vo);
	
}
