package com.example.domain;

import lombok.Data;

@Data
public class SnsLawyerVO {
    private int sns_lawyerLogin_idx;
    private int lawfirm_idx;
    private String lawyer_name;
    private String lawyer_id;
    private String lawyer_tel;
    private String lawyer_birth;
    private String lawyer_area;
    private String lawfirm_name;
    private String lawyer_field;



    /**
     * @return int return the sns_lawyerLogin_idx
     */
    public int getSns_lawyerLogin_idx() {
        return sns_lawyerLogin_idx;
    }

    /**
     * @param sns_lawyerLogin_idx the sns_lawyerLogin_idx to set
     */
    public void setSns_lawyerLogin_idx(int sns_lawyerLogin_idx) {
        this.sns_lawyerLogin_idx = sns_lawyerLogin_idx;
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
     * @return String return the lawyer_birth
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
     * @return String return the lawfirm_name
     */
    public String getLawfirm_name() {
        return lawfirm_name;
    }

    /**
     * @param lawfirm_name the lawfirm_name to set
     */
    public void setLawfirm_name(String lawfirm_name) {
        this.lawfirm_name = lawfirm_name;
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