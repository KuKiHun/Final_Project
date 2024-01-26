package com.example.controller;

import com.example.domain.LawsVO;
import com.example.service.LawsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;

@Controller
@RequestMapping("admin/information")
public class AdminInformationController {

    @Autowired
    LawsService lawsService;

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

    @PostMapping("/newLaw")
    public String handleFileUpload(@RequestParam("file") MultipartFile file) {
        try {
            String uploadDir = "static/files/laws"; // 파일을 저장할 경로
            String fileName = file.getOriginalFilename(); // 업로드된 파일의 원본 파일명

            Path uploadPath = Path.of(uploadDir); // 저장할 경로를 Path로 변환
            Path filePath = uploadPath.resolve(fileName); // 저장할 파일의 경로

            // 파일을 지정된 경로로 복사합니다.
            Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

            // 파일 처리 로직을 추가하세요.
            // 예를 들어, 파일 정보를 데이터베이스에 저장하거나 추가적인 처리를 수행할 수 있습니다.

            // 파일 처리 후에는 적절한 리다이렉트나 응답을 반환합니다.
            return "redirect:/success"; // 파일 처리 후에 리다이렉트하는 예시
        } catch (Exception e) {
            // 파일 처리 중에 예외가 발생한 경우에 대한 처리를 수행합니다.
            // 예를 들어, 오류 페이지를 표시하거나 다른 작업을 수행할 수 있습니다.
            return "redirect:/error"; // 오류 페이지로 리다이렉트하는 예시
        }
    }
}
