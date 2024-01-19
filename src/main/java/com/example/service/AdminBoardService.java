package com.example.service;

import java.util.List;
import java.util.Map;

import com.example.domain.AdminVO;

public interface AdminBoardService {
	
	/*
	* 게시판
	* * * */
	//공지사항 목록 조회
	public List<AdminVO> notice_selectList();
	public List<AdminVO> notice_selectList_condition(Map map);
	
	//공지사항 1건 가져오기
	public AdminVO notice_selectOne(Integer board_idx);
	
	//공지사항 전체 게시물 갯수
	public int notice_selectRowTotal();
	
	//공지사항 추가
	public int notice_insert(AdminVO vo);
	
	//공지사항 삭제
	public int notice_delete(Integer board_idx);
	
	//공지사항 수정
	public int notice_update(AdminVO vo);

}