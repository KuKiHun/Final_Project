package com.example.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.LawyerVO;
import com.example.domain.PaymentVO;

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
	//변호사 마이페이지 개인정보수정 01.22 김모세
	public int lawyerUpdate(LawyerVO vo);
	// 변호사 마이페이지 비밀번호 변경 진입 01.23 김모세
	public String lawyerPassConfirm(LawyerVO vo);
	//변호사 마이페이지 새비밀번호 수정 01.22 김모세
	public int lawyerNewPassUpdate(LawyerVO vo);
	//변호사 멤버십 결제 01.24 김모세
	public void insertMembership(LawyerVO vo);
	//변호사 멤버십 결제내역 추가 01.24 김모세
	public void insertPayment(LawyerVO vo);
	//변호사 결제내역 불러오기
	public List<PaymentVO> paymentDetail(PaymentVO vo);
}
