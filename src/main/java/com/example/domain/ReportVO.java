package com.example.domain;

import lombok.Data;

@Data
public class ReportVO {
    private int report_idx;         //신고 인덱스
    private String title;           //신고 제목
    private String writer;          //신고 작성자
    private String lawyer_id;       //변호사 아이디
    private String user_id;         //유저 아이디
    private String category;        //신고유형
    private String reported_user;   //신고자
    private String contents;        //내용
    
}
