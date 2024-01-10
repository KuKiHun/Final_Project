package com.example.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ChatVO {
    private String chat_title;
    private String chat_pw;
    private Date chat_created;
    private Date chatting_closed;
    private String user_id;
    private String lawyer_id;

    private String user_name;
    private int auth_idx;
}
