package com.example.service;

import com.example.dao.SystemDAO;
import com.example.domain.SystemVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SystemServiceImpl implements SystemService {
    @Autowired
    SystemDAO systemDAO;
    @Override
    public SystemVO getSystemValue(SystemVO vo) {
//        System.out.println("getSystemValue : "+vo.toString());
        SystemVO result = systemDAO.getSystemValue(vo);
//        System.out.println("getSystemValue >> result : "+result.toString());
        return result;
    }
}
