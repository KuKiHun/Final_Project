package com.example.domain;

import lombok.Data;

@Data
public class PaymentVO {
    private int pay_idx;
    private String pay_date;
    private String pay_product;
    private int pay_price;
    private String lawyer_id;
	public int getPay_idx() {
		return pay_idx;
	}
	public void setPay_idx(int pay_idx) {
		this.pay_idx = pay_idx;
	}
	public String getPay_date() {
		return pay_date;
	}
	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}
	public String getPay_product() {
		return pay_product;
	}
	public void setPay_product(String pay_product) {
		this.pay_product = pay_product;
	}
	public int getPay_price() {
		return pay_price;
	}
	public void setPay_price(int pay_price) {
		this.pay_price = pay_price;
	}
	public String getLawyer_id() {
		return lawyer_id;
	}
	public void setLawyer_id(String lawyer_id) {
		this.lawyer_id = lawyer_id;
	}
    
    
    
}
