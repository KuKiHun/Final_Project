package com.example.service;

import java.util.List;
import java.util.Map;

import com.example.domain.BoardVO;
import com.example.domain.CounselVO;

public interface BoardService {
	
	//공지사항 목록 조회
	public List<BoardVO> selectList();
	public List<BoardVO> selectList_condition(Map map);
	
	//공지사항 1건 가져오기
	public BoardVO selectOne(int board_idx);
	
	//공지사항 전체 게시물 갯수
	public int selectRowTotal();
	
	//공지사항 검색 조건별 게시물수
	public int selectRowTotal_condition(Map map);

	//지식인 상담 신청
	public void insertCounselBoard(BoardVO vo);
}
