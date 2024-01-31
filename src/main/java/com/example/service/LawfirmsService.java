package com.example.service;

import java.util.List;

import com.example.domain.AddressVO;
import com.example.domain.LawfirmsVO;

public interface LawfirmsService {
    //법률사무소마커생성 01.11 김모세
    public List<LawfirmsVO> showLOMarker();

    //법률사무소리스트 01.13 김모세
    public List<LawfirmsVO> lawfirmList();

    //법률사무소검색 01.13 김모세
    public List<LawfirmsVO> searchLawfirm(String option, String name);

    //변호사 회원가입 법률사무소리스트 불러오기 01.18 김모세
    public List<LawfirmsVO> signupLawfirm();

    //관리자 법률사무소 상세보기 01.27 김모세
    public LawfirmsVO lawfirmView(LawfirmsVO vo);

    //관리자 법률사무소정보 수정 01.27 김모세
    public int lawfirmUpdate(LawfirmsVO vo);

    //관리자 법률사무소 추가 01.27 김모세
    public void addressInsert(AddressVO Avo);
    public void lawfirmInsert(LawfirmsVO Lvo);

    //관리자 법률사무소 삭제 01.29 김모세
    public void lawfirmDelete(LawfirmsVO Lvo);
    public void addressDelete(AddressVO Avo);
    
}
