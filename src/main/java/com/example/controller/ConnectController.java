package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpSession;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class ConnectController {
    //CORS (Cross-Origin Resource Sharing) 정책을 설정하는 데 사용된다.
    @CrossOrigin(origins = "http://localhost:3000")
    @GetMapping(value = "/lawyerConnect/{lawyer_id}/{lawyer_name}/{auth_idx}")
    public List<Map<String, Object>> getLawyerConnect(@PathVariable(name = "lawyer_id") String lawyer_id, @PathVariable(name = "lawyer_name") String lawyer_name, @PathVariable(name = "auth_idx") Integer auth_idx){
        System.out.println("lawyer_id : " + lawyer_id);
        System.out.println("lawyer_name : " + lawyer_name);
        System.out.println("auth_idx : " + auth_idx);

        List<Map<String, Object>> data = new ArrayList<>();

        Map<String, Object> map = new HashMap<>();

        String encodedName = URLEncoder.encode(lawyer_name, StandardCharsets.UTF_8);
      
        map.put("lawyer_name", encodedName);
        map.put("lawyer_id", lawyer_id);
        map.put("auth_idx", auth_idx);

        System.out.println("ConnectController >>>> " + map);

        data.add(map);

        return data;
    }

    
    @CrossOrigin(origins = "http://localhost:3000")
    @GetMapping("/userConnect/{userId}/{userName}/{authIdx}")
    public List<Map<String, Object>> getUserConnect(@PathVariable String userId, @PathVariable String userName, @PathVariable Integer authIdx){
        

        List<Map<String, Object>> data = new ArrayList<>();

        Map<String, Object> map = new HashMap<>();

        String encodedName = URLEncoder.encode(userName, StandardCharsets.UTF_8);

        map.put("lawyer_name", encodedName);
        map.put("lawyer_id", userId);
        map.put("auth_idx", authIdx);

        System.out.println("ConnectController >>>> " + map);

        data.add(map);

        return data;
    }

}

/*
 * [
 * title : title,
 * ,
 * {"user_id":null,"auth_idx":null,"user_name":"test_name"},
 * {"lawyer_id":null,"auth_idx":null,"lawyer_name":null}
 * ]
 */