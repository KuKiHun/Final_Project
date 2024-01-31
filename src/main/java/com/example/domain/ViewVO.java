package com.example.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ViewVO {

    private int 	view_idx;
    private Date 	view_date;
    private int     board_idx;
    private String  user_id;

    
}
