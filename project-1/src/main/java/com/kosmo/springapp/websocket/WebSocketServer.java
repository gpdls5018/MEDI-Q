package com.kosmo.springapp.websocket;

import java.net.URI;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
/*
import com.kosmo.springapp.model.MemberDTO;
import com.kosmo.springapp.service.JWTokensService;
import com.kosmo.springapp.service.impl.LoginServiceImpl;
*/

//웹소켓 서버
@Component
public class WebSocketServer extends TextWebSocketHandler {
	/*
	//토큰용 아래 3개 주입
	@Autowired
	private JWTokensService jwTokensService;
	@Value("${secret-key}")
	private String secretKey;
	@Value("${token-name}")
	private String tokenName;
	@Autowired
	private LoginServiceImpl loginService;
	*/
	
	//접속한 클라이언트를 저장하기 위한 속성(멤버변수)]
	//키는 웹소켓 세션 아이디
	private Map<String, WebSocketSession> clients = new HashMap<>();

	//클라이언트와 연결이 되었을때 호출되는 콜백 메소드]
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//-컬렉션에 연결된 클라이언트 추가
		clients.put(session.getId(), session);
		System.out.println("clients에 담김"+clients);
		System.out.println(session.getId()+"연결되었습니다11111111.");
		
		//MemberDTO memberDto = loginService.selectOne(req);
		//System.out.println(memberDto.getId());
		//회원인 경우
		/*
		String token= jwTokensService.getToken(req, tokenName);//token을 가져옴
		Map payload = jwTokensService.getTokenPayloads(token, secretKey);//payload로 만듬
		if(payload.get("sub") != null) {//payload는 map형태의 많은 데이터(이건 TRUE)하지만 .get("sub")를 통해 아이디가 있는지 판별(있으면 null이 아님)
			String id=payload.get("sub").toString();//가져온 id를 String id에 저장(현재 로그인한 아이디)
			model.addAttribute("id", id);//모델에 id란 이름으로 id 저장
			
			//작성자가 관리자인지 아닌지 체크, id로 회원정보 가져와서 active 정보 가져옴
			String active=loginService.selectOne(id).getActive();
			//System.out.println("active:"+active);//"Y, A, N 중 하나"
			model.addAttribute("active", active);//model에 active로 저장
		}*/
	}
	
	//클라이언트로부터 메시지를 받았을때 자동 호출되는 콜백 메소드]
	//여기서 클라이언트로 메시지도 보냄(푸쉬)
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println(session.getId()+"로부터 받은 메시지:"+message.getPayload());
		//접속한 모든 클라이언트에게 session.getId()가 보낸 메시지 뿌려주기]
		for(WebSocketSession client:clients.values()) {
			if(!session.getId().equals(client.getId())) {
				//받은 메시지를 그대로 접속한 모든 인원에게 푸쉬
				client.sendMessage(message);
			}
		}
	}
	//클라이언트와 통신장애시 자동으로 호출되는 메소드]
	@Override
	public void handleTransportError(WebSocketSession session, Throwable e) throws Exception {
		System.out.println(session.getId()+"와 통신장애 발생:"+e.getMessage());
	}
	
	//클라이언트와 연결이 끊어졌을때 호출되는 콜백 메소드]
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//-컬렉션에 저장된 클라이언트 삭제
		clients.remove(session.getId());
		System.out.println(session.getId()+"연결이 끊어졌습니다.");
	}
	
	
}
	
