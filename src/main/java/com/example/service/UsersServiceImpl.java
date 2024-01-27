package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.UsersDAO;
import com.example.domain.SnsVO;
import com.example.domain.UsersVO;

import jakarta.servlet.http.HttpSession;

@Service // 이 클래스가 Spring에서 Service 역할을 하는 클래스임
public class UsersServiceImpl implements UsersService {
	
	@Autowired //BoardDAO 타입의 객체를 자동으로 주입 / Spring의 의존성 주입(Dependency Injection)을 사용하는 부
    public UsersDAO usersDAO;
	
	
    //로그인
    @Override // Java에서 메서드 재정의를 나타내는 어노테이션 , 부모 클래스나 인터페이스의 메서드를 재정의
    public UsersVO login(UsersVO vo) {
        return usersDAO.login(vo);
    }
    //카카오 로그인
    @Override
    public UsersVO kakaoLogin(String user_id) {
        return usersDAO.kakaoLogin(user_id);
    }
    //로그아웃
    @Override
    public void logout(HttpSession session) {
        usersDAO.logout(session);
    }
	//일반유저 회원가입
    @Override
    public void insertMember(UsersVO vo) {
        // UsersVO 정보 입력
        usersDAO.insertMember(vo);
  
	}
    //일반유저 회원가입시 sns 에 추가 저장
    @Override
    public void insertSnsMember(SnsVO svo) {
        // UsersVO 정보 입력
        usersDAO.insertSnsMember(svo);
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
    //관리자 일반회원정보 표시
    @Override
    public List<UsersVO> userList() {
        return usersDAO.userList();
    }
    //관리자 일반회원상세정보 표시
    @Override
    public UsersVO userDetail(String user_id) {
        return usersDAO.userDetail(user_id);
    }


    // @Override
    // public boolean updatePassword(String user_id, String user_pw, String new_user_pw) {
    //     UsersVO vo = usersDAO.findByUserId(user_id);

    //     if (vo == null) {
    //         return false; // 사용자가 존재하지 않으면 실패
    //     }

    //     if (!vo.getUser_pw().equals(user_pw)) {
    //         return false; // 현재 비밀번호가 일치하지 않으면 실패
    //     }

    //     vo.setUser_pw(new_user_pw);
    //     usersDAO.updatePassword(vo);

    //     return true;
    // }

    // @Override
	// public String pwCheck(String user_id)throws Exception{
	// 	return usersDAO.pwCheck(user_id);
	// }
	
	// @Override
	// public void pwUpdate(String user_id, String hashedPw)throws Exception{
	// 	usersDAO.pwUpdate(user_id, hashedPw);
	// }

    @Override
    public void deleteMember(String id) {
        usersDAO.deleteMemberById(id);
    }


    @Override
    public UsersVO getMemberById(String user_id) {
        return usersDAO.getMemberById(user_id);
    }


    @Override
    public UsersVO getUserInfoBySnsLogin(String snsLoginSite, String userId) {
        return usersDAO.getUserInfoBySnsLogin(snsLoginSite, userId);
    }


    
}