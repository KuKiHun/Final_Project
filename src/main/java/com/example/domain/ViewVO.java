package com.example.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ViewVO {

    private int 	view_idx;
    private Date 	view_date;
    private int     board_idx;
    private String  user_id;
	public int getView_idx() {
		return view_idx;
	}
	public void setView_idx(int view_idx) {
		this.view_idx = view_idx;
	}
	public Date getView_date() {
		return view_date;
	}
	public void setView_date(Date view_date) {
		this.view_date = view_date;
	}
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
    
    
}
