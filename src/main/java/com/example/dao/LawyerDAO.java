package com.example.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.LawyerVO;
import com.example.domain.UsersVO;

import jakarta.servlet.http.HttpSession;

@Mapper
public interface LawyerDAO {
    //로그인
	public LawyerVO loginLawyer(LawyerVO vo);
	//회원가입
	public void insertLawyer(LawyerVO vo);
    //로그아웃
	void logoutLawyer(HttpSession session);
	// 변호사 정보 출력
    public LawyerVO getLawyer(LawyerVO vo);
	// 변호사 마이페이지
	public UsersVO getLawyer(String lawyer_id);
}
