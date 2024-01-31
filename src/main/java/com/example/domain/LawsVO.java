package com.example.domain;

import lombok.Data;

@Data
public class LawsVO {
    private Integer laws_idx;           // 법 인덱스
    private String laws_act;            // 법 종류
    private Integer laws_part;           // 편
    private Integer laws_chapter;        // 장
    private Integer laws_section;        // 절
    private Integer laws_article;        // 조
    private Integer laws_paragraph;      // 항
    private Integer laws_subparagraph;   // 호
    private String laws_content;        // 내용
}
