package com.example.service;

import com.example.domain.CounselVO;

public interface CounselService {
    public void insertCounsel(CounselVO vo);

    public void getCounsel(CounselVO vo);

    public void getCounselList(CounselVO vo);
}
