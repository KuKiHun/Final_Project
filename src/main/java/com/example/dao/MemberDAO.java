package com.example.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.MemberVO;

@Mapper
public interface MemberDAO {
	//로그인
	public MemberVO login (MemberVO vo);
	//회원가입
	public void insertMember(MemberVO vo); 
	//삭제
	public void deleteMemberById(String id);
	//수정
	public void updateMember(MemberVO vo);
	//로그아웃
	
}
