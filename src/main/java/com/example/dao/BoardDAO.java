package com.example.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.BoardVO;
import com.example.domain.CounselVO;

@Mapper
public interface BoardDAO {
	
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
	
	//조회수
	public int update_readhit(int board_idx);
	
	List<BoardVO> selectList(int count);

	//지식인 상담 신청
	public void insertCounselBoard(BoardVO vo);

	//지식인 상담 리스트 불러오기
	public List<BoardVO> getCounselBoardList(BoardVO vo);

	//지식인 상담 글 상세보기
	public BoardVO getCounselBoard(int board_idx);

	//채택 여부
	public void updateIsSelected(BoardVO vo);
	
}
