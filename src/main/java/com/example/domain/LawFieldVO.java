package com.example.domain;

import lombok.Data;

@Data
public class LawFieldVO {
    private int field_idx;
    private String field_name;
	public int getField_idx() {
		return field_idx;
	}
	public void setField_idx(int field_idx) {
		this.field_idx = field_idx;
	}
	public String getField_name() {
		return field_name;
	}
	public void setField_name(String field_name) {
		this.field_name = field_name;
	}
    
    
}
