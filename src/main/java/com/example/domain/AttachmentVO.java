package com.example.domain;

import lombok.Data;

@Data
public class AttachmentVO {
    private int attach_idx;         // 첨부파일 인덱스
    private String attach_path;     // 첨부파일 경로
    private String attach_name;     // 첨부파일 이름
    private String attach_uuid;     // uuid
    private String attach_ext;      // 확장자
    private String attach_url;      // 첨부파일 url
    private String user_id;         // 유저 아이디
    private String lawyer_id;       // 변호사 아이디
    private int board_idx;          // 질문 인덱스
    private int board_reply_idx;    // 답변 인덱스
}
