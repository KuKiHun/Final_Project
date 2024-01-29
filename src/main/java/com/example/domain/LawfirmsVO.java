package com.example.domain;

import lombok.Data;

@Data
public class LawfirmsVO {
    private int lawfirm_idx;        //법률사무소인덱스
    private String lawfirm_name;    //법률사무소이름
    private int address_idx;        //주소인덱스
    private String lawfirm_city;    //법률사무소도시

    private AddressVO address; // AddressVO 연결

    // 법률사무소 검색시 옵션, 이름 01.13 김모세
    private String option;
    private String name;

    // address 위도 경도 값 01.11 김모세
    private double address_lat; 
    private double address_long;

    // address 주소값 01.13 김모세
    private String address_val;
    
    // address 위도 경도 값 연결 01.11 김모세
    public AddressVO getAddress() {
        if (address == null) {
            address = new AddressVO();
            address.setAddress_lat(address_lat);
            address.setAddress_long(address_long);
        }
        return address;
    }

    // address_val에 대한 getter/setter 01.13 김모세
    public String getAddress_val() {
        return address_val;
    }

    // address 주소값 연결 01.13 김모세
    public void setAddress_val(String address_val) {
        this.address_val = address_val;
    }

	public int getLawfirm_idx() {
		return lawfirm_idx;
	}

	public void setLawfirm_idx(int lawfirm_idx) {
		this.lawfirm_idx = lawfirm_idx;
	}

	public String getLawfirm_name() {
		return lawfirm_name;
	}

	public void setLawfirm_name(String lawfirm_name) {
		this.lawfirm_name = lawfirm_name;
	}

	public int getAddress_idx() {
		return address_idx;
	}

	public void setAddress_idx(int address_idx) {
		this.address_idx = address_idx;
	}

	public String getLawfirm_city() {
		return lawfirm_city;
	}

	public void setLawfirm_city(String lawfirm_city) {
		this.lawfirm_city = lawfirm_city;
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public void setAddress(AddressVO address) {
		this.address = address;
	}
    
    
}
