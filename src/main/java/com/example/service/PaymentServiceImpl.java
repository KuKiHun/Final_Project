package com.example.service;

import com.example.dao.PaymentDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class PaymentServiceImpl implements PaymentService {
    @Autowired
    PaymentDAO paymentDAO;
    @Override
    public List<Map<String, Integer>> getDashboardData() {
        return paymentDAO.getDashboardData();
    }
}
