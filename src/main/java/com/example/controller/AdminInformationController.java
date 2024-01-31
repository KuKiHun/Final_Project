package com.example.controller;

import com.example.domain.LawsVO;
import com.example.domain.SystemVO;
import com.example.service.LawsService;
import com.example.service.SystemService;
import com.example.util.PythonRunner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;

import static com.example.util.PythonRunner.runner;

@Controller
@RequestMapping("admin/information")
public class AdminInformationController {

    @Autowired
    LawsService lawsService;

    @Autowired
    SystemService systemService;

    @RequestMapping("/{step}")
    public String viewPage(@PathVariable String step) {
        return "admin/information/" + step;
    }

    @RequestMapping(value = {"/laws", "/laws/{act}"})
    public String adminLawManage(@PathVariable(required = false) String act, Model m){
        List<String> sorts = lawsService.getLawsSort();
        m.addAttribute("sorts", sorts);
        if (act != null) {
            m.addAttribute("act", act);
            LawsVO vo = new LawsVO();
            vo.setLaws_act(act);
            m.addAttribute("laws", lawsService.getLawsByAct(vo));
        }
            return "admin/information/laws";
    }

    @PostMapping("/upload")
    public String handleFileUpload(@RequestParam("file") MultipartFile file) {
        try {
            SystemVO vo = new SystemVO();
            vo.setSystem_name("new_law_path");
//            System.out.println(vo.toString());
            SystemVO result = systemService.getSystemValue(vo);
//            System.out.println("result : "+result.toString());
            String uploadDir = result.getSystem_path(); // 파일을 저장할 경로
            String fileName = file.getOriginalFilename(); // 업로드된 파일의 원본 파일명

            Path uploadPath = Path.of(uploadDir); // 저장할 경로를 Path로 변환
            Path filePath = uploadPath.resolve(fileName); // 저장할 파일의 경로
//            System.out.println("filePath : "+filePath.toString());
            System.out.println("filePath : "+result+"/"+fileName);

            // 파일을 지정된 경로로 복사합니다.
            Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
            System.out.println("copy success");

            // 파일 처리 로직
            // 자바에서 파이썬 코드 실행하여 법 정보 등록 | 파일명 그대로 법 명으로 들어감
            SystemVO vo2 = new SystemVO();
            vo2.setSystem_name("add_law_python");
            System.out.println("upload file path : "+String.valueOf(uploadPath)+"/"+fileName);
            runner(systemService.getSystemValue(vo2).getSystem_path(),result.getSystem_path()+"/"+fileName);

            // 파일 처리 후에는 적절한 리다이렉트나 응답을 반환합니다.
            System.out.println("python success");
            return "redirect:laws"; // 파일 처리 후에 리다이렉트하는 예시
        } catch (Exception e) {
            // 파일 처리 중에 예외가 발생한 경우에 대한 처리를 수행합니다.
            // 예를 들어, 오류 페이지를 표시하거나 다른 작업을 수행할 수 있습니다.
            return "redirect:/error"; // 오류 페이지로 리다이렉트하는 예시
        }
    }

    @RequestMapping("/laws/{law_act}/modify")
    @ResponseBody
    public void modifyLaws(@PathVariable String law_act, LawsVO vo){
        vo.setLaws_act(law_act);
        System.out.println("modifyLaws : "+vo.toString());
        lawsService.updateLaws(vo);
    }

    // 아직 미구현, 파이썬으로 법 추가 한 것을 대상으로 테스트 예정
    @RequestMapping("/laws/{law_act}/delete/{laws_idx}")
    @ResponseBody
    public void deleteLaws(@PathVariable String law_act, @PathVariable Integer laws_idx){
        LawsVO vo = new LawsVO();
        vo.setLaws_act(law_act);
        vo.setLaws_idx(laws_idx);
        System.out.println("deleteLaws : "+vo.toString());
//        lawsService.deleteLaws(vo);
    }

    @RequestMapping("/pythonResult")
    public String getPythonResult(){
        return "redirect:/follaw/index";
    }


}
