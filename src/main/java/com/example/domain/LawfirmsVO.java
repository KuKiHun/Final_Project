package com.example.domain;

import lombok.Data;

@Data
public class LawfirmsVO {
    private int lawfirm_idx;
    private String lawfirm_name;
    private int address_idx;
    private String lawfirm_city;

    private AddressVO address; // AddressVO 연결

    // address 위도 경도 값 01.11 김모세
    private double address_lat; 
    private double address_long;

    // address 위도 경도 값 연결 01.11 김모세
    public AddressVO getAddress() {
        if (address == null) {
            address = new AddressVO();
            address.setAddress_lat(address_lat);
            address.setAddress_long(address_long);
        }
        return address;
    }
    
    
}
