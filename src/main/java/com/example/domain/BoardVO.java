package com.example.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardVO {
	
	int no;

    private int 	board_idx;            //일련번호
    private String 	board_title;          //제목
    private String  board_register_date;  //등록일
    private String  board_modify_date;    //수정일
    private String  board_content;        //내용
    private int     board_IsSelected;     //답변 채택 여부
    private String  board_sort;           //게시물종류
    private String  user_id;              //유저아이디
    private int     field_idx;            //법 분야 일련번호
    private int     board_count;          //조회수 

    private String  field_name;           //법 분야
    private int     board_reply_count;    //답변 수
    private int     board_totalCount;     //총 글 수 
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_register_date() {
		return board_register_date;
	}
	public void setBoard_register_date(String board_register_date) {
		this.board_register_date = board_register_date;
	}
	public String getBoard_modify_date() {
		return board_modify_date;
	}
	public void setBoard_modify_date(String board_modify_date) {
		this.board_modify_date = board_modify_date;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public int getBoard_IsSelected() {
		return board_IsSelected;
	}
	public void setBoard_IsSelected(int board_IsSelected) {
		this.board_IsSelected = board_IsSelected;
	}
	public String getBoard_sort() {
		return board_sort;
	}
	public void setBoard_sort(String board_sort) {
		this.board_sort = board_sort;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getField_idx() {
		return field_idx;
	}
	public void setField_idx(int field_idx) {
		this.field_idx = field_idx;
	}
	public int getBoard_count() {
		return board_count;
	}
	public void setBoard_count(int board_count) {
		this.board_count = board_count;
	}
	public String getField_name() {
		return field_name;
	}
	public void setField_name(String field_name) {
		this.field_name = field_name;
	}
	public int getBoard_reply_count() {
		return board_reply_count;
	}
	public void setBoard_reply_count(int board_reply_count) {
		this.board_reply_count = board_reply_count;
	}
	public int getBoard_totalCount() {
		return board_totalCount;
	}
	public void setBoard_totalCount(int board_totalCount) {
		this.board_totalCount = board_totalCount;
	}
    
    
    
}
