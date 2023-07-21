package com.kosmo.springapp.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;

import com.kosmo.springapp.model.MemberDTO;

@Service
public class NotificationService {

	@Autowired
	private JWTokensService jwTokensService;
	
	@Value("${secret-key}")
	private String secretKey;
	@Value("${token-name}")
	private String tokenName;
	
    private final Map<String, String> tokenMap = new HashMap<>();
 
    //사용자의 Id값을 Key, 토큰 값을 Value로 갖는 Map을 사용해서 토큰 값을 관리한다.
    public void register(final String userId, final String token) {
        tokenMap.put(userId, token);
    }
    /*
    private void createReceiveNotification(HttpServletRequest req, String sender, String receiver) {
    	String token = jwTokensService.getToken(req, tokenName);
    	Map payload = jwTokensService.getTokenPayloads(token, secretKey);
        if (token != null) {//토큰 유무로 로그인 판단하자
            NotificationRequest notificationRequest = NotificationRequest.builder()
                .title("POST RECEIVED")
                .token(notificationService.getToken(payload.get("sub")))
                .message(NotificationType.POST_RECEIVED.generateNotificationMessage(sender, receiver))
                .build();
            notificationService.sendNotification(notificationRequest);
        }
    }

    private void createTaggedNotification(User sender, List<User> receivers) {
        receivers.stream()
            .filter(User::isLogin)
            .forEach(receiver -> {
        		NotificationRequest notificationRequest = NotificationRequest.builder()
                    .title("POST TAGGED")
                    .token(notificationService.getToken(receiver.getId()))
                    .message(NotificationType.POST_TAGGED.generateNotificationMessage(sender, receiver))
                    .build();
                notificationService.sendNotification(notificationRequest);
            });
    }
    
    @PostMapping("/logout")
    public ResponseEntity logout(MemberDTO member, HttpSession httpSession) {
        loginService.logout(member.getId());
        NotificationService.deleteToken(member.getId());
        httpSession.removeAttribute(to);
        return ResponseEntity.ok().build();
    }
    */
}
