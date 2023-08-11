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

import com.kosmo.springapp.service.JWTokensService;

//웹소켓 서버
@Component
public class WebSocketServer extends TextWebSocketHandler {
	
	//토큰용 아래 3개 주입
	@Autowired
	private JWTokensService jwTokensService;
	@Value("${secret-key}")
	private String secretKey;
	@Value("${token-name}")
	private String tokenName;
	
	
	//접속한 클라이언트를 저장하기 위한 속성(멤버변수)]
	//키는 웹소켓 세션 아이디
	private Map<String, WebSocketSession> clients = new HashMap<>();

	//클라이언트와 연결이 되었을때 호출되는 콜백 메소드]
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//-컬렉션에 연결된 클라이언트 추가
		clients.put(session.getId(), session);
		System.out.println(session.getId()+"연결되었습니다.");
		
		//관리자 id 테스트 중
		//1.방법
		//String id = jwTokensService.getTokenPayloads(jwTokensService.getToken(req, tokenName), secretKey).get("sub").toString();
		//2.방법
		/*
		URI uri = session.getUri();
	    String query = uri.getQuery();
	    Map<String, String> queryParameters = parseQueryParameters(query); // 쿼리 파라미터를 파싱하는 메서드 필요
	    String token = queryParameters.get("token");

	    // 토큰을 검증하고 아이디를 추출
	    String id = jwTokensService.getTokenPayloads(token, secretKey).get("sub").toString();
	    */
		//3.방법
		/*
		Map<String, Object> handshakeAttributes = session.getAttributes();
	    ServletServerHttpRequest request = (ServletServerHttpRequest) handshakeAttributes.get("HTTP_REQUEST");
	    HttpHeaders headers = request.getHeaders();
	    String cookie = headers.getFirst(HttpHeaders.COOKIE);

	    String token = parseTokenFromCookie(cookie, "User-Token");
	    
	    // 토큰에서 사용자 ID 확인하기
	    String userId = jwTokensService.getTokenPayloads(token, secretKey).get("sub").toString();

	    if ("KIM".equals(userId)) {
	        // KIM이 관리자이므로 관리자로 처리합니다.
	        // 여기에 필요한 로직을 추가합니다.
	    	System.out.println("아이디가 KIM이면 출력websocket테스트");
	    }*/
		
	}
	/*
	//2번 실험
	//관리자를 받기 위한 추가 테스트
	private Map<String, String> parseQueryParameters(String query) {
	    Map<String, String> parameters = new HashMap<>();
	    for (String param : query.split("&")) {
	        String[] keyValuePair = param.split("=");
	        if (keyValuePair.length > 1) {
	            parameters.put(keyValuePair[0], keyValuePair[1]);
	        }
	    }
	    return parameters;
	}*/
	/*
	// User-Token 쿠키 값을 파싱하는 메소드
	private String parseTokenFromCookie(String cookie, String tokenName) {
	    for (String keyValue : cookie.split(";\\s*")) {
	        String[] pairs = keyValue.split("=");
	        if (pairs.length == 2 && tokenName.equals(pairs[0])) {
	            return pairs[1];
	        }
	    }
	    return null;
	}
	*/
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
	
