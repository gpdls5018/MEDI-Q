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
	    headers.add("Authorization", "Bearer ya29.a0AbVbY6PL3twKTmRGS3olz--9x1A1bKgKk18pr6FhdFgRVB-ixpkkV3lFQ3wZS_v0PunfBAOKs7HBrfgPCGkXBS6nXBSYEBe1IExZFRhByhmhvWsW72LhC9Baz0_xz0sx-zKRi9hMfWSKXTUBgEqlTQJuFfBtBP1NCoDQUsfwOqV4xWDcuA40mY3cCWItxPPSLNdDB5CW7hejZ_rTe-A16G-KdEj9o-2CL4qX8CE4O2sIo_QUKBEN8KJN8QnVs0r9hXgm4tPDy4I8fzypUc-_KgQH9zIopGFtkA3MUMGWZhFettqSeAtFE2pVlg7XcGVLbuxBiCqtOkodnVYwJTwzn6Aqq245lM2CN_IVS4835WDAJuE8uBHp_67N492HwSs4Pci74oOzviiVLcfYe6e0LL38I0MaCgYKASYSARASFQFWKvPlilQsLgIQUop2dQwp068KHA0418");
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
