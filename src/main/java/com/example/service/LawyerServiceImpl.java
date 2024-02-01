package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.LawyerDAO;
import com.example.domain.LawyerVO;
import com.example.domain.PaymentVO;
import com.example.domain.SnsLawyerVO;

import jakarta.servlet.http.HttpSession;

@Service // 이 클래스가 Spring에서 Service 역할을 하는 클래스임
public class LawyerServiceImpl implements LawyerService {
	
	@Autowired //BoardDAO 타입의 객체를 자동으로 주입 / Spring의 의존성 주입(Dependency Injection)을 사용하는 부
	private LawyerDAO lawyerDAO;
	
	
    //변호사 로그인
    @Override // Java에서 메서드 재정의를 나타내는 어노테이션 , 부모 클래스나 인터페이스의 메서드를 재정의
    public LawyerVO loginLawyer(LawyerVO vo) {
        return lawyerDAO.loginLawyer(vo);
    }
    @Override
    public LawyerVO kakaoLawyerLogin(String lawyer_id) {
        return lawyerDAO.kakaoLawyerLogin(lawyer_id);
    }
    //변호사 로그아웃
    @Override
    public void logoutLawyer(HttpSession session) {
        lawyerDAO.logoutLawyer(session);
    }
    //변호사 아이디 중복체크
    @Override
	public LawyerVO getIdLawyer(LawyerVO vo) {
		System.out.println("LawyerServiceImpl >> getIdLawyer");
		LawyerVO result = lawyerDAO.getIdLawyer(vo);
		System.out.println("LawyerServiceImpl >> getIdLawyer / result : " + result);
		return result;
	}

    @Override
    public LawyerVO getLawyer(LawyerVO vo) {
        return lawyerDAO.getLawyer(vo);
    }

    //변호사 회원가입
    @Override
    public void insertLawyer(LawyerVO vo) {
    	lawyerDAO.insertLawyer(vo);
	}
    //변호사 회원가입시 sns 에 추가 저장
    @Override
    public void insertSnsLawyer(SnsLawyerVO slvo) {
    	lawyerDAO.insertSnsLawyer(slvo);
	}


    // @Override
    // public void deleteMember(String id) {
    //     lawyerDAO.deleteMemberById(id);
    // }
    
    // @Override
    // public void updateMember(UsersVO vo) {
    // 	memberDAO.updateMember(vo);
    // }

    // @Override
    // public UsersVO getMemberById(String user_id) {
    //     return memberDAO.getMemberById(user_id);
    // }

    //변호사 마이페이지 개인정보수정 01.22 김모세
    @Override
    public int lawyerUpdate(LawyerVO vo) {
        return lawyerDAO.lawyerUpdate(vo);
    }
    //변호사 마이페이지 비밀번호변경진입 01.23 김모세
    @Override
    public String lawyerPassConfirm(LawyerVO vo) {
        return lawyerDAO.lawyerPassConfirm(vo);
    }
    //변호사 마이페이지 새비밀번호 수정 01.22 김모세
    @Override
    public int lawyerNewPassUpdate(LawyerVO vo) {
        return lawyerDAO.lawyerNewPassUpdate(vo);
    }
    //변호사 멤버십 결제 01.24 김모세
    @Override
    public void insertMembership(LawyerVO vo) {
        lawyerDAO.insertMembership(vo);
    }
    //변호사 멤버십 결제내역 추가 01.24 김모세
    @Override
    public void insertPayment(LawyerVO vo) {
        lawyerDAO.insertPayment(vo);
    }
    //변호사 결제내역 불러오기 01.24 김모세
	@Override
    public List<PaymentVO> paymentDetail(PaymentVO vo) {
        return lawyerDAO.paymentDetail(vo);
    }
    //관리자 결제내역 불러오기 01.25 김모세
    @Override
    public List<PaymentVO> salesList(PaymentVO vo) {
        return lawyerDAO.salesList(vo);
    }
    //관리자 메인 대시보드 금주매출 01.26 김모세
    @Override
    public String dashSales(PaymentVO Pvo) {
        return lawyerDAO.dashSales(Pvo);
    }
    //관리자 변호사 회원정보 표시
    @Override
    public List<LawyerVO> lawyerList() {
        return lawyerDAO.lawyerList();
    }
    //관리자 변호사 회원 상세정보 표시
    @Override
    public LawyerVO lawyerDetail(String lawyer_id){
        return lawyerDAO.lawyerDetail(lawyer_id);
    }

}