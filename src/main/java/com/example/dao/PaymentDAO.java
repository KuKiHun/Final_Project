package com.example.dao;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface PaymentDAO {
    public List<Map<String, Integer>> getDashboardData();
}
