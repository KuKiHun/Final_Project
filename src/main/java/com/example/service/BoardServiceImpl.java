package com.example.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.BoardDAO;
import com.example.domain.BoardVO;

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

	//지식인 상담 리스트 불러오기
	@Override
	public List<BoardVO> getCounselBoardListPaging(Integer page) {
		return board_dao.getCounselBoardListPaging(page);
	}

	@Override
	public List<BoardVO> getCounselCateBoardListPaging(Map map) {
		return board_dao.getCounselCateBoardListPaging(map);
	}

	@Override
	public List<BoardVO> getCounselBoardList(BoardVO vo) {
		return board_dao.getCounselBoardList(vo);
	}

	//지식인 상담 글 상세보기
	@Override
	public BoardVO getCounselBoard(int board_idx) {
		return board_dao.getCounselBoard(board_idx);
	}

	//채택 여부
	@Override
	public void updateIsSelected(BoardVO vo) {
		board_dao.updateIsSelected(vo);
	}

	//글 수정하기
	@Override
	public void updateCounselContent(BoardVO vo) {
		board_dao.updateCounselContent(vo);
	}

	//채택 취소
	@Override
	public void cancelSelected(int board_idx) {
		board_dao.cancelSelected(board_idx);
	}

	@Override
	public int getPagingSize() {
		return board_dao.getPagingSize();
	}

	@Override
	public int getPagingSizeCate() {
		return board_dao.getPagingSizeCate();
	}

	// 이번주 지식인 통계
	@Override
	public List<Map<String, String>> getCounselStaticsInThisWeek() {
		return board_dao.getCounselStaticsInThisWeek();
	}
	// 사용자 내가쓴 게시물 조회 02.01 김모세
	@Override
	public List<BoardVO> userPost(BoardVO vo) {
		return board_dao.userPost(vo);
	}

}
