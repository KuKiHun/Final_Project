package com.example.util;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.stream.Stream;

public class PythonRunner {
    public static String runner(String pythonScriptPath, String inputFile){
        Process process=null;
        try {
            // 실행할 파이썬 파일 지정 및 인자로 전달할 파일 지정
            ProcessBuilder processBuilder =
                    new ProcessBuilder("python", pythonScriptPath, inputFile);
            process = processBuilder.start();
            
            // 프로세스 종료 대기
            int exitCode = process.waitFor();
            String output;
            if (exitCode == 0) {
                output = "DB 추가 성공";
            } else {
                output = "DB 추가 실패";
            }
            return output;
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
            return "error";
        } finally {
            if(process != null){
                process.destroy();
                process = null;
            }
        }
    }
}
