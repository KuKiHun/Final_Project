package com.example.domain;

import lombok.Data;

@Data
public class AddressVO {
    private int address_idx;
    private String address_val;
    private double address_lat;
    private double address_long;
	public int getAddress_idx() {
		return address_idx;
	}
	public void setAddress_idx(int address_idx) {
		this.address_idx = address_idx;
	}
	public String getAddress_val() {
		return address_val;
	}
	public void setAddress_val(String address_val) {
		this.address_val = address_val;
	}
	public double getAddress_lat() {
		return address_lat;
	}
	public void setAddress_lat(double address_lat) {
		this.address_lat = address_lat;
	}
	public double getAddress_long() {
		return address_long;
	}
	public void setAddress_long(double address_long) {
		this.address_long = address_long;
	}
    
    
    
}
