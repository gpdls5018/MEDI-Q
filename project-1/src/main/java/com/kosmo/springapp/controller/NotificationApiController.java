package com.kosmo.springapp.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.kosmo.springapp.model.MemberDTO;
import com.kosmo.springapp.model.NotificationRequest;
import com.kosmo.springapp.service.JWTokensService;
import com.kosmo.springapp.service.NotificationService;

@RestController
public class NotificationApiController {

	//푸시 알림은 사용자와 서버가 서로 주고받는 과정으로 통신하는게 아니라 
	//서버에서 일방적으로 사용자에게 보내줘야 한다. 
	//따라서 사용자의 토큰을 서버가 관리하고 있어야 한다.
	
    private final NotificationService notificationService;
    @Autowired
    private JWTokensService jwTokensService;
    @Value("${token-name}")
	private String tokenName;
    @Value("${secret-key}")
	private String secretKey;

    public NotificationApiController(NotificationService notificationService) {
        this.notificationService = notificationService;
    }

    //사용자가 로그인 된후 Firebase에게 전달받은 token 값을 웹서버에게 등록한다.
    @PostMapping("/webpush")
    public ResponseEntity register(@RequestBody String token, HttpServletRequest req) throws ParseException {//복용 영양제명, 알람 시간 받아야함
    	String id = jwTokensService.getTokenPayloads(jwTokensService.getToken(req, tokenName),secretKey).get("sub").toString();
        notificationService.register(id,token);
        if (token != null) {//fcm토큰 유무로 로그인 판단하자
        	/*
        	SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        	Calendar cal = Calendar.getInstance();
        	cal.set(2023, 7-1, 23, 22, 18); //년,월,일,시,분
        	long timestamp = cal.getTimeInMillis();
        	//timestamp = timestamp*1000;
        	Date date = new Date(timestamp);
        	String stime = dateformat.format(date);
        	System.out.println("//////////////////////////timestamp: "+timestamp);
        	System.out.println("//////////////////////////stime: "+stime);
        	*/
            NotificationRequest notificationRequest = NotificationRequest.builder()
                .title("MEDI-Q")
                .token(token)
                .message("고려비타민 정 복용시간입니다")
                .icon("../images/mainicon.png")
                //.timestamp(timestamp)
                .build();
            notificationService.sendNotification(notificationRequest);
        }
        return ResponseEntity.ok().build();
    }
 
}
