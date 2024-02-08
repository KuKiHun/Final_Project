package com.example.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.example.domain.CaseSortVO;
import com.example.domain.ElasticVO;
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
import org.elasticsearch.search.aggregations.AggregationBuilders;
import org.elasticsearch.search.aggregations.bucket.terms.StringTerms;
import org.elasticsearch.search.aggregations.bucket.terms.Terms;
import org.elasticsearch.search.aggregations.bucket.terms.TermsAggregationBuilder;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class EsController {
    // Elasticsearch에서 검색할 인덱스 설정
    private String indexName = "cases";

    /**
     * 기능 : 엘라스틱서치와 연동하여 검색 test
     *
     * @return List<Map < String, Object>>
     */
    @GetMapping(value = {"esResult", "esResult/{page}", "esResult/{type}/{keyword}", "esResult/{type}/{keyword}/{page}"})
    public ElasticVO elasticSearchResult(@PathVariable(required = false) String type, @PathVariable(required = false) String keyword, @PathVariable(required = false) Integer page) {
        ElasticVO esVo = new ElasticVO();
        System.out.println("type : " + type + ", keyword : " + keyword);
//        Integer page = 1;
        if (page == null) {
            page = 1;
            System.out.println("page : " + page);
        } else {
            System.out.println("else page : " + page);
        }

        int size = 10;
//        http://121.162.45.39:51031/
        RestHighLevelClient client = new RestHighLevelClient(
//                RestClient.builder(new HttpHost("114.207.167.79", 9200, "http")));
                RestClient.builder(new HttpHost("121.162.45.39", 51032, "http")));
        List<Map<String, Object>> result = new ArrayList<>();

        // 검색 쿼리 설정
        SearchSourceBuilder sourceBuilder = new SearchSourceBuilder();
        String sort = null;

        if (keyword == null && type == null) {
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
        sourceBuilder.from((page - 1) * size);
        sourceBuilder.size(size);
        sourceBuilder.timeout(TimeValue.timeValueSeconds(1)); // 1초 타임아웃

        // 검색 요청 설정
        SearchRequest searchRequest = new SearchRequest(indexName);
        searchRequest.source(sourceBuilder);

        try {
            // Elasticsearch에 검색 요청 보내고 응답 받기
            SearchResponse searchResponse = client.search(searchRequest, RequestOptions.DEFAULT);

            // 검색 결과 처리
            SearchHits hits = searchResponse.getHits();
            // 검색 결과 출력
            esVo.setEsCount(String.valueOf(hits.getTotalHits()));

            for (SearchHit hit : hits) {
                Map<String, Object> source = hit.getSourceAsMap();
                result.add(source);
            }
            esVo.setEsResult(result);
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
        return esVo;
    }

    // 사건종류명을 리스트로 받아오고, 각 리스트에 해당하는 값을 받아옴
    @GetMapping("getSortAndValue")
    public List<CaseSortVO> getElasticSortAndValue() {

        RestHighLevelClient client = new RestHighLevelClient(
//                RestClient.builder(new HttpHost("114.207.167.79", 9200, "http")));
                RestClient.builder(new HttpHost("121.162.45.39", 51032, "http")));
        // 검색 요청 설정
        SearchRequest searchRequest = new SearchRequest(indexName);
        SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();

        // Size 0 설정
        searchSourceBuilder.size(0);

        // Aggregation 설정
        TermsAggregationBuilder aggregationBuilder = AggregationBuilders.terms("사건종류명")
                .field("사건종류명.keyword");
        searchSourceBuilder.aggregation(aggregationBuilder);

        searchRequest.source(searchSourceBuilder);
        List<CaseSortVO> result = new ArrayList<CaseSortVO>();
        try {
            SearchResponse searchResponse = client.search(searchRequest, RequestOptions.DEFAULT);

            // Aggregation 결과 가져오기
            Terms aggregation = searchResponse.getAggregations().get("사건종류명");
            for (Terms.Bucket bucket : aggregation.getBuckets()) {
                String sortName = bucket.getKeyAsString();
                long count = bucket.getDocCount();
                CaseSortVO vo = new CaseSortVO();
                if (!sortName.trim().equals("")){
                    vo.setCaseSort(sortName);
                    vo.setCaseCount(count);
                    result.add(vo);
                    // 결과 처리
                    System.out.println("사건종류명: " + sortName + ", 개수: " + count);
                }
            }
            if (result == null){
                return null;
            } else {
                return result;
            }

        } catch (IOException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                client.close();
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }
}