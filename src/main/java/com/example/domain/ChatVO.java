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

    

    /**
     * @return String return the chat_title
     */
    public String getChat_title() {
        return chat_title;
    }

    /**
     * @param chat_title the chat_title to set
     */
    public void setChat_title(String chat_title) {
        this.chat_title = chat_title;
    }

    /**
     * @return String return the chat_pw
     */
    public String getChat_pw() {
        return chat_pw;
    }

    /**
     * @param chat_pw the chat_pw to set
     */
    public void setChat_pw(String chat_pw) {
        this.chat_pw = chat_pw;
    }

    /**
     * @return Date return the chat_created
     */
    public String getChat_created() {
        return chat_created;
    }

    /**
     * @param chat_created the chat_created to set
     */
    public void setChat_created(String chat_created) {
        this.chat_created = chat_created;
    }

    /**
     * @return Date return the chatting_closed
     */
    public String getChatting_closed() {
        return chatting_closed;
    }

    /**
     * @param chatting_closed the chatting_closed to set
     */
    public void setChatting_closed(String chatting_closed) {
        this.chatting_closed = chatting_closed;
    }

    /**
     * @return String return the user_id
     */
    public String getUser_id() {
        return user_id;
    }

    /**
     * @param user_id the user_id to set
     */
    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    /**
     * @return String return the lawyer_id
     */
    public String getLawyer_id() {
        return lawyer_id;
    }

    /**
     * @param lawyer_id the lawyer_id to set
     */
    public void setLawyer_id(String lawyer_id) {
        this.lawyer_id = lawyer_id;
    }

    /**
     * @return String return the user_name
     */
    public String getUser_name() {
        return user_name;
    }

    /**
     * @param user_name the user_name to set
     */
    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    /**
     * @return int return the auth_idx
     */
    public int getAuth_idx() {
        return auth_idx;
    }

    /**
     * @param auth_idx the auth_idx to set
     */
    public void setAuth_idx(int auth_idx) {
        this.auth_idx = auth_idx;
    }

}
