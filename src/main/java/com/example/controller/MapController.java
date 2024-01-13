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
    
    // -------------------------------- 법원 --------------------------------------
    //법원 리스트 01.11 김모세 + 01.12 수정 (검색기능 추가)
    @RequestMapping("/court")
    public void courtList(CourtsVO vo, Model model) {
        List<CourtsVO> courtList;
        
        // 지역, 이름 중 하나만 검색일때
        if (vo.getOption() != null || vo.getName() != null) {
            courtList = courtsService.searchCourt(vo.getOption(), vo.getName());
        }
        // 그 외엔 모두 조회
        else {
            courtList = courtsService.courtList();
        }
        model.addAttribute("courtList",courtList);
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

// -------------------------------- 법원 END ---------------------------------------
// -------------------------------- 법률사무소 ---------------------------------------

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

// -------------------------------- 법률사무소 END ---------------------------------------