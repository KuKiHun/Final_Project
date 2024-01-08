package com.example.service;

import com.example.domain.MemberVO;

public interface MemberService {
	//로그인
	public MemberVO login(MemberVO vo);
	//회원가입
	public void insertMember(MemberVO vo);
	//회원 탈퇴
	public void deleteMember(String id);
	//글수정
	public void updateMember(MemberVO vo);
	
}
