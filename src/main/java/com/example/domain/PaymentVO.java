package com.example.domain;

import lombok.Data;

@Data
public class PaymentVO {
    private int pay_idx;
    private String pay_date;
    private String pay_product;
    private int pay_price;
    private String lawyer_id;
    
}
