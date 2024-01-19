package com.example.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.BoardDAO;
import com.example.domain.BoardVO;
import com.example.domain.CounselVO;

@Service(value = "board_service")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardDAO board_dao;
	
	//공지사항 목록 조회
	@Override
	public List<BoardVO> selectList() {
		// TODO Auto-generated method stub
		return board_dao.selectList();
	}
	
	//공지사항 목록 조회
	@Override
	public List<BoardVO> selectList_condition(Map map) {
		// TODO Auto-generated method stub
		return board_dao.selectList_condition(map);
	}
	
	//공지사항 1건 가져오기
	@Override
	public BoardVO selectOne(int board_idx) {
		// TODO Auto-generated method stub
		return board_dao.selectOne(board_idx);
	}
	
	//공지사항 전체 게시물 갯수
	@Override
	public int selectRowTotal() {
		// TODO Auto-generated method stub
		return board_dao.selectRowTotal();
	}
	
	//공지사항 검색 조건별 게시물수
	@Override
	public int selectRowTotal_condition(Map map) {
		// TODO Auto-generated method stub
		return board_dao.selectRowTotal_condition(map);
	}

	//지식인 상담 신청
	@Override
	public void insertCounselBoard(BoardVO vo) {
		board_dao.insertCounselBoard(vo);
	}

}
