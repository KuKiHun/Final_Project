package com.example.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.MemberVO;

import jakarta.servlet.http.HttpSession;

@Mapper
public interface MemberDAO {
	//로그인
	public MemberVO login (MemberVO vo);
	//회원가입
	public void insertMember(MemberVO vo); 
	//카카오 로그인
	public MemberVO getMemberByKakaoId(String user_Id, String user_name);
	//SNS 로그인
	MemberVO getMemberBySnsLogin(String snsLoginSite, String userId);
	//삭제
	public void deleteMemberById(String id);
	//수정
	public void updateMember(MemberVO vo);
	//로그아웃
	void logout(HttpSession session);
	public MemberVO getMemberById(String user_Id);
    
    public void createMember(MemberVO member);
    default MemberVO getUserInfoBySnsLogin(String snsLoginSite, String userId) {
        return getMemberBySnsLogin(snsLoginSite, userId);
    }


}
