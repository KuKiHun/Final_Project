package com.example.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.BoardVO;
import com.example.domain.CounselVO;
import com.example.domain.LawFieldVO;
import com.example.domain.NewsVO;
import com.example.domain.ViewVO;
import com.example.service.BoardService;
import com.example.service.CounselService;
import com.example.service.LawFieldService;
import com.example.service.ViewService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("follaw/counsel")
public class CounselController {

    @Autowired
	BoardService board_service;

	@Autowired
	ViewService viewService;

    @Autowired
	LawFieldService LawFieldService;

    @Autowired
    CounselService counselService;

	@RequestMapping("/{step}")
	public String viewPage(@PathVariable String step) {
		return "follaw/counsel/" + step;
	}
    //상담신청페이지 이동
    @RequestMapping("/counselWriting")
    public void getLawFieldList(Model m, HttpSession session){

        // 유저 세션 불러오기
        String user_id = (String) session.getAttribute("user_id");
        // System.out.println("CounselController >>> user_id : " + user_id);

        // law_field 에서 리스트 불러오기
        LawFieldVO vo = new LawFieldVO();
        // System.out.println("CounselController >>> vo :" + vo);
        List<LawFieldVO> list = LawFieldService.getLawFieldList(vo);
        // System.out.println("CounselController >>> list :" + list);

        m.addAttribute("lawFieldList", list);
        m.addAttribute("user_id", user_id);

    }

    //지식인 상담 신청
    @ResponseBody
	@RequestMapping("/insertCounselBoard")
	public void insertCounselBoard(@RequestParam("board_title") String board_title, @RequestParam("board_content") String board_content, @RequestParam("field_idx") int field_idx, HttpSession session){

        BoardVO vo = new BoardVO();

        vo.setBoard_title(board_title);
        vo.setBoard_content(board_content);
        vo.setField_idx(field_idx);

        //작성자 아이디 세션에서 가져오기
		String user_id = (String) session.getAttribute("user_id");
		vo.setUser_id(user_id);

        System.out.println("CounselController >>> insertCounselBoard / vo: " + vo );
        
		board_service.insertCounselBoard(vo);

	}

    //지식인 리스트 출력
    @RequestMapping(value= {"/counsel", "/counsel/{page}", "/counsel/{selectedText}/{page}"})
    public String getCounselBoardList(@PathVariable(required = false)Integer page, Model m, @PathVariable(required = false)String selectedText){
        System.out.println("94!!*******************************selectedText : " + selectedText);
        // law_field 에서 리스트 불러오기
        LawFieldVO vo = new LawFieldVO();
        List<LawFieldVO> list = LawFieldService.getLawFieldList(vo);
        System.out.println("96!!CounselController >>> list :" + list);
        m.addAttribute("lawFieldList", list);

        page = page != null ? page-1 : 0;

        //전체리스트
        List<BoardVO> result = board_service.getCounselBoardListPaging(page*10);

        //카테고리 선택 리스트
        if(selectedText != null){
            Map map = new HashMap();
            map.put("page", page*10);
            map.put("field_name", selectedText);
            System.out.println("110!!map : " + map);
            List<BoardVO> cateResult = board_service.getCounselCateBoardListPaging(map);
            System.out.println("112!!CounselController >>>> cateResult : " + cateResult);

            int totalCounsel = board_service.getPagingSizeCate();
            int max = totalCounsel%10 == 0? totalCounsel/10 : totalCounsel/10+1;
            
            //최소범위 1단위
            int rangeMin = page-page%10+1;

            //최대범위 10단위 혹은 최대 값
            int rangeMax = rangeMin+9 > max? max:rangeMin+9;
            List<Integer> pagingList = new ArrayList<Integer>();
            for(int i = rangeMin; i < rangeMax+1; i++){
                pagingList.add(i);
            }
            System.out.println("126!!CounselController >>>> pagingList : " + pagingList);
            m.addAttribute("min", rangeMin-1 < 1 ? 1 : rangeMax-1);
            m.addAttribute("max", rangeMax+1 > max ? max:rangeMax+1);
            m.addAttribute("pagingList", pagingList);
            m.addAttribute("counselTotalList", cateResult);

        }else{
            int totalCounsel = board_service.getPagingSize();
            int max = totalCounsel%10 == 0? totalCounsel/10 : totalCounsel/10+1;
            
            //최소범위 1단위
            int rangeMin = page-page%10+1;

            //최대범위 10단위 혹은 최대 값
            int rangeMax = rangeMin+9 > max? max:rangeMin+9;
            List<Integer> pagingList = new ArrayList<Integer>();
            for(int i = rangeMin; i < rangeMax+1; i++){
                pagingList.add(i);
            }
            System.out.println("126!!CounselController >>>> pagingList : " + pagingList);
            m.addAttribute("min", rangeMin-1 < 1 ? 1 : rangeMax-1);
            m.addAttribute("max", rangeMax+1 > max ? max:rangeMax+1);
            m.addAttribute("pagingList", pagingList);
            m.addAttribute("counselTotalList", result);
        }

        return "/follaw/counsel/counsel";
    }

