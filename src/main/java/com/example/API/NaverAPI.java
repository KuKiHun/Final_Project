 package com.example.API;

 import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

 @Component
 public class NaverAPI {
     @Value("${naver.client.id}")
     private String clientId;

     @Value("${naver.client.secret}")
     private String clientSecret;

     @Value("${naver.redirect.uri}")
     private String redirectUri;

     public String getAccessToken(String code, String state) {
        String accessToken = "";
        String reqURL = "https://nid.naver.com/oauth2.0/token";
    
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
    
            String requestBody = "grant_type=authorization_code" +
                    "&client_id=" + clientId +
                    "&client_secret=" + clientSecret +
                    "&code=" + code +
                    "&state=" + state +
                    "&redirect_uri=" + redirectUri;
    
            conn.setDoOutput(true);
    
            try (BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()))) {
                bw.write(requestBody);
                bw.flush();
            } catch (IOException e) {
                e.printStackTrace();
            }
    
            int responseCode = conn.getResponseCode();
            System.out.println("[NaverAPI.getAccessToken] responseCode = " + responseCode);
    
            try (BufferedReader br = new BufferedReader(new InputStreamReader(
                    (responseCode >= 200 && responseCode <= 300) ? conn.getInputStream() : conn.getErrorStream()))) {
    
                String line;
                StringBuilder responseSb = new StringBuilder();
                while ((line = br.readLine()) != null) {
                    responseSb.append(line);
                }
                String result = responseSb.toString();
                System.out.println("response body=" + result);
    
                JsonParser parser = new JsonParser();
                JsonElement element = parser.parse(result);
    
                accessToken = element.getAsJsonObject().get("access_token").getAsString();
            } catch (IOException e) {
                e.printStackTrace();
            }
    
            return accessToken;
        } catch (Exception e) {
            e.printStackTrace();
        }
    
        return accessToken;
    }
    
    public String getUserInfo(String accessToken) {
        String account_email = null;
        String reqUrl = "https://openapi.naver.com/v1/nid/me";
    
        try {
            URL url = new URL(reqUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Authorization", "Bearer " + accessToken);
    
            int responseCode = conn.getResponseCode();
            System.out.println("[NaverAPI.getUserInfo] responseCode :" + responseCode);
    
            try (BufferedReader br = new BufferedReader(new InputStreamReader(
                    (responseCode >= 200 && responseCode <= 300) ? conn.getInputStream() : conn.getErrorStream()))) {
    
                String line;
                StringBuilder responseSb = new StringBuilder();
                while ((line = br.readLine()) != null) {
                    responseSb.append(line);
                }
                String result = responseSb.toString();
    
                System.out.println("responseBody (Naver API 응답) = " + result);
    
                JsonElement el = JsonParser.parseString(result);
                //account_email = el.getAsJsonObject().get("response").getAsJsonObject().get("email").getAsString();
                account_email = el.getAsJsonObject().get("email").getAsString();
            } catch (IOException e) {
                e.printStackTrace();
            }
    
            return account_email;
        } catch (Exception e) {
            e.printStackTrace();
        }
    
        return account_email;
    }

     public void naverLogout(String accessToken) {
         // 네이버 로그아웃 API 호출 로직을 추가해야 합니다.
         // 해당 API가 존재하지 않는다면 로그아웃을 처리할 수 없습니다.
         System.out.println("Naver Logout Not Implemented");
     }

     public Object getNaverApiKey() {
         throw new UnsupportedOperationException("Unimplemented method 'getNaverApiKey'");
     }

     public Object getNaverRedirectUri() {
         throw new UnsupportedOperationException("Unimplemented method 'getNaverRedirectUri'");
     }

 	public String getUserInfo(String accessToken, String naverUserInfoEndpoint) {
 		// TODO Auto-generated method stub
 		return null;
 	}

 	public String getAccessToken1(String naverTokenEndpoint, String requestBody) {
 		// TODO Auto-generated method stub
 		return null;
 	}
 }
