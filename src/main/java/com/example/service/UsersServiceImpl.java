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
	
    //아이디중복확인
    @Override
	public UsersVO getUser(UsersVO vo) {
		System.out.println("UserServiceImpl >> getUser");
		UsersVO result = usersDAO.getUser(vo);
		System.out.println("UserServiceImpl >> getUser / result : " + result);
		return result;
	}
	
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
    //네이버 로그인
    @Override
    public UsersVO naverLogin(String user_id) {
        return usersDAO.naverLogin(user_id);
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
//     @Override
// public boolean emailCheck(String user_id, String email) {
//     Map<String, Object> map = new HashMap<>();
//     map.put("username", user_id);
//     map.put("email", email);
//     String result = usersDAO.emailCheck(map);
//     if("1".equals(result)) {
//         return true;
//     }
//     return false;
// }

    // 비밀번호 찾기 - 이메일
	@Override
	public UsersVO selectMember(String user_id) {
		System.out.println("Password Service : " + user_id);
		UsersVO result = usersDAO.selectMember(user_id);
		System.out.println("Service : " + result);
		return result;
	}
	// 비밀번호 변경
	@Override
	public int pwUpdate_M(UsersVO vo) {
		int result = usersDAO.pwUpdate_M(vo);
		System.out.println("비번 변경 : " + result);
		return result;
	}
    //비밀번호 찾기 페이지로 진입
	public void passCheck(UsersVO vo){
        usersDAO.passCheck(vo);
    }
    //비밀번호 찾기
	public UsersVO passCheckConfirm(UsersVO vo){
        return usersDAO.passCheckConfirm(vo);
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
    //일반 마이페이지 비밀번호변경진입
    @Override
    public String userPassConfirm(UsersVO vo) {
        return usersDAO.userPassConfirm(vo);
    }
    //일반 마이페이지 새비밀번호 수정
    @Override
    public int userNewPassUpdate(UsersVO vo) {
        return usersDAO.userNewPassUpdate(vo);
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
    //이름 + 아이디 권한 가져오기 (채팅)
    @Override
    public UsersVO getMemberById(String user_id) {
        return usersDAO.getMemberById(user_id);
    }



    
}