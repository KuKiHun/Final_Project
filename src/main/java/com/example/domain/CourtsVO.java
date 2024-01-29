package com.example.domain;

import lombok.Data;

@Data
public class CourtsVO {
    private int courts_idx;     //법원인덱스
    private String courts_name; //법원이름
    private int courts_sort_idx;//법원분류인덱스
    private int address_idx;    //주소인덱스
    private String courts_city; //법원도시
    private String courts_tel;  //법원전화번호

    private AddressVO address; // AddressVO 연결

    // 법원 검색시 옵션, 이름 01.12 김모세
    private String option;
    private String name;

    // address 위도 경도 값 01.11 김모세
    private double address_lat; 
    private double address_long;

    // address 주소값 01.12 김모세
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
    
    // address_val에 대한 getter/setter 메서드 추가 01.12 김모세
    public String getAddress_val() {
        return address_val;
    }
    // address 주소값 연결 01.12 김모세
    public void setAddress_val(String address_val) {
        this.address_val = address_val;
    }

	public int getCourts_idx() {
		return courts_idx;
	}

	public void setCourts_idx(int courts_idx) {
		this.courts_idx = courts_idx;
	}

	public String getCourts_name() {
		return courts_name;
	}

	public void setCourts_name(String courts_name) {
		this.courts_name = courts_name;
	}

	public int getCourts_sort_idx() {
		return courts_sort_idx;
	}

	public void setCourts_sort_idx(int courts_sort_idx) {
		this.courts_sort_idx = courts_sort_idx;
	}

	public int getAddress_idx() {
		return address_idx;
	}

	public void setAddress_idx(int address_idx) {
		this.address_idx = address_idx;
	}

	public String getCourts_city() {
		return courts_city;
	}

	public void setCourts_city(String courts_city) {
		this.courts_city = courts_city;
	}

	public String getCourts_tel() {
		return courts_tel;
	}

	public void setCourts_tel(String courts_tel) {
		this.courts_tel = courts_tel;
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
