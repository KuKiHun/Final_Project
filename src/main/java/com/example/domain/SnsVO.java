package com.example.domain;

import lombok.Data;

@Data
public class SnsVO {
    private int sns_login_idx;
    private String sns_login_site;
    private String user_id;
    private String user_name;
    private String user_birth;
    private String user_tel;


    

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




    /**
     * @return String return the user_name
     */
    public String getUser_name() {
        return user_name;
    }

    /**
     * @param user_name the user_name to set
     */
    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    /**
     * @return String return the user_birth
     */
    public String getUser_birth() {
        return user_birth;
    }

    /**
     * @param user_birth the user_birth to set
     */
    public void setUser_birth(String user_birth) {
        this.user_birth = user_birth;
    }

    /**
     * @return String return the user_tel
     */
    public String getUser_tel() {
        return user_tel;
    }

    /**
     * @param user_tel the user_tel to set
     */
    public void setUser_tel(String user_tel) {
        this.user_tel = user_tel;
    }

}