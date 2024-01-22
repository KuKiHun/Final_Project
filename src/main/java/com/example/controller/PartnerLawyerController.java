package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.domain.PartnerLawyerVO;
import com.example.service.PartnerLawyerService;

@Controller
@RequestMapping("follaw")
public class PartnerLawyerController {

    @Autowired
    private PartnerLawyerService partnerLawyerService;

    //파트너 변호사 리스트 01.18 김모세
    @RequestMapping("search/partner-lawyer")
    public String partnerLawyerList(PartnerLawyerVO vo, Model model, @RequestParam(defaultValue = "1") int page) {
        List<PartnerLawyerVO> partnerLawyerList;
        List<PartnerLawyerVO> powerLawyerList;

        // 이름, 소속 분야 검색 01.20 김모세
        if (vo.getSearchname() != null || vo.getSearchoffice() != null || vo.getSearchfield() != null) {
            partnerLawyerList = partnerLawyerService.searchPartnerLawyer(vo.getSearchname(), vo.getSearchoffice(), vo.getSearchfield());
            powerLawyerList = partnerLawyerService.searchPowerLawyer(vo.getSearchname(), vo.getSearchoffice(), vo.getSearchfield());
        }
        // 그 외엔 모두 조회 01.20 김모세
        else {
            partnerLawyerList = partnerLawyerService.partnerLawyerList();
            powerLawyerList = partnerLawyerService.powerLawyerList();
        }

        // PagedListHoler 01.20 김모세
        PagedListHolder<PartnerLawyerVO> lawyerPage = new PagedListHolder<PartnerLawyerVO>(partnerLawyerList);
        lawyerPage.setPageSize(50); //페이지당 개수
        lawyerPage.setPage(page - 1); //현재페이지 설정 0부터시작
        List<PartnerLawyerVO> result = lawyerPage.getPageList(); //현재 페이지에 표시할 게시물 목록

        model.addAttribute("partnerLawyerList", result);
        model.addAttribute("powerLawyerList", powerLawyerList);
        model.addAttribute("maxPages", lawyerPage.getPageCount());
        model.addAttribute("currentPages", lawyerPage.getPage() + 1);

        return "follaw/search/partner-lawyer";
    }
    
}
