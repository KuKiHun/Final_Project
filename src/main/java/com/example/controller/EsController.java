package com.example.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpHost;
import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestClient;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.common.unit.TimeValue;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class EsController {
    // Elasticsearch에서 검색할 인덱스 설정
    private String indexName = "cases";

    /**
     * 기능 : 엘라스틱서치와 연동하여 검색 test
     * @return List<Map<String, Object>>
     */
    @GetMapping(value = {"esResult", "esResult/{type}/{keyword}"})
    public List<Map<String, Object>> elasticSearchResult(@PathVariable(required = false) String type, @PathVariable(required = false) String keyword){
        System.out.println("type : "+type+", keyword : "+keyword);

        RestHighLevelClient client = new RestHighLevelClient(
                RestClient.builder(new HttpHost("114.207.167.79", 9200, "http")));
        List<Map<String, Object>> result = new ArrayList<>();

        // 검색 쿼리 설정
        SearchSourceBuilder sourceBuilder = new SearchSourceBuilder();
        String sort = null;

        if (keyword == null && type == null){
            // 전체 검색
            sourceBuilder.query(QueryBuilders.matchAllQuery());
        } else {
                //사건명
            if (type.equals("name")) {
                sort = "사건명";
                // 판례번호
            } else if (type.equals("number")) {
                sort = "판례일련번호";
                // 선고일자
            } else if (type.equals("date")) {
                sort = "선고일자";
                // 법원명
            } else if (type.equals("court")) {
                sort = "법원명";
            }
            sourceBuilder.query(QueryBuilders.matchQuery(sort, keyword));
        }
        sourceBuilder.timeout(TimeValue.timeValueSeconds(1)); // 1초 타임아웃

        // 검색 요청 설정
        SearchRequest searchRequest = new SearchRequest(indexName);
        searchRequest.source(sourceBuilder);
        
        try {
            // Elasticsearch에 검색 요청 보내고 응답 받기
            SearchResponse searchResponse = client.search(searchRequest, RequestOptions.DEFAULT);

            // 검색 결과 처리
            SearchHits hits = searchResponse.getHits();
            System.out.println("total hits : "+hits.getTotalHits());

            for (SearchHit hit : hits){
//                String index = hit.getIndex();
//                String id = hit.getId();
                Map<String, Object> source = hit.getSourceAsMap();
                result.add(source);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            // 클라이언트 종료
            try {
                client.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return result;
    }
}