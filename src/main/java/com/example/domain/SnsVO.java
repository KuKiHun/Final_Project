package com.example.domain;

import lombok.Data;

@Data
public class SnsVO {
    private int sns_login_idx;
    private String sns_login_site;
    private String user_id;

    

    /**
     * @return int return the sns_login_idx
     */
    public int getSns_login_idx() {
        return sns_login_idx;
    }

    /**
     * @param sns_login_idx the sns_login_idx to set
     */
    public void setSns_login_idx(int sns_login_idx) {
        this.sns_login_idx = sns_login_idx;
    }

    /**
     * @return String return the sns_login_site
     */
    public String getSns_login_site() {
        return sns_login_site;
    }

    /**
     * @param sns_login_site the sns_login_site to set
     */
    public void setSns_login_site(String sns_login_site) {
        this.sns_login_site = sns_login_site;
    }

    /**
     * @return String return the user_id
     */
    public String getUser_id() {
        return user_id;
    }

    /**
     * @param user_id the user_id to set
     */
    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }



}