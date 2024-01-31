package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.CounselVO;
import com.example.service.CounselService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("follaw/counsel")
public class CounselReplyController {

    @Autowired
    CounselService counselService;

    //지식인 답글 작성하기
    @ResponseBody
    @RequestMapping("/insertCounselReply")
    public void insertCounselReply(@RequestParam("board_reply_content") String board_reply_content, @RequestParam("board_idx") Integer board_idx, HttpSession session){
        
        //변호사 아이디 세션에서 가져오기
        String lawyer_id = (String) session.getAttribute("lawyer_id");
        System.out.println("CounselReplyController >>> insertCounselReply / lawyer_id : " + lawyer_id);

        CounselVO vo = new CounselVO();
        vo.setBoard_reply_content(board_reply_content);
        vo.setLawyer_id(lawyer_id);
        vo.setBoard_idx(board_idx);

        System.out.println("CounselController >>> insertCounselReply / vo : " + vo);
        counselService.insertCounselReply(vo);
        
    }

    //지식인 답글 수정하기
    @ResponseBody
    @RequestMapping("/updateCounselReply")
    public void updateCounselReply(@RequestParam("board_idx") Integer board_idx, @RequestParam("board_reply_content") String board_reply_content, @RequestParam("lawyer_id") String lawyer_id){
        CounselVO Cvo = new CounselVO();
        Cvo.setBoard_idx(board_idx);
        Cvo.setBoard_reply_content(board_reply_content);
        Cvo.setLawyer_id(lawyer_id);

        System.out.println("CounselController >>> updateCounselReply / Cvo : " + Cvo);
        counselService.updateCounselReply(Cvo);     
    }

}
