package com.example.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.BoardVO;

@Mapper
public interface BoardDAO {
	
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

	//채택 여부
	public void updateIsSelected(BoardVO vo);

	//글 수정하기
	public void updateCounselContent(BoardVO vo);

	//채택 취소
	public void cancelSelected(int board_idx);
	
	// 이번주 지식인 통계
    public List<Map<String, String>> getCounselStaticsInThisWeek();

	// 사용자 내가쓴 게시물 조회 02.01 김모세
	public List<BoardVO> userPost(BoardVO vo);
	//오늘 등록된 지식인 게시글
	public int getCounselSum();
}
