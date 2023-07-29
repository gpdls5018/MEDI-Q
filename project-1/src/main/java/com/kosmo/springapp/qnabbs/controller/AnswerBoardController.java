package com.kosmo.springapp.qnabbs.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.springapp.qnabbs.service.impl.board.AnswerServiceImpl;
import com.kosmo.springapp.qnabbs.service.impl.board.BoardServiceImpl;
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
	
	@Autowired
	private AnswerServiceImpl answerservice;
	@Autowired
	private LoginServiceImpl loginService;
	@Autowired
	private BoardServiceImpl board;
	
	//board/View.jsp에서 요청받아 폼으로 이동
	@GetMapping("/AnswerWrite.do")
	public String answerwrite(@RequestParam String no,Model model) {
		//뷰에 정보 반환
		System.out.println("답변쓰기 페이지 이동 성공");
		System.out.println("질문글 no : "+no);
		model.addAttribute("no",no);
		return "board/AnswerWrite"; //답변글로 이동
	}//////////////////////////////////////////////

	//board/View.jsp에서 요청받아 관리자(특정인)가 쓰는 글 (작성 처리)
	@PostMapping("/AnswerWrite.do")
	public String answerwriteProcess(HttpServletRequest req,@RequestParam Map map,Model model) {
		
		//작성자 id 필요
		//id란 이름으로 token의 id를 저장
		String id = jwTokensService.getTokenPayloads(jwTokensService.getToken(req, tokenName), secretKey).get("sub").toString();
		System.out.println(123);
		//map타입으로 id란 이름으로 id저장
		map.put("id", id);
		System.out.println("adminid체크:"+id);
		
		//affect에 글작성이 성공하였다면 (int)1, 실패면 0으로 저장
		System.out.println("체크용1");
		System.out.println(map); //map에 {title=김길동입니다, content=asd, no=120, id=choi}
		//입력
		int affected=answerservice.answerinsert(map);
		System.out.println("affected는 0 or 1인 값:"+affected);
		System.out.println("체크용2");
		System.out.println("map에 들어있는 값 : "+map); //map에 {title=김길동입니다, content=asd, no=120, id=choi}
		model.addAttribute("map", map);

		//글 입력 실패시
		if(affected==0) {
			System.out.println("affected:"+affected);
			//model.addAttribute("InputError","다시 작성해주세요");//아직안함
			System.out.println("작성에 실패하셨습니다.");
			return "board/AnswerWrite"; 
		}
		//작성하고 난 뒤 목록페이지로 이동
		System.out.println("답변 answercontroller까지 성공 여기이후는 view에서 에러입니다");
	    // /board/View.do핸들러 메서드로 감
		return "forward:/board/View.do"; // 뷰정보 반환 - 상세보기로 처리하는 컨트롤러로 이동
	}//////////////////////////////////////////////
	//View페이지에서 답변글 수정폼으로 이동
	@GetMapping("/AnswerEdit.do")
	public String answeredit(@RequestParam Map map,Model model) {
		
		System.out.println("edit체크용1");
		map=answerservice.answerselectOne(map); //답변글 상세보기
		System.out.println("map에 있는 값:"+map);
		System.out.println("edit체크용2");
		System.out.println("map에 있는 거 체크:"+map);
		model.addAttribute("record", map); 
		System.out.println("editmodel의 값 확인:"+model); //{record={BOARD_NO=120, POSTDATE=2023-07-27 21:57:32.0, TITLE=김길동입니다, ANSWER_NO=326, CONTENT=asd, ID=choi, NAME=최승훈}}
		return "board/AnswerEdit"; //답변글 수정폼으로 이동
	}//////////////////////////////////////////////
	//답변글 수정처리
	@PostMapping("/AnswerEdit.do")
	public String answereditProcess(@RequestParam Map map,Model model) {
		System.out.println("map에 있는게 무엇인가?"+map);
		int affected=answerservice.answerupdate(map); //답변글 수정처리
		if(affected==0) {
			System.out.println("이게 출력됬다면 edit실패입니다!");
			model.addAttribute("inputError", "입력 오류입니다. 다시 입력해주세요");
	        //model.addAttribute("record", map);
	        return "board/AnswerEdit"; //다시 답변 수정 폼으로 이동
		}
		System.out.println("여기 이후로는 view문제입니다");
		return "forward:/board/View.do"; // 뷰정보 반환 - 상세보기로 처리하는 컨트롤러로 이동
	}////////////////////////////////////////////////
}

