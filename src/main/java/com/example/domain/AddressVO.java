package com.example.domain;

import lombok.Data;

@Data
public class AddressVO {
    private int address_idx;
    private String address_val;
    private double address_lat;
    private double address_long;
}
