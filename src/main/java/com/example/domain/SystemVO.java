package com.example.domain;

import lombok.Data;

@Data
public class SystemVO {
    private int system_idx;
    private String system_name;
    private String system_path;
	public int getSystem_idx() {
		return system_idx;
	}
	public void setSystem_idx(int system_idx) {
		this.system_idx = system_idx;
	}
	public String getSystem_name() {
		return system_name;
	}
	public void setSystem_name(String system_name) {
		this.system_name = system_name;
	}
	public String getSystem_path() {
		return system_path;
	}
	public void setSystem_path(String system_path) {
		this.system_path = system_path;
	}
    
    
}
