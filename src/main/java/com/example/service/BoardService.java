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

	//지식인 상담 리스트 불러오기
	public List<BoardVO> getCounselBoardListPaging(Integer page);

	public List<BoardVO> getCounselCateBoardListPaging(Map map);

	public List<BoardVO> getCounselBoardList(BoardVO vo);

	//지식인 상담 리스트 페이징
	public int getPagingSize();

	public int getPagingSizeCate();

	//지식인 상담 글 상세보기
	public BoardVO getCounselBoard(int board_idx);

	//채택여부
	public void updateIsSelected(BoardVO vo);

	//글 수정하기
	public void updateCounselContent(BoardVO vo);

	//채택 취소
	public void cancelSelected(int board_idx);

	// 이번주 지식인 통계
    public List<Map<String, String>> getCounselStaticsInThisWeek();
}