    //지식인 글 상세보기
    @RequestMapping("/counsel/view/{board_idx}")
    public String getCounselBoard(@PathVariable("board_idx") int board_idx, Model m, HttpSession session){
        // System.out.println("CounselController >>> getCounselBoard / board_idx: " + board_idx );

        //세션에서 아이디 가져오기
        String user_id = (String) session.getAttribute("user_id");
        // String lawyer_id = (String) session.getAttribute("lawyer_id");

        //조회수
        ViewVO Vvo = new ViewVO();
        Vvo.setUser_id(user_id);
        Vvo.setBoard_idx(board_idx);

        Integer view = viewService.getView(Vvo);
        // System.out.println("CounselController >>> getCounselBoard / view: " + view);

        //로그인 안한 사람도 볼 수 있기 때문에 user_id도 조건에 포함
        if(view == 0 && user_id != null){
            viewService.insertView(Vvo);
        }

        //해당 인덱스 글 불러오기
        BoardVO Bvo = board_service.getCounselBoard(board_idx);
        // System.out.println("CounselController >>> getCounselBoard / Bvo: " + Bvo);

        //지식인 변호사 답변 리스트(1) : board_reply_isSelected=0 인 경우
        CounselVO Cvo = new CounselVO();
        Cvo.setBoard_idx(board_idx);
        List<CounselVO> list = counselService.getCounselReplyList(Cvo);
        System.out.println("CounselController >>> getCounselReplyList / list: " + list);

        //지식인 변호사 답변 리스트(2) : board_reply_isSelected=1 인 경우
        CounselVO Cvo2 = new CounselVO();
        Cvo2.setBoard_idx(board_idx);
        CounselVO isSelected = counselService.getCounselReplyIsSelected(Cvo2);
        System.out.println("CounselController >>> getCounselReplyIsSelected / isSelected: " + isSelected);

        m.addAttribute("view", view);
        m.addAttribute("counselBoard", Bvo);
        m.addAttribute("counselReplyList", list);
        m.addAttribute("replyIsSelected", isSelected);

        return "/follaw/counsel/counselWrite";

    }

    //채택버튼 클릭했을 시
    @RequestMapping("/isSelected/{board_idx}/{user_id}/{lawyer_id}")
    public String updateIsSelected(@PathVariable Integer board_idx, @PathVariable String user_id, @PathVariable String lawyer_id){
        //지식인 글 채택여부 
        BoardVO vo = new BoardVO();
        vo.setBoard_idx(board_idx);
        vo.setUser_id(user_id);
        System.out.println("CounselController >>> updateIsSelected / vo: " + vo);
        
        board_service.updateIsSelected(vo);

        //답변 채택여부
        CounselVO Cvo = new CounselVO();
        Cvo.setBoard_idx(board_idx);
        Cvo.setLawyer_id(lawyer_id);

        System.out.println("CounselController >>> updateIsSelected / Cvo: " + Cvo);

        counselService.updateIsSelected(Cvo);

        return "/follaw/counsel/counselWrite";

    }

    //글 수정버튼 클릭 시(문장에 공백이 있어 RESTful 방식보다 post로 보내야 수정 가능)
    @ResponseBody
    @PostMapping("/updateCounselContent")
    public String updateCounselContent(@RequestParam String board_content, @RequestParam String user_id, @RequestParam int board_idx){
        BoardVO vo = new BoardVO();
        vo.setBoard_content(board_content);
        vo.setUser_id(user_id);
        vo.setBoard_idx(board_idx);

        System.out.println("CounselController >>> updateCounselContent / vo: " + vo);
        
        board_service.updateCounselContent(vo);

        return "/follaw/counsel/counselWrite";

    }

    //채택 취소버튼 클릭 시
    @ResponseBody
    @RequestMapping("/cancelSelected/{board_idx}")
    public String cancelSelected(@PathVariable int board_idx){
        //지식인 글 채택 취소
        board_service.cancelSelected(board_idx);

        //답글 채택 취소
        counselService.cancelSelected(board_idx);

        return "/follaw/counsel/counselWrite";

    }
    
}
