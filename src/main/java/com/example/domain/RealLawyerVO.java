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
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	public String getOffice() {
		return office;
	}
	public void setOffice(String office) {
		this.office = office;
	}
	public String getSearchname() {
		return searchname;
	}
	public void setSearchname(String searchname) {
		this.searchname = searchname;
	}
	public String getSearchoffice() {
		return searchoffice;
	}
	public void setSearchoffice(String searchoffice) {
		this.searchoffice = searchoffice;
	}
	public String getSearchfield() {
		return searchfield;
	}
	public void setSearchfield(String searchfield) {
		this.searchfield = searchfield;
	}
    
    
}
