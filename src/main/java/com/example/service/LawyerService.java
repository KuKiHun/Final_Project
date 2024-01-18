package com.example.service;

import com.example.domain.LawyerVO;

import jakarta.servlet.http.HttpSession;

public interface LawyerService {
	//로그인
	public LawyerVO loginLawyer(LawyerVO vo);
	//회원가입
	public void insertLawyer(LawyerVO vo);
	//로그아웃
	void logoutLawyer(HttpSession session);

    public LawyerVO getLawyer(LawyerVO vo);
    // //회원 탈퇴
	// public void deleteMember(String id);
	// //글수정
	// public void updateMember(UsersVO vo);
	// //마이페이지
	// public UsersVO getMemberById(String user_id);
	
}
