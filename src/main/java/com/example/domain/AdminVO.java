package com.example.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminVO {
	
	
	//공지사항 게시판
	private int no;
    private int 	board_idx;            //일련번호
    private String 	board_title;          //제목
    private String  board_register_date;  //등록일
    private String  board_modify_date;    //수정일
    private String  board_content;        //내용
    private int     board_IsSelected;     //답변 채택 여부
    private String  board_sort;           //게시물종류
    private String  user_id;              //유저아이디
    private int     field_idx;            //법 분야 일련번호
    private int     board_count;          //조회수

    

    /**
     * @return int return the no
     */
    public int getNo() {
        return no;
    }

    /**
     * @param no the no to set
     */
    public void setNo(int no) {
        this.no = no;
    }

}
