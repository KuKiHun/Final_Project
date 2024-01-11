package com.example.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.AdminDAO;
import com.example.domain.AdminVO;
import com.example.domain.BoardVO;

@Service(value = "admin_service")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	AdminDAO admin_dao;

	@Override
	public List<AdminVO> notice_selectList() {
		// TODO Auto-generated method stub
		return admin_dao.notice_selectList();
	}

	@Override
	public List<AdminVO> notice_selectList_condition(Map map) {
		// TODO Auto-generated method stub
		return admin_dao.notice_selectList_condition(map);
	}

	@Override
	public AdminVO notice_selectOne(int board_idx) {
		// TODO Auto-generated method stub
		return admin_dao.notice_selectOne(board_idx);
	}

	@Override
	public int notice_selectRowTotal() {
		// TODO Auto-generated method stub
		return admin_dao.notice_selectRowTotal();
	}

	@Override
	public int notice_selectRowTotal_condition(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int notice_insert(AdminVO vo) {
		// TODO Auto-generated method stub
		return admin_dao.notice_insert(vo);
	}

	@Override
	public int notice_delete(int board_idx) {
		// TODO Auto-generated method stub
		return admin_dao.notice_delete(board_idx);
	}

	@Override
	public int notice_update(AdminVO vo) {
		// TODO Auto-generated method stub
		return admin_dao.notice_update(vo);
	}

}
