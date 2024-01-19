package com.example.controller;

import com.example.domain.LawyerVO;
import com.example.domain.UsersVO;
import com.example.service.LawyerService;
import com.example.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
public class ConnectController {

    @Autowired
    LawyerService lawyerService;

    @Autowired
    UsersService usersService;
    //CORS (Cross-Origin Resource Sharing) 정책을 설정하는 데 사용된다.
    @CrossOrigin(origins = "http://localhost:3000")
    @GetMapping(value = "/lawyerConnect/{lawyer_id}")
    public Map<String, Object> getLawyerConnect(@PathVariable String lawyer_id){
        LawyerVO vo = new LawyerVO();
        vo.setLawyer_id(lawyer_id);
        LawyerVO lawyer = lawyerService.getLawyer(vo);
        if (lawyer == null) return null;

        Map<String, Object> map = new HashMap<>();
        map.put("lawyer_name", lawyer.getLawyer_name());
        map.put("lawyer_id", lawyer_id);
        map.put("auth_idx", lawyer.getAuth_idx());

        System.out.println("ConnectController >>>> " + map);
        return map;
    }

    @CrossOrigin(origins = "http://localhost:3000")
    @GetMapping("/userConnect/{userId}")
    public Map<String, Object> getUserConnect(@PathVariable String userId){
        UsersVO result = usersService.getMemberById(userId);

        Map<String, Object> map = new HashMap<>();
        map.put("user_id", userId);
        map.put("user_name", result.getUser_name());
        map.put("auth_idx", result.getAuth_idx());

        System.out.println("ConnectController >>>> " + map);

        return map;
    }
}
