package com.example.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.AdminDAO;
import com.example.domain.AdminVO;
import com.example.domain.BoardVO;

//@Service(value = "admin_service")
@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	AdminDAO adminDao;

	@Override
	public List<AdminVO> notice_selectList() {
		// TODO Auto-generated method stub
		return adminDao.notice_selectList();
	}

	@Override
	public List<AdminVO> notice_selectList_condition(Map map) {
		// TODO Auto-generated method stub
		return adminDao.notice_selectList_condition(map);
	}

	@Override
	public AdminVO notice_selectOne(Integer board_idx) {
		// TODO Auto-generated method stub
		return adminDao.notice_selectOne(board_idx);
	}

	@Override
	public int notice_selectRowTotal() {
		// TODO Auto-generated method stub
		return adminDao.notice_selectRowTotal();
	}

	@Override
	public int notice_selectRowTotal_condition(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int notice_insert(AdminVO vo) {
		// TODO Auto-generated method stub
		return adminDao.notice_insert(vo);
	}

	@Override
	public int notice_delete(Integer board_idx) {
		// TODO Auto-generated method stub
		return adminDao.notice_delete(board_idx);
	}

	@Override
	public int notice_update(AdminVO vo) {
		// TODO Auto-generated method stub
		return adminDao.notice_update(vo);
	}

}
