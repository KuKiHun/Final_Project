package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.LawyerDAO;
import com.example.domain.LawyerVO;

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
    //변호사 로그아웃
    @Override
    public void logoutLawyer(HttpSession session) {
        lawyerDAO.logoutLawyer(session);
    }
	//변호사 회원가입
    @Override
    public void insertLawyer(LawyerVO vo) {
    	lawyerDAO.insertLawyer(vo);
		
	}
    // @Override
    // public void deleteMember(String id) {
    //     lawyerDAO.deleteMemberById(id);
    // }
    
    // @Override
    // public void updateMember(MemberVO vo) {
    // 	memberDAO.updateMember(vo);
    // }

    // @Override
    // public MemberVO getMemberById(String user_id) {
    //     return memberDAO.getMemberById(user_id);
    // }



    
}