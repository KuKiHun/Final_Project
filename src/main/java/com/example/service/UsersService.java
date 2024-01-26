package com.example.service;

import com.example.domain.SnsVO;
import com.example.domain.UsersVO;

import jakarta.servlet.http.HttpSession;

public interface UsersService {
	//로그인
	public UsersVO login(UsersVO vo);
	//회원가입
	public void insertMember(UsersVO vo);
	public void insertSnsMember(SnsVO svo);

	// SNS 회원 정보와 기존 회원 정보를 조인하여 UsersVO 정보를 조회
	public UsersVO kakaoLogin(String user_id);

	//마이페이지
	UsersVO getUserInfo(String user_id);
	//마이페이지 수정
	public void updateUserInfo(UsersVO vo);
	//마이페이지 비밀번호 수정
	public void updateUserPassword(UsersVO vo);
	//boolean updatePassword(String user_id, String user_pw, String new_user_pw);
	// public String pwCheck(String user_id)throws Exception;
	
	// public void pwUpdate(String user_id, String hashedPw)throws Exception;
	//로그아웃
	void logout(HttpSession session);




	UsersVO getUserInfoBySnsLogin(String snsLoginSite, String userId);
	//회원 탈퇴
	public void deleteMember(String id);


	
	public UsersVO getMemberById(String user_id);
    

	
}