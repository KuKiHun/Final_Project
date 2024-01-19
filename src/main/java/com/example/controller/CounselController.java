package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.BoardVO;
import com.example.domain.CounselVO;
import com.example.domain.LawFieldVO;
import com.example.domain.ViewVO;
import com.example.service.BoardService;
import com.example.service.CounselService;
import com.example.service.LawFieldService;
import com.example.service.ViewService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("follaw")
public class CounselController {

    @Autowired
	BoardService board_service;

	@Autowired
	ViewService viewService;

    @Autowired
	LawFieldService LawFieldService;

    @Autowired
    CounselService counselService;

    //상담신청페이지 이동
    @RequestMapping("/counselWriting")
    public void getLawFieldList(Model m, HttpSession session){

        // 유저 세션 불러오기
        String user_id = (String) session.getAttribute("user_id");
        System.out.println("CounselController >>> user_id : " + user_id);

        // law_field 에서 리스트 불러오기
        LawFieldVO vo = new LawFieldVO();
        System.out.println("CounselController >>> vo :" + vo);
        List<LawFieldVO> list = LawFieldService.getLawFieldList(vo);
        System.out.println("CounselController >>> list :" + list);

        m.addAttribute("lawFieldList", list);
        m.addAttribute("user_id", user_id);

    }

    //지식인 상담 신청
    @ResponseBody
	@RequestMapping("/insertCounselBoard")
	public void insertCounselBoard(@RequestParam("title") String board_title, @RequestParam("content") String board_content, @RequestParam("field_idx") int field_idx, HttpSession session){

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
    @RequestMapping("/counsel")
    public void getCounselBoardList(Model m, HttpSession session){

        //리스트 출력
        BoardVO vo = new BoardVO();
        List<BoardVO> list = board_service.getCounselBoardList(vo);
        System.out.println("CounselController >>> getCounselBoardList / list: " + list );

        m.addAttribute("counselBoardList", list);
    }

    //지식인 글 상세보기
    @RequestMapping("/view/{board_idx}")
    public String getCounselBoard(@PathVariable("board_idx") int board_idx, Model m, HttpSession session){
        System.out.println("CounselController >>> getCounselBoard / board_idx: " + board_idx );

        //세션에서 아이디 가져오기
        String user_id = (String) session.getAttribute("user_id");
        // String lawyer_id = (String) session.getAttribute("lawyer_id");

        //조회수
        ViewVO Vvo = new ViewVO();
        Vvo.setUser_id(user_id);
        Vvo.setBoard_idx(board_idx);

        Integer view = viewService.getView(Vvo);
        System.out.println("CounselController >>> getCounselBoard / view: " + view);

        //로그인 안한 사람도 볼 수 있기 때문에 user_id도 조건에 포함
        if(view == 0 && user_id != null){
            viewService.insertView(Vvo);
        }

        BoardVO Bvo = board_service.getCounselBoard(board_idx);
        System.out.println("CounselController >>> getCounselBoard / Bvo: " + Bvo);

        //지식인 답글 리스트 가져오기
        CounselVO Cvo = new CounselVO();
        Cvo.setBoard_idx(board_idx);
        List<CounselVO> list = counselService.getCounselReplyList(Cvo);
        System.out.println("CounselController >>> getCounselReplyList / list: " + list);

        m.addAttribute("view", view);
        m.addAttribute("counselBoard", Bvo);
        m.addAttribute("CounselReplyList", list);

        return "/follaw/counselWrite";

    }

    //채택버튼 클릭했을 시
    @RequestMapping("/isSelected/{board_idx}/{user_id}/{lawyer_id}")
    public void updateIsSelected(@PathVariable Integer board_idx, @PathVariable String user_id, @PathVariable String lawyer_id){
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

    }
    
}
