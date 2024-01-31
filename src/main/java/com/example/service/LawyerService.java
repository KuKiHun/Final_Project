package com.example.service;

import java.util.List;

import com.example.domain.LawyerVO;
import com.example.domain.PaymentVO;
import com.example.domain.SnsLawyerVO;

import jakarta.servlet.http.HttpSession;

public interface LawyerService {
	//로그인
	public LawyerVO loginLawyer(LawyerVO vo);
	//카카오 로그인
	public LawyerVO kakaoLawyerLogin(String lawyer_id);
	//회원가입
	public void insertLawyer(LawyerVO vo);
	public void insertSnsLawyer(SnsLawyerVO slvo);
	//로그아웃
	void logoutLawyer(HttpSession session);
	// + 마이페이지 정보 불러오기 01.22 김모세
    public LawyerVO getLawyer(LawyerVO vo);
    // //회원 탈퇴
	// public void deleteMember(String id);


	//변호사 마이페이지 개인정보수정 01.22 김모세
	public int lawyerUpdate(LawyerVO vo);
	//변호사 마이페이지 비밀번호변경진입 01.23 김모세
	public String lawyerPassConfirm(LawyerVO vo);
	//변호사 마이페이지 새비밀번호 수정 01.22 김모세
	public int lawyerNewPassUpdate(LawyerVO vo);
	//변호사 멤버십 결제 01.24 김모세
	public void insertMembership(LawyerVO vo);
	//변호사 결제내역 추가 01.24 김모세
	public void insertPayment(LawyerVO vo);
	//변호사 결제내역 불러오기 01.24 김모세
	public List<PaymentVO> paymentDetail(PaymentVO vo);
	//관리자 결제내역 불러오기 01.25 김모세
	public List<PaymentVO> salesList(PaymentVO vo);
	//관리자 메인 대시보드 금주매출 01.26 김모세
	public String dashSales(PaymentVO Pvo);
	//관리자 변호사 회원정보 표시
	public List<LawyerVO> lawyerList();
}
