package com.kosmo.springapp.service;

import java.time.DayOfWeek;
import java.time.LocalDateTime;
import java.time.format.TextStyle;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ExecutionException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;

import com.kosmo.springapp.model.MemberDTO;
import com.kosmo.springapp.model.NotificationRequest;
import com.kosmo.springapp.service.impl.TakeFoodAlarmServiceImpl;

@Service
public class NotificationService {

	@Autowired
	private JWTokensService jwTokensService;
	@Autowired 
	private FCMService fcmService;
	@Autowired
	private TakeFoodAlarmServiceImpl takeFoodAlarmServiceImpl;
	
	@Value("${secret-key}")
	private String secretKey;
	@Value("${token-name}")
	private String tokenName;
	
    private final Map<String, Object> tokenMap = new HashMap<>();
 
    //사용자의 Id값을 Key, 토큰 값을 Value로 갖는 Map을 사용해서 토큰 값을 관리한다.
    public void register(final String userId, final String fcmtoken, HttpServletRequest req, HttpServletResponse resp) {
        String loginToken = jwTokensService.getToken(req, tokenName);
    	boolean isLogin = jwTokensService.verifyToken(loginToken, tokenName, secretKey, req, resp);
    	List<Map> alarms = takeFoodAlarmServiceImpl.selectById(userId);
    	String foodname = "";
    	String foodtime = "";
    	
    	for(Map alarm : alarms) {
    		
    	}
    	System.out.println("alarm: "+alarms);
    	
    	tokenMap.put(userId, fcmtoken);
    	tokenMap.put("loginToken", loginToken);
    	tokenMap.put("isLogin", isLogin);
    }
    
    public void sendNotification(final NotificationRequest request) {
        try {
            fcmService.send(request);
        } catch (InterruptedException | ExecutionException e) {
            System.out.println(e.getMessage());
        }
    }
    
    @Scheduled(cron = "0 */5 * * * *")
    public void test() {
		//현재 시간 분단위로 뽑아서 등록된 복용시간이랑,id 일치할 때 알림 띄워야함
		//토큰도 필요함??????????????????????????
    	LocalDateTime date = LocalDateTime.now();
    	DayOfWeek dayOfWeek = date.getDayOfWeek();
    	String week = dayOfWeek.getDisplayName(TextStyle.SHORT,Locale.KOREAN);
    	System.out.println("요일: "+week);
    	
    	
    	
		String c =LocalDateTime.now().toString();
		String current = c.substring(0,c.lastIndexOf(":")); //현재 시간
		System.out.println("현재시간: "+current);
		
		//사용자 알람시간
		String alam = LocalDateTime.of(2023,7,24,19,55).toString().split("\\.")[0];
		//System.out.println("test: "+alam);
		if(alam.equals(current)) {
			createReceiveNotification();
		}		
	}
    
    private void createReceiveNotification() {
        if ("true".equals(tokenMap.get("isLogin").toString())) {
        	String id = jwTokensService.getTokenPayloads(tokenMap.get("loginToken").toString(),secretKey).get("sub").toString();

        	NotificationRequest notificationRequest = NotificationRequest.builder()
                    .title("MEDI-Q")
                    .token(tokenMap.get(id).toString())
                    .message("고려비타민 정 복용시간입니다")
                    .icon("../images/mainicon.png")
                    //.timestamp(timestamp)
                    .build();
            sendNotification(notificationRequest);
        }
    }
    
    /*
    @PostMapping("/logout")
    public ResponseEntity logout(MemberDTO member, HttpSession httpSession) {
        loginService.logout(member.getId());
        NotificationService.deleteToken(member.getId());
        httpSession.removeAttribute(to);
        return ResponseEntity.ok().build();
    }
    */
}
