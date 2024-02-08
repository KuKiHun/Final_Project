package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.domain.LawyerVO;
import com.example.domain.UsersVO;
import com.example.service.LawyerService;
import com.example.service.UsersService;

@Controller
@RequestMapping("admin/member")
public class AdminMemberController {

    @Autowired
    private UsersService usersService;

    @Autowired
    private LawyerService lawyerService;
    
    /*
    @RequestMapping("/{step}")
    public String viewPage(@PathVariable String step) {
        return "admin/member/" + step;
    }
    */
    
    //관리자 일반회원정보 리스트
    @RequestMapping("user_list")
    public String userList(UsersVO vo, Model model){
        List<UsersVO> user = usersService.userList();
        System.out.println("userlist controller:" + user);
        model.addAttribute("userList", user);
        return "admin/member/user_list";
    }
    
    //관리자 일반회원정보 상세리스트
    @RequestMapping("user_list_detail")
    public String userDetail(String user_id, Model model) {
    	
    	UsersVO userDetail = usersService.userDetail(user_id);
    	
    	model.addAttribute("userDetail", userDetail);
    	
    	return "admin/member/user_list_detail";
    }
    
    //관리자 변호사 회원정보 리스트
    @RequestMapping("/lawyer_list")
    public String lawyerList(LawyerVO vo, Model model){
        List<LawyerVO> lawyerList = lawyerService.lawyerList();
        model.addAttribute("lawyerList", lawyerList);
        return "admin/member/lawyer_list";
    }
    //관리자 변호사 회원정보 상세리스트
    @RequestMapping("lawyer_list_detail")
    public String lawyerDetail(String lawyer_id, Model model) {
    	LawyerVO lawyerDetail = lawyerService.lawyerDetail(lawyer_id);
    	model.addAttribute("lawyerDetail", lawyerDetail);
    	return "admin/member/lawyer_list_detail";
    }

}
