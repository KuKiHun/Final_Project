package com.example.domain;

import lombok.Data;

@Data
public class SystemVO {
    private int system_idx;
    private String system_name;
    private String system_path;

    

    /**
     * @return int return the system_idx
     */
    public int getSystem_idx() {
        return system_idx;
    }

    /**
     * @param system_idx the system_idx to set
     */
    public void setSystem_idx(int system_idx) {
        this.system_idx = system_idx;
    }

    /**
     * @return String return the system_name
     */
    public String getSystem_name() {
        return system_name;
    }

    /**
     * @param system_name the system_name to set
     */
    public void setSystem_name(String system_name) {
        this.system_name = system_name;
    }

    /**
     * @return String return the system_path
     */
    public String getSystem_path() {
        return system_path;
    }

    /**
     * @param system_path the system_path to set
     */
    public void setSystem_path(String system_path) {
        this.system_path = system_path;
    }

}
