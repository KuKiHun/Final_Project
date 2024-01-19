package com.example.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CounselVO {
    private Date board_reply_date;      //답변 시간
    private Data board_reply_modify;    //답변 수정 시간
    private String board_reply_content; //답변 내용
    private int board_reply_isSelected; //답변 채택 여부
    private int board_reply_recom_cnt;  //답변 추천 수
    private String lawyer_id;           //변호사 아이디
    private int board_idx;              //질문 인덱스

    private String lawyer_name;         //변호사 이름
    private int lawfirm_idx;            //로펌 인덱스
    private String lawfirm_name;        //로펌 이름

    private String user_id;             //유저 아이디
}
