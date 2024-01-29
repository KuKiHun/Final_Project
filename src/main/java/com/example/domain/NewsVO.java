package com.example.domain;

import lombok.Data;

import java.time.LocalDate;
import java.util.Date;

@Data
public class NewsVO {
    private int news_idx;
    private String news_title;
    private String news_url;
    private String news_image_url;
    private LocalDate news_date;
	public int getNews_idx() {
		return news_idx;
	}
	public void setNews_idx(int news_idx) {
		this.news_idx = news_idx;
	}
	public String getNews_title() {
		return news_title;
	}
	public void setNews_title(String news_title) {
		this.news_title = news_title;
	}
	public String getNews_url() {
		return news_url;
	}
	public void setNews_url(String news_url) {
		this.news_url = news_url;
	}
	public String getNews_image_url() {
		return news_image_url;
	}
	public void setNews_image_url(String news_image_url) {
		this.news_image_url = news_image_url;
	}
	public LocalDate getNews_date() {
		return news_date;
	}
	public void setNews_date(LocalDate news_date) {
		this.news_date = news_date;
	}
    
}
