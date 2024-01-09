package com.example.controller;

import org.apache.http.HttpHost;
import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestClient;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
public class EsController {
    // Elasticsearch 서버 정보 설정
    private static RestHighLevelClient client = new RestHighLevelClient(
            RestClient.builder(new HttpHost("180.71.139.30", 9200, "http")));

    // Elasticsearch에서 검색할 인덱스 설정
    private static String indexName = "cases"; // 실제 사용하는 인덱스 이름으로 변경

    /**
     * 기능 : 엘라스틱서치와 연동하여 전체 검색 test
     * @return List<Map<String, Object>>
     */
    @GetMapping("esResult")
    public List<Map<String, Object>> elasticSearchResult(){
        List<Map<String, Object>> result = new ArrayList<>();

        // 검색 쿼리 설정
        SearchSourceBuilder sourceBuilder = new SearchSourceBuilder();
        sourceBuilder.query(QueryBuilders.matchAllQuery()); // 여기에 적절한 검색 쿼리를 추가하세요.

        // 검색 요청 설정
        SearchRequest searchRequest = new SearchRequest(indexName);
        searchRequest.source(sourceBuilder);

        try {
            // Elasticsearch에 검색 요청 보내고 응답 받기
            SearchResponse searchResponse = client.search(searchRequest, RequestOptions.DEFAULT);
            // System.out.println(searchResponse);
            // 검색 결과 처리
            // 여기에서 searchResponse를 사용하여 검색 결과를 처리하세요.

            SearchHits hits = searchResponse.getHits();
            System.out.println("total hits : "+hits.getTotalHits());

            for (SearchHit hit : hits){
                String index = hit.getIndex();
                String id = hit.getId();
                Map<String, Object> source = hit.getSourceAsMap();
                result.add(source);
//                float score = hit.getScore();
//                System.out.println("Index : "+index+", id : "+id+", score : "+score);
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
