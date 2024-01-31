package com.example.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ChatVO {
    private String chat_title;
    private String chat_pw;
    private String chat_created;
    private String chatting_closed;
    private String user_id;
    private String lawyer_id;

    private String user_name;
    private int auth_idx;
}
