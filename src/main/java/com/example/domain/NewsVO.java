package com.example.domain;

import java.time.LocalDate;

import lombok.Data;

@Data
public class NewsVO {
    private int news_idx;
    private String news_title;
    private String news_url;
    private String news_image_url;
    private LocalDate news_date;


}
