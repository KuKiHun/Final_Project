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

	@Override
	public List<BoardVO> selectList_condition(Map map) {
		// TODO Auto-generated method stub
		return board_dao.selectList_condition(map);
	}

	@Override
	public int selectRowTotal() {
		// TODO Auto-generated method stub
		return board_dao.selectRowTotal();
	}

	@Override
	public int selectRowTotal_condition(Map map) {
		// TODO Auto-generated method stub
		return board_dao.selectRowTotal_condition(map);
	}

	@Override
	public int delete(int board_idx) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(BoardVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update_readhit(int board_idx) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<BoardVO> selectList(int count) {
		// TODO Auto-generated method stub
		return null;
	}

	//지식인 상담 신청
	@Override
	public void insertCounselBoard(BoardVO vo) {
		board_dao.insertCounselBoard(vo);
	}

	//지식인 상담 리스트 불러오기
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

}
