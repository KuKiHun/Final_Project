package com.example.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.MainVO;

@Mapper
public interface MainDAO {
	
	public List<MainVO> getBoardList();
	
	public MainVO getBoard();
}

/* ****************************************
  		BoardDAOImpl 클래스 생성 안함
  			---> 자동으로 Mapper 연동
  		
  		[예전]
  		@Repository
  		class BoardDAOImpl implements BoardDAO {}
 */
