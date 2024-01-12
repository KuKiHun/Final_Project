package com.example.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.CourtsVO;
import com.example.domain.LawfirmsVO;
import com.example.service.CourtsService;
import com.example.service.LawfirmsService;

@Controller
@RequestMapping("follaw")
public class MapController {
    
    @Autowired
    private CourtsService courtsService;

    @Autowired
    private LawfirmsService lawfirmsService;

    //법원 리스트 01.11 김모세
    @RequestMapping("/court")
    public void courtList(CourtsVO vo, Model model) {
        List<CourtsVO> court = courtsService.courtList();
        model.addAttribute("courtList",court);
    }

    //법원마커생성 json데이터 01.10 김모세
    @RequestMapping("/courts")
    @ResponseBody
    public ResponseEntity<List<Map<String, Object>>> showcourtMarker() {
        List<CourtsVO> markerList = courtsService.showCourtsMarker();

        List<Map<String, Object>> markers = new ArrayList<>();

        for (CourtsVO courtsVO : markerList) {
            Map<String, Object> marker = new HashMap<>();
            marker.put("courts_name", courtsVO.getCourts_name());
            marker.put("lat", courtsVO.getAddress().getAddress_lat());
            marker.put("lng", courtsVO.getAddress().getAddress_long());
            markers.add(marker);
        }

        return ResponseEntity.ok(markers);
    }

    //법률사무소 단순 페이지 이동 01.11 김모세
    @RequestMapping("/lawoffice")
    public void lawoffice() {
        
    }

    //법률사무소 마커생성 json데이터 01.11 김모세
    @RequestMapping("/lawoffices")
    @ResponseBody
    public ResponseEntity<List<Map<String, Object>>> showLOMarker() {
        List<LawfirmsVO> markerList = lawfirmsService.showLOMarker();

        List<Map<String, Object>> markers = new ArrayList<>();

        for (LawfirmsVO lawfirmsVO : markerList) {
            Map<String, Object> marker = new HashMap<>();
            marker.put("lawfirms_name", lawfirmsVO.getLawfirm_name());
            marker.put("lat", lawfirmsVO.getAddress().getAddress_lat());
            marker.put("lng", lawfirmsVO.getAddress().getAddress_long());
            markers.add(marker);
        }

        return ResponseEntity.ok(markers);
    }
}
