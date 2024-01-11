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
}
