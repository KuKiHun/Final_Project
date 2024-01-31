package com.example.domain;

import lombok.Data;

@Data
public class AddressVO {
    private int address_idx;
    private String address_val;
    private double address_lat;
    private double address_long;

    

    /**
     * @return int return the address_idx
     */
    public int getAddress_idx() {
        return address_idx;
    }

    /**
     * @param address_idx the address_idx to set
     */
    public void setAddress_idx(int address_idx) {
        this.address_idx = address_idx;
    }

    /**
     * @return String return the address_val
     */
    public String getAddress_val() {
        return address_val;
    }

    /**
     * @param address_val the address_val to set
     */
    public void setAddress_val(String address_val) {
        this.address_val = address_val;
    }

    /**
     * @return double return the address_lat
     */
    public double getAddress_lat() {
        return address_lat;
    }

    /**
     * @param address_lat the address_lat to set
     */
    public void setAddress_lat(double address_lat) {
        this.address_lat = address_lat;
    }

    /**
     * @return double return the address_long
     */
    public double getAddress_long() {
        return address_long;
    }

    /**
     * @param address_long the address_long to set
     */
    public void setAddress_long(double address_long) {
        this.address_long = address_long;
    }

}
