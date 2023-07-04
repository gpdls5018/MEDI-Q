package com.kosmo.springapp.service.impl;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.springapp.model.MemberDTO;
import com.kosmo.springapp.service.JWTokensService;
import com.kosmo.springapp.service.LoginMapper;
import com.kosmo.springapp.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService<MemberDTO> {

	@Autowired
	private TransactionTemplate template;
	@Autowired
	private JWTokensService jwTokensService;
	@Autowired
	private LoginMapper mapper;

	@Value("${secret-key}")
	private String secretKey;
	@Value("${token-name}")
	private String tokenName;

	@Override
	public boolean isLogin(Map map) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<MemberDTO> selectMember() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberDTO selectOne(Map map) {
		
		return mapper.findMember(map);
	}
	
	public MemberDTO selectOne(HttpServletRequest req, HttpServletResponse resp) {
		String token = jwTokensService.getToken(req, tokenName);
		Map<String, Object> payloads = jwTokensService.getTokenPayloads(token, secretKey);
		String id = payloads.get("sub").toString();
		payloads.put("id", id);
		
		return mapper.findMember(payloads);
	}

	@Override
	public int insert(MemberDTO member) {

		return mapper.save(member);
	}

	@Override
	public int update(MemberDTO info) {
		
		return mapper.update(info);
	}

	@Override
	public int delete(MemberDTO info) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 로그인 시 아이디,비밀번호 일치하는지 확인
	public boolean isMember(Map map) {

		return mapper.findByIdAndPwd(map);
	}

	public boolean idCheck(Map map) {

		return mapper.checkById(map);
	}

	@Autowired
	private EmailServiceImpl emailService;
	
	//아이디,비밀번호 찾기 클릭 시
	public String selectOneIdNPwd(Map map) throws UnsupportedEncodingException, MessagingException {
		String message="";
		MemberDTO dto = mapper.searchIdNPwd(map);
		String mode = map.get("mode").toString();
		String email = map.get("email").toString();
		if(dto!=null) {
			//입력하신 비밀번호로 정보를 전송했습니다
			if ("ID".equals(map.get("mode"))) {// 아이디찾기 클릭 시
				String id = dto.getId();
				//map.put("searchId", id);
				message = emailService.sendMessage(email,id,mode);
			} else {// 비밀번호 찾기 클릭 시
				String pwd = dto.getPassword();
				
				message = emailService.sendMessage(email,pwd,mode);
			}
		}
		return message;
	}

	public String socialLogin(Map userInfo,String accessToken) {
		String email = userInfo.get("email").toString();
		
		// 기존에 소셜로그인으로 로그인한 기록이 있는지 확인(SOCIAL 테이블)
		int visit = mapper.checkBySocial(userInfo);

		if (visit == 0) {// 첫방문O (SOCIAL 테이블에 등록)
			mapper.saveSocial(userInfo);
		}
		// 첫방문x

		// 토큰 생성한 뒤 쿠키에 저장
		Map<String, Object> payloads = new HashMap<>();// 사용자 임의 데이타
		payloads.put("socialInfo", accessToken);

		long expirationTime = 1000 * 60 * 60 * 24; // 토큰의 만료시간 설정

		String token = jwTokensService.createToken(email, secretKey, payloads, expirationTime);
		
		return token;
	}

	//로그인한 회원의 비밀번호와 일치하는지 확인용 메소드
	public boolean isCorrectPassword(Map map) {
		
		return mapper.checkByPassword(map);
	}
}
