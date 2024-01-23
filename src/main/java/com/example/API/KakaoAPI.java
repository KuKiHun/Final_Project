package com.example.API;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.springframework.stereotype.Component;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

//KakaoAPI 클래스 기능
// 1. getAccessToken(String code): 주어진 인증 코드를 사용하여 액세스 토큰을 받아옴
// 2. getUserInfo(String accessToken): 주어진 액세스 토큰을 사용하여 사용자 정보를 가져옴
// 3. kakaoLogout(String accessToken): 주어진 액세스 토큰을 사용하여 카카오 로그아웃을 수행합니다.
@Component
public class KakaoAPI {
	//엑세스 토큰을 받아오는 메서드(인증코드르 매개변수로 받아옴)
	public String getAccessToken(String code) {
		//액세스 토큰을 저장할 변수를 초기화
		String accessToken = ""; 
		String refreshToken = "";
		//액세스 토큰을 받아오기 위한 Kakao API의 엔드포인트 URL을 저장
		//String reqURL = "https://kauth.kakao.com/oauth/autorize";
		String reqURL = "https://kauth.kakao.com/oauth/token";
		try {
			URL url = new URL(reqURL); //요청할 URL 객체 생성
			HttpURLConnection conn = (HttpURLConnection) url.openConnection(); //URL을 통해 연결설정 및 연결객체 생성
			
			//필수 헤더 세팅
			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			conn.setDoOutput(true); //OutputStream으로 POST 데이터를 넘겨주겠다는 옵션.
			
			// conn.setRequestMethod("POST"); // 연결 객체의 요청 방식을 POST로 설정
			// conn.setDoOutput(true); //  출력 스트림을 사용하도록 설정
			
			//연결 객체의 출력 스트림을 BufferedWriter로 생성
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder(); // 파라미터를 저장하기 위한 StringBuilder 객체를 생성
			sb.append("grant_type=authorization_code"); // StringBuilder에 grant_type 파라미터를 추가
			sb.append("&client_id=b03159e7697941a938317bd0edb04c62"); // StringBuilder에 client_id 파라미터를 추가
			sb.append("&redirect_uri=http://localhost:8080/member/kakaoCallback");//StringBuilder에 redirect_uri 파라미터를 추가
			sb.append("&code=").append(code);
			//sb.append("&code="+code); //StringBuilder에 code 파라미터를 추가
			
			bw.write(sb.toString());// BufferedWriter를 사용하여 파라미터를 요청 바디에 작성
			bw.flush();
			
			int responseCode = conn.getResponseCode();//conn.getResponseCode();: 요청에 대한 응답 코드를 받아옴
			System.out.println("[KakaoApi.getAccessToken] responseCode =  = " + responseCode);
			
			//연결 객체의 입력 스트림을 BufferedReader로 생성
			//BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			BufferedReader br;
			if (responseCode >= 200 && responseCode <= 300) {
				br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			String line = "";//읽어온 한 줄의 문자열을 저장할 변수를 초기화
			StringBuilder responseSb = new StringBuilder();

			//String result = "";//응답 결과를 저장할 문자열 변수를 초기화
			//입력 스트림에서 한 줄씩 읽어옵니다. 더 이상 읽을 데이터가 없을 때까지 반복
			while((line = br.readLine()) != null){
            responseSb.append(line);
        	}
			String result = responseSb.toString();
			System.out.println("response body="+result);
			
			JsonParser parser = new JsonParser(); //JSON 파싱을 위한 JsonParser 객체를 생성
			JsonElement element = parser.parse(result); //응답 결과를 JsonElement로 파싱
			
			//JsonElement에서 "access_token" 필드를 추출하여 액세스 토큰으로 저장
			accessToken = element.getAsJsonObject().get("access_token").getAsString();
			refreshToken = element.getAsJsonObject().get("refresh_token").getAsString();

			br.close();//입력 스트림 닫기
			bw.close();//출력 스트림 닫기
		}catch (Exception e) {
			e.printStackTrace();
		}
		return accessToken;// 액세스 토큰을 반환
	}

	//사용자 정보를 가져오는 메서드 선언 (accessToken 을 매개변수로 받아옴)
	public HashMap<String, Object> getUserInfo(String accessToken) {// 사용자 정보를 저장할 HashMap 객체를 생성
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		System.out.println("kakaoAPI userInfo:" + userInfo);
		String reqUrl = "https://kapi.kakao.com/v2/user/me"; //사용자 정보를 가져오기 위한 Kakao API의 엔드포인트 URL을 저장
		try {
			URL url = new URL(reqUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");// 연결 객체의 요청 방식을 POST로 설정
			conn.setRequestProperty("Authorization", "Bearer " + accessToken);//요청 헤더에 액세스 토큰을 설정
			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			
			int responseCode = conn.getResponseCode();//요청에 대한 응답 코드를 받아옴
			System.out.println("[KakaoApi.getUserInfo] responseCode :" + responseCode);
			
			//연결 객체의 입력 스트림을 BufferedReader로 생성
			//BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			BufferedReader br;
        	if (responseCode >= 200 && responseCode <= 300) {
            	br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        	} else {
           		br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
       		}
			String line = "";//읽어온 한 줄의 문자열을 저장할 변수를 초기화
			StringBuilder responseSb = new StringBuilder();
			while((line = br.readLine()) != null){
				responseSb.append(line);
			}		
			String result = responseSb.toString();//응답 결과를 저장할 문자열 변수를 초기화
			//입력 스트림에서 한 줄씩 읽어옴, 더 이상 읽을 데이터가 없을 때까지 반복
			while((line = br.readLine()) != null) {
				result += line; //읽어온 한 줄의 문자열을 결과 변수에 추가
			}
		
			System.out.println("responseBody (kakao API 응답) = "+result);
			
			JsonElement el = JsonParser.parseString(result);
			
			//JsonElement에서 "properties" 필드를 추출하여 JsonObject로 변환
			JsonObject properties = el.getAsJsonObject().get("properties").getAsJsonObject();
			//JsonElement에서 "kakao_account" 필드를 추출하여 JsonObject로 변환
			JsonObject kakaoAccount = el.getAsJsonObject().get("kakao_account").getAsJsonObject();
			System.out.println("카카오 사용자 정보:" + el);
			System.out.println("카카오 어카운트");
			System.out.println("kakaoAccount:" + kakaoAccount);
			// JsonObject에서 "nickname" 필드를 추출하여 아이디로 저장
//			String user_id = properties.getAsJsonObject().get("user_id").getAsString();
			// JsonObject에서 "nickname" 필드를 추출하여 닉네임으로 저장
			// String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			// JsonObject에서 "email" 필드를 추출하여 이메일로 저장
			String account_email = kakaoAccount.getAsJsonObject().get("email").getAsString();
			System.out.println("카카오 이메일");
			System.out.println("account_email:" + account_email);

			//userInfo.put("account_email", account_email);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userInfo;
	}

	//카카오 로그아웃
	public void kakaoLogout(String accessToken) {
		String reqURL = "https://kapi.kakao.com/v1/user/logout";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "Bearer " + accessToken);

			int responseCode = conn.getResponseCode();
			System.out.println("[KakaoApi.kakaoLogout] responseCode : " + responseCode);
			
			//BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			BufferedReader br;
			if (responseCode >= 200 && responseCode <= 300) {
				br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}

			// String result = "";
			String line = "";
			StringBuilder responseSb = new StringBuilder();
			while((line = br.readLine()) != null){
				responseSb.append(line);
			}
			String result = responseSb.toString();
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Object getKakaoApiKey() {
		throw new UnsupportedOperationException("Unimplemented method 'getKakaoApiKey'");
	}

	public Object getKakaoRedirectUri() {
		throw new UnsupportedOperationException("Unimplemented method 'getKakaoRedirectUri'");
	}
}