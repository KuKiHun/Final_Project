package com.example.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.UsersVO;

import jakarta.servlet.http.HttpSession;

@Mapper
public interface UsersDAO {
	//로그인
	public UsersVO login (UsersVO vo);
	//회원가입
	public void insertMember(UsersVO vo);

	public void insertSNSLogin(UsersVO vo);
	//카카오 로그인
	public UsersVO kakaoLogin(UsersVO vo);
	//SNS 로그인
	UsersVO getMemberBySnsLogin(String snsLoginSite, String userId);
	//삭제
	public void deleteMemberById(String id);
	//수정
	public void updateMember(UsersVO vo);
	//로그아웃
	void logout(HttpSession session);
	public UsersVO getMemberById(String user_id);
    
    public void createMember(UsersVO member);
    default UsersVO getUserInfoBySnsLogin(String snsLoginSite, String userId) {
        return getMemberBySnsLogin(snsLoginSite, userId);
    }
    public UsersVO getUserByEmail(String email);



}
