package com.example.domain;

import lombok.Data;

@Data
public class RealLawyerVO {
    private int idx;        //인덱스번호
    private String name;    //이름
    private String tel;     //전화번호
    private String photo;   //프로필사진
    private String field;   //전문분야
    private String office;  //소속사무실

    //리얼변호사 검색옵션 01.16 김모세
    private String searchname;
    private String searchoffice;
    private String searchfield;
    

    

    /**
     * @return String return the searchname
     */
    public String getSearchname() {
        return searchname;
    }

    /**
     * @param searchname the searchname to set
     */
    public void setSearchname(String searchname) {
        this.searchname = searchname;
    }

    /**
     * @return String return the searchoffice
     */
    public String getSearchoffice() {
        return searchoffice;
    }

    /**
     * @param searchoffice the searchoffice to set
     */
    public void setSearchoffice(String searchoffice) {
        this.searchoffice = searchoffice;
    }

    /**
     * @return String return the searchfield
     */
    public String getSearchfield() {
        return searchfield;
    }

    /**
     * @param searchfield the searchfield to set
     */
    public void setSearchfield(String searchfield) {
        this.searchfield = searchfield;
    }

}
