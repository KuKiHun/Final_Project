package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.domain.RealLawyerVO;
import com.example.service.RealLawyerService;

@Controller
@RequestMapping("follaw")
public class RealLawyerController {

    @Autowired
    private RealLawyerService realLawyerService;

    // real_lawyer 테이블 실존 변호사 리스트 01.15 김모세
    // 웹 페이지 응답용 메소드
    @RequestMapping("search/lawyer")
    public String realLawyerListPage(RealLawyerVO vo, Model model, @RequestParam(defaultValue = "1") int page) {
        List<RealLawyerVO> realLawyerList;

        // 이름, 소속, 분야 중 하나만 검색일때
        if (vo.getSearchname() != null || vo.getSearchoffice() != null || vo.getSearchfield() != null) {
            realLawyerList = realLawyerService.searchRealLawyer(vo.getSearchname(), vo.getSearchoffice(), vo.getSearchfield());
        }
        // 그 외엔 모두 조회
        else {
            realLawyerList = realLawyerService.realLawyerList();
        }

        //PagedListHoler
        PagedListHolder<RealLawyerVO> lawyerPage = new PagedListHolder<RealLawyerVO>(realLawyerList);
        lawyerPage.setPageSize(50); //페이지당 개수
        lawyerPage.setPage(page - 1); //현재페이지 설정 0부터시작
        List<RealLawyerVO> result = lawyerPage.getPageList(); //현재 페이지에 표시할 게시물 목록

        model.addAttribute("realLawyerList", result);
        model.addAttribute("maxPages", lawyerPage.getPageCount());
        model.addAttribute("currentPages", lawyerPage.getPage() + 1);

        return "follaw/search/lawyer"; // 해당 뷰 페이지 이름으로 수정
    }
    
}
