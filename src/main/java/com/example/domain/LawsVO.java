package com.example.domain;

import lombok.Data;

@Data
public class LawsVO {
    private Integer laws_idx;           // 법 인덱스
    private String laws_act;            // 법 종류
    private Double laws_part;           // 편
    private Double laws_chapter;        // 장
    private Double laws_section;        // 절
    private Double laws_article;        // 조
    private Double laws_paragraph;      // 항
    private Double laws_subparagraph;   // 호
    private String laws_content;        // 내용
	public Integer getLaws_idx() {
		return laws_idx;
	}
	public void setLaws_idx(Integer laws_idx) {
		this.laws_idx = laws_idx;
	}
	public String getLaws_act() {
		return laws_act;
	}
	public void setLaws_act(String laws_act) {
		this.laws_act = laws_act;
	}
	public Double getLaws_part() {
		return laws_part;
	}
	public void setLaws_part(Double laws_part) {
		this.laws_part = laws_part;
	}
	public Double getLaws_chapter() {
		return laws_chapter;
	}
	public void setLaws_chapter(Double laws_chapter) {
		this.laws_chapter = laws_chapter;
	}
	public Double getLaws_section() {
		return laws_section;
	}
	public void setLaws_section(Double laws_section) {
		this.laws_section = laws_section;
	}
	public Double getLaws_article() {
		return laws_article;
	}
	public void setLaws_article(Double laws_article) {
		this.laws_article = laws_article;
	}
	public Double getLaws_paragraph() {
		return laws_paragraph;
	}
	public void setLaws_paragraph(Double laws_paragraph) {
		this.laws_paragraph = laws_paragraph;
	}
	public Double getLaws_subparagraph() {
		return laws_subparagraph;
	}
	public void setLaws_subparagraph(Double laws_subparagraph) {
		this.laws_subparagraph = laws_subparagraph;
	}
	public String getLaws_content() {
		return laws_content;
	}
	public void setLaws_content(String laws_content) {
		this.laws_content = laws_content;
	}
    
}
