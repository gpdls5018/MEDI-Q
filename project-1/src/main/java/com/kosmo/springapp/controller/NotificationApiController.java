package com.kosmo.springapp.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.kosmo.springapp.model.MemberDTO;
import com.kosmo.springapp.service.NotificationService;

@RestController
public class NotificationApiController {

	//푸시 알림은 사용자와 서버가 서로 주고받는 과정으로 통신하는게 아니라 
	//서버에서 일방적으로 사용자에게 보내줘야 한다. 
	//따라서 사용자의 토큰을 서버가 관리하고 있어야 한다.
	
    private final NotificationService notificationService;

    public NotificationApiController(NotificationService notificationService) {
        this.notificationService = notificationService;
    }

    //사용자가 로그인 된후 Firebase에게 전달받은 token 값을 웹서버에게 등록한다.
    @PostMapping("/register")
    public ResponseEntity register(@RequestBody String token, MemberDTO member) {
        notificationService.register(member.getId(), token);
        return ResponseEntity.ok().build();
    }
 
}
