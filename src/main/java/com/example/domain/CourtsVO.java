package com.example.domain;

import lombok.Data;

@Data
public class CourtsVO {
    private int courts_idx;
    private String courts_name;
    private int courts_sort_idx;
    private int address_idx;

    private AddressVO address; // AddressVO 연결

    // address 위도 경도 값
    private double address_lat; 
    private double address_long;

    // address 위도 경도 값 연결
    public AddressVO getAddress() {
        if (address == null) {
            address = new AddressVO();
            address.setAddress_lat(address_lat);
            address.setAddress_long(address_long);
        }
        return address;
    }
    
    
}
