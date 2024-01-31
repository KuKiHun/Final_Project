package com.example.controller;

import com.example.domain.LawyerVO;
import com.example.domain.SystemVO;
import com.example.domain.UsersVO;
import com.example.service.LawyerService;
import com.example.service.SystemService;
import com.example.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
public class ConnectController {

    @Autowired
    LawyerService lawyerService;

    @Autowired
    UsersService usersService;

    @Autowired
    SystemService systemService;

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

    @CrossOrigin(origins = "http://localhost:3001")
    @GetMapping(value = "/videoIndex/lawyerConnect/{lawyer_id}")
    public Map<String, Object> getLawyerConnectVideo(@PathVariable String lawyer_id){
        LawyerVO vo = new LawyerVO();
        vo.setLawyer_id(lawyer_id);
        LawyerVO lawyer = lawyerService.getLawyer(vo);
        if(lawyer == null) return null;

        Map<String, Object> map = new HashMap<>();
        map.put("lawyer_name", lawyer.getLawyer_name());
        map.put("lawyer_id", lawyer_id);
        map.put("auth_idx", lawyer.getAuth_idx());

        System.out.println("ConnectController >>> getLawyerConnectVideo / map : " + map);
        return map;
    }

    @CrossOrigin(origins = "http://localhost:3001")
    @GetMapping(value = "/videoIndex/userConnect/{userId}")
    public Map<String, Object> getUserConnectVideo(@PathVariable String userId){
        UsersVO result = usersService.getMemberById(userId);

        Map<String, Object> map = new HashMap<>();
        map.put("user_id", userId);
        map.put("user_name", result.getUser_name());
        map.put("auth_idx", result.getAuth_idx());

        System.out.println("ConnectController >>> getUserConnectVideo / map : " + map);
        return map;
    }

    @CrossOrigin(origins = "http://localhost:3001")
    @GetMapping(value = "/getSystemPath/{path_name}")
    @ResponseBody
    public SystemVO getSystemPath(@PathVariable String path_name){
        SystemVO vo = new SystemVO();
        vo.setSystem_name(path_name);
        SystemVO result = systemService.getSystemValue(vo);
        return result;
    }
}
