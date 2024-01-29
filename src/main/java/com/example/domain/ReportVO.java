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
    private String report_date;     //신고일자
    private int report_read;        //읽음 유무
	public int getReport_idx() {
		return report_idx;
	}
	public void setReport_idx(int report_idx) {
		this.report_idx = report_idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getLawyer_id() {
		return lawyer_id;
	}
	public void setLawyer_id(String lawyer_id) {
		this.lawyer_id = lawyer_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getReported_user() {
		return reported_user;
	}
	public void setReported_user(String reported_user) {
		this.reported_user = reported_user;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getReport_date() {
		return report_date;
	}
	public void setReport_date(String report_date) {
		this.report_date = report_date;
	}
	public int getReport_read() {
		return report_read;
	}
	public void setReport_read(int report_read) {
		this.report_read = report_read;
	}
    
    
    
}
