package com.kosmo.springapp.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.client.DefaultResponseErrorHandler;
import org.springframework.web.client.RestTemplate;

import com.kosmo.springapp.model.FunctionalFoodListDTO;
import com.kosmo.springapp.service.impl.AndroidServiceImpl;
import com.kosmo.springapp.service.impl.MainPageServiceImpl;

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
	    headers.add("Authorization", "Bearer ya29.a0AbVbY6NOlCKRoEWstD0yaqN5mB-u7fNieEL3gSke82_bu_RMraWaNzWCmOdLF8Odt1Vb6rU2xNwcTJ9d2TkBSrwokvyha9hpYf_px6XDejZpbYmRS9UQ-M6IbQ2-RUgkbRK16oycGl4PlMCbXXZFkEFSYtcq_nH1Q3P8RHUpLeBgeJ0Qv_E5Wz9PjXtTHiRRZEVVvY1g8URwn-27HQXjEMfdTwnK0JnjhWAfLle72xbDRs9eFX0JdkKQoqS9daHFXDboZWZDMgKiSyztpNKOP__NkzeyLfUnkL9lSByqRaBTcIn-cXiMidzLJRv1eFkM_2NPfMaMg1pGCiiiqTCgNHlTTaHwzemXogPY2plcY9FADNj2UtS-wWtDkRPGDc3IWBiSt95qgCIua_iKJE5TBt0aqAaCgYKAQgSARASFQFWKvPl-UVgDW7tuZy2D7BtcCdviQ0417");
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
	
	
	
	
	@Autowired
	private AndroidServiceImpl androidServiceImpl;
	@GetMapping("/androidTest.do/{no}")
	public List<FunctionalFoodListDTO> androidText(@PathVariable(name = "no") String no) {
		return androidServiceImpl.selectFoodList();
	}
}
