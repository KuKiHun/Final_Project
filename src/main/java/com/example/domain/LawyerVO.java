package com.example.domain;

import org.joda.time.DateTime;

import lombok.Data;



@Data
public class LawyerVO {
    private String lawyer_id;
	private String lawyer_name;
    private String lawyer_area;
	private String lawyer_acq_year;
    private String lawyer_exam;
    private int lawyer_exam_num;
    private DateTime lawyer_set_date;
    private DateTime lawyer_modify_date;
    private int lawyer_premium_date;
    private int lawyer_liked;
    private String lawyer_chat_start;
    private String lawyer_chat_end;
    private int lawfirm_idx;
	private int auth_idx;
    private String lawyer_pass;
    private String lawyer_birth;
    private String lawyer_tel;
    private String lawyer_field;



    

    /**
     * @return String return the lawyer_id
     */
    public String getLawyer_id() {
        return lawyer_id;
    }

    /**
     * @param lawyer_id the lawyer_id to set
     */
    public void setLawyer_id(String lawyer_id) {
        this.lawyer_id = lawyer_id;
    }

    /**
     * @return String return the lawyer_name
     */
    public String getLawyer_name() {
        return lawyer_name;
    }

    /**
     * @param lawyer_name the lawyer_name to set
     */
    public void setLawyer_name(String lawyer_name) {
        this.lawyer_name = lawyer_name;
    }

    /**
     * @return String return the lawyer_area
     */
    public String getLawyer_area() {
        return lawyer_area;
    }

    /**
     * @param lawyer_area the lawyer_area to set
     */
    public void setLawyer_area(String lawyer_area) {
        this.lawyer_area = lawyer_area;
    }

    /**
     * @return Date return the lawyer_acq_year
     */
    public String getLawyer_acq_year() {
        return lawyer_acq_year;
    }

    /**
     * @param lawyer_acq_year the lawyer_acq_year to set
     */
    public void setLawyer_acq_year(String lawyer_acq_year) {
        this.lawyer_acq_year = lawyer_acq_year;
    }

    /**
     * @return String return the lawyer_exam
     */
    public String getLawyer_exam() {
        return lawyer_exam;
    }

    /**
     * @param lawyer_exam the lawyer_exam to set
     */
    public void setLawyer_exam(String lawyer_exam) {
        this.lawyer_exam = lawyer_exam;
    }

    /**
     * @return int return the lawyer_exam_num
     */
    public int getLawyer_exam_num() {
        return lawyer_exam_num;
    }

    /**
     * @param lawyer_exam_num the lawyer_exam_num to set
     */
    public void setLawyer_exam_num(int lawyer_exam_num) {
        this.lawyer_exam_num = lawyer_exam_num;
    }

    /**
     * @return DateTime return the lawyer_set_date
     */
    public DateTime getLawyer_set_date() {
        return lawyer_set_date;
    }

    /**
     * @param lawyer_set_date the lawyer_set_date to set
     */
    public void setLawyer_set_date(DateTime lawyer_set_date) {
        this.lawyer_set_date = lawyer_set_date;
    }

    /**
     * @return DateTime return the lawyer_modify_date
     */
    public DateTime getLawyer_modify_date() {
        return lawyer_modify_date;
    }

    /**
     * @param lawyer_modify_date the lawyer_modify_date to set
     */
    public void setLawyer_modify_date(DateTime lawyer_modify_date) {
        this.lawyer_modify_date = lawyer_modify_date;
    }

    /**
     * @return int return the lawyer_premium_date
     */
    public int getLawyer_premium_date() {
        return lawyer_premium_date;
    }

    /**
     * @param lawyer_premium_date the lawyer_premium_date to set
     */
    public void setLawyer_premium_date(int lawyer_premium_date) {
        this.lawyer_premium_date = lawyer_premium_date;
    }

    /**
     * @return int return the lawyer_liked
     */
    public int getLawyer_liked() {
        return lawyer_liked;
    }

    /**
     * @param lawyer_liked the lawyer_liked to set
     */
    public void setLawyer_liked(int lawyer_liked) {
        this.lawyer_liked = lawyer_liked;
    }

    /**
     * @return String return the lawyer_chat_start
     */
    public String getLawyer_chat_start() {
        return lawyer_chat_start;
    }

    /**
     * @param lawyer_chat_start the lawyer_chat_start to set
     */
    public void setLawyer_chat_start(String lawyer_chat_start) {
        this.lawyer_chat_start = lawyer_chat_start;
    }

    /**
     * @return String return the lawyer_chat_end
     */
    public String getLawyer_chat_end() {
        return lawyer_chat_end;
    }

    /**
     * @param lawyer_chat_end the lawyer_chat_end to set
     */
    public void setLawyer_chat_end(String lawyer_chat_end) {
        this.lawyer_chat_end = lawyer_chat_end;
    }

    /**
     * @return int return the lawfirm_idx
     */
    public int getLawfirm_idx() {
        return lawfirm_idx;
    }

    /**
     * @param lawfirm_idx the lawfirm_idx to set
     */
    public void setLawfirm_idx(int lawfirm_idx) {
        this.lawfirm_idx = lawfirm_idx;
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


    /**
     * @return String return the lawyer_pass
     */
    public String getLawyer_pass() {
        return lawyer_pass;
    }

    /**
     * @param lawyer_pass the lawyer_pass to set
     */
    public void setLawyer_pass(String lawyer_pass) {
        this.lawyer_pass = lawyer_pass;
    }

    /**
     * @return Date return the lawyer_birth
     */
    public String getLawyer_birth() {
        return lawyer_birth;
    }

    /**
     * @param lawyer_birth the lawyer_birth to set
     */
    public void setLawyer_birth(String lawyer_birth) {
        this.lawyer_birth = lawyer_birth;
    }

    /**
     * @return String return the lawyer_tel
     */
    public String getLawyer_tel() {
        return lawyer_tel;
    }

    /**
     * @param lawyer_tel the lawyer_tel to set
     */
    public void setLawyer_tel(String lawyer_tel) {
        this.lawyer_tel = lawyer_tel;
    }

    


    /**
     * @return String return the lawyer_field
     */
    public String getLawyer_field() {
        return lawyer_field;
    }

    /**
     * @param lawyer_field the lawyer_field to set
     */
    public void setLawyer_field(String lawyer_field) {
        this.lawyer_field = lawyer_field;
    }

}