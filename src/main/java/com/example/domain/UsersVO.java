package com.example.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class UsersVO {
    private String user_id;
	private String user_name;
    private String user_pw;
	private String user_tel;
    private Date user_birth;
    private String user_addr;
    private String user_regdate;
    private String user_modifydate;
	private int auth_idx;
    private String new_user_pw;
    private String new_user_pwck;
    private int num;

// // user_regdate를 문자열로 변환하는 메서드
// public String getFormattedUserRegdate() {
//     if (user_regdate != null) {
//         DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
//         return user_regdate.format(formatter);
//     } else {
//         return null;
//     }
// }

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
     * @return String return the user_pw
     */
    public String getUser_pw() {
        return user_pw;
    }

    /**
     * @param user_pw the user_pw to set
     */
    public void setUser_pw(String user_pw) {
        this.user_pw = user_pw;
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

    /**
     * @return Date return the user_birth
     */
    public Date getUser_birth() {
        return user_birth;
    }

    /**
     * @param user_birth the user_birth to set
     */
    public void setUser_birth(Date user_birth) {
        this.user_birth = user_birth;
    }

    /**
     * @return String return the user_addr
     */
    public String getUser_addr() {
        return user_addr;
    }

    /**
     * @param user_addr the user_addr to set
     */
    public void setUser_addr(String user_addr) {
        this.user_addr = user_addr;
    }

    /**
     * @return DateTime return the user_regdate
     */
    public String getUser_regdate() {
        return user_regdate;
    }

    /**
     * @param user_regdate the user_regdate to set
     */
    public void setUser_regdate(String user_regdate) {
        this.user_regdate = user_regdate;
    }

    /**
     * @return DateTime return the user_modifydate
     */
    public String getUser_modifydate() {
        return user_modifydate;
    }

    /**
     * @param user_modifydate the user_modifydate to set
     */
    public void setUser_modifydate(String user_modifydate) {
        this.user_modifydate = user_modifydate;
    }

    /**
     * @return int return the auth_idx
     */
    public int getAuth_idx() {
        return auth_idx;
    }

    /**
     * @param auth_idx the auth_idx to set
     */
    public void setAuth_idx(int auth_idx) {
        this.auth_idx = auth_idx;
    }

    public Object getLawyer_name() {
        return null;
    }


    /**
     * @return String return the new_user_pw
     */
    public String getNew_user_pw() {
        return new_user_pw;
    }

    /**
     * @param new_user_pw the new_user_pw to set
     */
    public void setNew_user_pw(String new_user_pw) {
        this.new_user_pw = new_user_pw;
    }


    /**
     * @return String return the new_user_pwck
     */
    public String getNew_user_pwck() {
        return new_user_pwck;
    }

    /**
     * @param new_user_pwck the new_user_pwck to set
     */
    public void setNew_user_pwck(String new_user_pwck) {
        this.new_user_pwck = new_user_pwck;
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
     * @return int return the num
     */
    public int getNum() {
        return num;
    }

    /**
     * @param num the num to set
     */
    public void setNum(int num) {
        this.num = num;
    }

}
