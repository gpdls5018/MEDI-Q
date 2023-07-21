package com.kosmo.springapp.qnabbs.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

//import com.kosmo.springapp.qnabbs.service.AnswerService;
import com.kosmo.springapp.qnabbs.service.DaoService;
import com.kosmo.springapp.qnabbs.service.ListPagingData;
import com.kosmo.springapp.qnabbs.service.PagingUtil;
import com.kosmo.springapp.service.JWTokensService;
import com.kosmo.springapp.service.impl.LoginServiceImpl;




@Controller
@RequestMapping("/board")
public class AnswerBoardController {
	//토큰용 아래 3개 주입
	@Autowired
	private JWTokensService jwTokensService;
	@Value("${secret-key}")
	private String secretKey;
	@Value("${token-name}")
	private String tokenName;
	//service주입
	//@Autowired
	//private AnswerService answerservice;
	
	//loginserviceimpl주입
	@Autowired
	private LoginServiceImpl loginService;
	
	
	//board/View.jsp에서 요청받아 관리자(특정인)가 쓰는 글
	@GetMapping("/AnswerWrite.do")
	public String answerwrite() {
		//뷰에 정보 반환
		return "board/AnswerWrite";
	}
	//글작성후 list.do로 이동(목록으로 이동)
	/*
	@PostMapping("/AnswerWrite.do")
	public String answerwriteProcess(HttpServletRequest req,@RequestParam Map map,Model model) {
		//id란 이름으로 token의 id를 저장
		String id = jwTokensService.getTokenPayloads(jwTokensService.getToken(req, tokenName), secretKey).get("sub").toString();
		//map타입으로 id란 이름으로 id저장
		System.out.println(123);
		map.put("id", id);
		//affect에 글작성이 성공하였다면 (int) 1,실패면 0으로 저장
		int affected = answerservice.insert(map);
		System.out.println(affected);
		//map에 1명의 글 저장 
		//map = answerservice.selectOne(map);
		//글 입력 실패시
		/*if(affected==0) {
			model.addAttribute("InputError","다시 작성해주세요");//아직안함
			return "board/AnswerWrite";
		}*/
		//작성하고 난 뒤 목록페이지로 이동
		//return "board/List"; 
	//}
	
	
	 
	
	
}
