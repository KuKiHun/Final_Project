package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.domain.BoardVO;
import com.example.domain.CounselVO;
import com.example.domain.ViewVO;
import com.example.service.BoardService;
import com.example.service.CounselService;
import com.example.service.ViewService;

@Controller
@RequestMapping("admin")
public class AdminCounselController {

    @Autowired
    BoardService board_service;

    @Autowired
    ViewService viewService;

    @Autowired
    CounselService counselService;
    
    @RequestMapping("/admin_counselList")
    public void getCounselBoardList(Model m){
        
        //리스트 출력
        BoardVO vo = new BoardVO();
        List<BoardVO> list = board_service.getCounselBoardList(vo);
        System.out.println("CounselController >>> getCounselBoardList / list: " + list );

        m.addAttribute("counselBoardList", list);
    }

    // @RequestMapping("/view/{board_idx}")
    // public String getCounselBoard(@PathVariable int board_idx, Model m){
    //     //조회수
    //     ViewVO Vvo = new ViewVO();
    //     Vvo.setUser_id(user_id);
    //     Vvo.setBoard_idx(board_idx);

    //     Integer view = viewService.getView(Vvo);
    //     System.out.println("CounselController >>> getCounselBoard / view: " + view);

    //     //로그인 안한 사람도 볼 수 있기 때문에 user_id도 조건에 포함
    //     if(view == 0 && user_id != null){
    //         viewService.insertView(Vvo);
    //     }

    //     //해당 인덱스 글 불러오기
    //     BoardVO Bvo = board_service.getCounselBoard(board_idx);
    //     System.out.println("CounselController >>> getCounselBoard / Bvo: " + Bvo);

    //     //지식인 변호사 답변 리스트(1) : board_reply_isSelected=0 인 경우
    //     CounselVO Cvo = new CounselVO();
    //     Cvo.setBoard_idx(board_idx);
    //     List<CounselVO> list = counselService.getCounselReplyList(Cvo);
    //     System.out.println("CounselController >>> getCounselReplyList / list: " + list);

    //     //지식인 변호사 답변 리스트(2) : board_reply_isSelected=1 인 경우
    //     CounselVO Cvo2 = new CounselVO();
    //     Cvo2.setBoard_idx(board_idx);
    //     CounselVO isSelected = counselService.getCounselReplyIsSelected(Cvo2);
    //     System.out.println("CounselController >>> getCounselReplyIsSelected / isSelected: " + isSelected);

    //     m.addAttribute("view", view);
    //     m.addAttribute("counselBoard", Bvo);
    //     m.addAttribute("counselReplyList", list);
    //     m.addAttribute("replyIsSelected", isSelected);

        
    //     return "/admin/admin_counsel";
        
    // }
    
}
