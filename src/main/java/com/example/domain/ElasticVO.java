package com.example.domain;

import java.util.List;
import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ElasticVO {
    private String esCount;
    private List<Map<String, Object>> esResult;
	public String getEsCount() {
		return esCount;
	}
	public void setEsCount(String esCount) {
		this.esCount = esCount;
	}
	public List<Map<String, Object>> getEsResult() {
		return esResult;
	}
	public void setEsResult(List<Map<String, Object>> esResult) {
		this.esResult = esResult;
	}
    
    
}
