package com.kosmo.springapp.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.kosmo.springapp.model.MemberDTO;
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
    public ResponseEntity register(@RequestBody String token, HttpServletRequest req) {
    	
    	String id = jwTokensService.getTokenPayloads(jwTokensService.getToken(req, tokenName),secretKey).get("sub").toString();
        notificationService.register(id,token);
        System.out.println("///////////"+ResponseEntity.ok().build());
        return ResponseEntity.ok().build();
    }
 
}
