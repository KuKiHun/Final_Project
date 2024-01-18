package com.example.domain;

import lombok.Data;

@Data
public class PartnerLawyerVO {
    private String lawyer_id;       //변호사 아이디
    private String lawyer_name;     //변호사 이름
    private String lawyer_tel;      //변호사 전화번호
    private String lawyer_exam;     //변호사 출신시험
    private int lawyer_exam_num;    //변호사 시험회차
    private String lawyer_acq_year; //변호사 자격취득일
    private String lawyer_area;     //변호사 활동지역
    private int lawyer_premium_date;  //변호사 멤버스
    private int lawyer_liked;        //변호사 추천수
    private int lawfirm_idx;        //로펌 인덱스

    //법률사무소VO 연결 01.18 김모세
    private LawfirmsVO lawfirms;

    //법률사무소 이름값 01.18 김모세
    private String lawfirm_name;

    //lawfirm_name에 대한 getter/setter 01.18 김모세
    public String getLawfirm_name() {
        return lawfirm_name;
    }
    //lawfirm 주소값 연결 01.18 김모세
    public void setLawfirm_name(String lawfirm_name) {
        this.lawfirm_name = lawfirm_name;
    }
}
