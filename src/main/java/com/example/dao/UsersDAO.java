package com.example.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.UsersVO;

import jakarta.servlet.http.HttpSession;

@Mapper
public interface UsersDAO {
	//로그인
	public UsersVO login (UsersVO vo);
	//로그아웃
	void logout(HttpSession session);
	//회원가입
	public void insertMember(UsersVO vo);
	//카카오 로그인
	public UsersVO kakaoLogin(String user_Id);
	//SNS 로그인
	UsersVO getMemberBySnsLogin(String snsLoginSite, String userId);
	//마이페이지
	UsersVO getUserInfo(String user_id);
	//마이페이지 수정
	public void updateUserInfo(UsersVO vo);
	//마이페이지 비밀번호 수정
	public void updateUserPassword(UsersVO vo);


	//삭제
	public void deleteMemberById(String id);


	public UsersVO getMemberById(String user_Id);
    
    default UsersVO getUserInfoBySnsLogin(String snsLoginSite, String userId) {
        return getMemberBySnsLogin(snsLoginSite, userId);
    }
	


}