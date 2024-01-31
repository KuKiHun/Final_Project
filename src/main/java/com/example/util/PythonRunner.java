package com.example.util;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.stream.Stream;

public class PythonRunner {
    public static void runner(String pythonScriptPath, String inputFile){
        Process process=null;

        System.out.println("PythonRunner [path] : "+pythonScriptPath+" / [file] : "+inputFile);
        try {
            // 실행할 파이썬 파일 지정 및 인자로 전달할 파일 지정
            ProcessBuilder processBuilder = new ProcessBuilder("python", pythonScriptPath, inputFile);
            System.out.println("pythonScriptPath : "+pythonScriptPath);
            System.out.println("inputFile : "+inputFile);
            process = processBuilder.start();
            
            // 파이썬 스크립트의 출력 결과 읽기
            InputStream inputStream = process.getInputStream();
            BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream, StandardCharsets.UTF_8));
            Stream<String> lines = reader.lines();
//            String line;
//            String pythonResult = "실패";
            System.out.println("파이썬 스크립트 결과 출력");
            lines.forEach(System.out::println);
            System.out.println("파이썬 스크립트 결과 출력 종료");

            // 프로세스 종료 대기
            int exitCode = process.waitFor();

            System.out.println("exitCode : "+exitCode);
            if (exitCode == 0) {
                System.out.println("파이썬 코드 실행이 완료되었습니다.");
            } else {
                System.out.println("파이썬 코드 실행 중 오류가 발생했습니다.");
            }
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        } finally {
            if(process != null){
                process.destroy();
                process = null;
            }
        }
    }
}
