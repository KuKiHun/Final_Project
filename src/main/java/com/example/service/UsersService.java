package com.example.service;
import java.util.List;

//import org.elasticsearch.common.collect.List;

import com.example.domain.SnsVO;
import com.example.domain.UsersVO;

import jakarta.servlet.http.HttpSession;

public interface UsersService {
	//로그인
	public UsersVO login(UsersVO vo);
	//로그아웃
	void logout(HttpSession session);
	//회원가입
	public void insertMember(UsersVO vo);
	public void insertSnsMember(SnsVO svo);
	//아이디중복확인
	public UsersVO getUser(UsersVO vo);
	// 카카오 회원 정보와 기존 회원 정보를 조인하여 UsersVO 정보를 조회
	public UsersVO kakaoLogin(String user_id);
	// 네이버 회원 정보와 기존 회원 정보를 조인하여 UsersVO 정보를 조회
	public UsersVO naverLogin(String user_id);
	//비밀번호 찾기 페이지로 진입
	public void passCheck(UsersVO vo);
	//비밀번호 찾기
	public UsersVO passCheckConfirm(UsersVO vo);
	//마이페이지
	UsersVO getUserInfo(String user_id);
	//마이페이지 수정
	public void updateUserInfo(UsersVO vo);
	//일반 마이페이지 비밀번호변경진입
	public String userPassConfirm(UsersVO vo);
	//일반 마이페이지 새비밀번호 수정
	public int userNewPassUpdate(UsersVO vo);
	//관리자 일반회원정보
	public List<UsersVO> userList();
	//관리자 일반회원상세정보
	public UsersVO userDetail(String user_id);

	//이름 + 아이디 권한 가져오기 (채팅)
	public UsersVO getMemberById(String user_id);
	
	
    

	
}