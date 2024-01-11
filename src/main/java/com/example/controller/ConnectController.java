package com.example.controller;

import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class ConnectController {

    @GetMapping("/nodeConnect")
    public List<Map<String, Object>> getUser(HttpSession session){
        String user_id = (String)session.getAttribute("user_id");
        String user_name = (String)session.getAttribute("user_name");
        int auth_idx = (int)session.getAttribute("auth_idx");

        List<Map<String, Object>> data = new ArrayList<>();

        Map<String, Object> map = new HashMap<>();
        map.put("user_name", user_name);
        map.put("user_id", user_id);
        map.put("auth_idx", auth_idx);

        System.out.println("ConnectController >>>> " + map);

        data.add(map);

        return data;
    }

}
