package com.example.service;

import com.example.domain.MemberVO;

import jakarta.servlet.http.HttpSession;

public interface MemberService {
	//로그인
	public MemberVO login(MemberVO vo);
	//회원가입
	public void insertMember(MemberVO vo);

	// SNS 회원 정보와 기존 회원 정보를 조인하여 MemberVO 정보를 조회
	public MemberVO kakaoLogin(String user_id);

	//
	MemberVO getUserInfoBySnsLogin(String snsLoginSite, String userId);
	//회원 탈퇴
	public void deleteMember(String id);
	//글수정
	public void updateMember(MemberVO vo);
	//로그아웃
	void logout(HttpSession session);
	//마이페이지
	public MemberVO getMemberById(String user_id);
	
}
