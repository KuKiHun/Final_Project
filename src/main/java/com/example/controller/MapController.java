package com.example.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.CourtsVO;
import com.example.service.CourtsService;

@Controller
@RequestMapping("follaw")
public class MapController {
    
    @Autowired
    private CourtsService courtsService;

    @RequestMapping("/court")
    public void courtMap() {
        
    }

    //법원마커생성 01.10 김모세
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
}
