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
    
}
