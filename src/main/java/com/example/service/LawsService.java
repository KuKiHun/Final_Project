package com.example.service;

import com.example.domain.LawsVO;

import java.util.List;

public interface LawsService {
    public List<LawsVO> getLawsByAct(LawsVO vo);
    public List<String> getLawsSort();
}
