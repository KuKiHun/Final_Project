package com.example.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.AdminVO;
import com.example.domain.BoardVO;

@Mapper
public interface AdminDAO {
	
   /*
	* 게시판
	* * * */
	//목록 조회
	public List<AdminVO> notice_selectList();
	public List<AdminVO> notice_selectList_condition(Map map);
	
	//1건 가져오기
	public AdminVO notice_selectOne(int board_idx);
	
	//전체 게시물 갯수
	public int notice_selectRowTotal();
	
	//검색 조건별 게시물수
	public int notice_selectRowTotal_condition(Map map);
	
	//추가
	public int notice_insert(AdminVO vo);
	
	//삭제
	public int notice_delete(int board_idx);
	
	//수정
	public int notice_update(AdminVO vo);

}
