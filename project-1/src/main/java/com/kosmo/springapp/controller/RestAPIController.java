package com.kosmo.springapp.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.client.DefaultResponseErrorHandler;
import org.springframework.web.client.RestTemplate;

@RestController
@RestControllerAdvice
public class RestAPIController {
	
	@Autowired
	RestTemplate restTemplate;
	@PostMapping("/loadHealthInfoByOCR.do")
	public Map ocr(@RequestParam String base64) {
		restTemplate.setRequestFactory(new HttpComponentsClientHttpRequestFactory());
	    restTemplate.setErrorHandler(new DefaultResponseErrorHandler() {
	      @Override
	      public boolean hasError(ClientHttpResponse response) throws IOException {
	        HttpStatus status = response.getStatusCode();
	        return status.series() == HttpStatus.Series.SERVER_ERROR;
	      }
	    });

	    HttpHeaders headers = new HttpHeaders();
	    headers.add("Authorization", "Bearer ya29.a0AbVbY6PUufo974D2-dovW31L_JAFK1H2xIsPXsgG1dh0hMnOa1ch-QzBTfbr7eA9EiSjtLcMpiEzIl7GJxS7WyNsQJSoAobI9KIvNWI0d-J7rL_2nxhdH0YXDKaRDJBU0gGPuB3rL-a9EDItQXIi1t1laq_OqSR0lu-ANIJ-8aikC6bpmmbuyKBw5oNKEmKvpA_9C_3Sm4J88C0LOd6cwyIqCMlMACWlNGfVxp1Af4cXChvioShXYfw3NF3Yme2verEaRYcR3HotlLE-UaKVKIh8HA73SrjArlvBMVgSmRWNov_Sr8VdO1h38h60nQMlRjWp9d5EMsvu0wxwrwbcvNJsKS_bN1QE83m5B5wGsklG25NHvG5a5hFmtoUN7kwquMxuYXCLXgbxUqeQYOAVJP5umqX7aCgYKAeUSARASFQFWKvPlCp0mbgg9bhw0eBrSKpKG5g0419");
	    headers.add("x-goog-user-project", "sonic-trail-391102");
	    headers.add("Content-Type", "application/json;charset=utf-8");
	    headers.add("Accept-Language","ko-KR");


	    Map<String, List> requestBody = new HashMap<>();
	    List value = new Vector<>();

	    Map map = new HashMap<>();
	    Map imageValue = new HashMap<>();
	    imageValue.put("content", base64);
	    map.put("image", imageValue);

	    List featureValue = new Vector<>();
	    Map featureMap = new HashMap<>();
	    featureMap.put("type", "TEXT_DETECTION");
	    featureValue.add(featureMap);

	    map.put("features", featureValue);
	    value.add(map);
	    requestBody.put("requests",value);

	    HttpEntity entity = new HttpEntity(requestBody,headers);

	    String url = "https://vision.googleapis.com/v1/images:annotate";

	    //외부 OPEN API(구글) 서버로부터 받은 데이터 타입이 {} 인 경우 Map 혹은 DTO, [{},{},{},..]인 경우 List<Map 혹은 DTO>

	    ResponseEntity<Map> responseEntity = restTemplate.exchange(
	            url,//요청 URL
	            HttpMethod.POST, //요청 메소드
	            entity,//HttpEntity(요청 바디와 요청 헤더
	            Map.class //응답 데이터가 {} 일 때
	    );
	    return responseEntity.getBody();
	}
}
