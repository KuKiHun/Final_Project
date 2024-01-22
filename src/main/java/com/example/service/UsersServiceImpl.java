package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.UsersDAO;
import com.example.domain.UsersVO;

import jakarta.servlet.http.HttpSession;

@Service // 이 클래스가 Spring에서 Service 역할을 하는 클래스임
public class UsersServiceImpl implements UsersService {
	
	@Autowired //BoardDAO 타입의 객체를 자동으로 주입 / Spring의 의존성 주입(Dependency Injection)을 사용하는 부
    public UsersDAO usersDAO;
	
	

    @Override // Java에서 메서드 재정의를 나타내는 어노테이션 , 부모 클래스나 인터페이스의 메서드를 재정의
    public UsersVO login(UsersVO vo) {
        return usersDAO.login(vo);
    }

    @Override
    public void logout(HttpSession session) {
        usersDAO.logout(session);
    }
	
    @Override
    public void insertMember(UsersVO vo) {
    	usersDAO.insertMember(vo);
		
	}
    //마이페이지
    @Override
    public UsersVO getUserInfo(String user_id) {
        return usersDAO.getUserInfo(user_id);
    }
    //마이페이지 수정
    @Override
    public void updateUserInfo(UsersVO vo) {
        usersDAO.updateUserInfo(vo);
    }
    //마이페이지 비밀번호 수정
    @Override
    public void updateUserPassword(UsersVO vo) {
        usersDAO.updateUserPassword(vo);
    }

    @Override
    public void deleteMember(String id) {
        usersDAO.deleteMemberById(id);
    }
    
    @Override
    public void updateMember(UsersVO vo) {
    	usersDAO.updateMember(vo);
    }

    @Override
    public UsersVO getMemberById(String user_id) {
        return usersDAO.getMemberById(user_id);
    }

    @Override
    public UsersVO kakaoLogin(String user_id) {
        return usersDAO.kakaoLogin(user_id);
    }

    @Override
    public UsersVO getUserInfoBySnsLogin(String snsLoginSite, String userId) {
        return usersDAO.getUserInfoBySnsLogin(snsLoginSite, userId);
    }

    public void createMember(UsersVO member) {
        usersDAO.createMember(member);
    }

    
}