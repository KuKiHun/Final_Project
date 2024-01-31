package com.example.domain;

import lombok.Data;

import java.util.Date;

@Data
public class CaseVO {
    private Integer case_idx;   // 판례 인덱스
    private String case_name;   // 판례 이름 
    private String case_number; // 판례 번호
    private String court_name;  // 법원 이름
    private Date case_date;     // 판례 날자

    
}
