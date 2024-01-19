package com.example.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.AdminBoardDAO;
import com.example.domain.AdminVO;

//@Service(value = "admin_service")
@Service
public class AdminBoardServiceImpl implements AdminBoardService {
	
	@Autowired
	AdminBoardDAO admin_dao;
	
	//공지사항 목록 조회
	@Override
	public List<AdminVO> notice_selectList() {
		// TODO Auto-generated method stub
		return admin_dao.notice_selectList();
	}
	
	//공지사항 목록 조회
	@Override
	public List<AdminVO> notice_selectList_condition(Map map) {
		// TODO Auto-generated method stub
		return admin_dao.notice_selectList_condition(map);
	}
	
	//공지사항 1건 가져오기
	@Override
	public AdminVO notice_selectOne(Integer board_idx) {
		// TODO Auto-generated method stub
		return admin_dao.notice_selectOne(board_idx);
	}
	
	//공지사항 전체 게시물 갯수
	@Override
	public int notice_selectRowTotal() {
		// TODO Auto-generated method stub
		return admin_dao.notice_selectRowTotal();
	}
	
	//공지사항 추가
	@Override
	public int notice_insert(AdminVO vo) {
		// TODO Auto-generated method stub
		return admin_dao.notice_insert(vo);
	}
	
	//공지사항 삭제
	@Override
	public int notice_delete(Integer board_idx) {
		// TODO Auto-generated method stub
		return admin_dao.notice_delete(board_idx);
	}
	
	//공지사항 수정
	@Override
	public int notice_update(AdminVO vo) {
		// TODO Auto-generated method stub
		return admin_dao.notice_update(vo);
	}

}
