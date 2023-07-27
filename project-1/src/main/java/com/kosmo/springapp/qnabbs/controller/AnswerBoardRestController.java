package com.kosmo.springapp.qnabbs.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.kosmo.springapp.qnabbs.service.impl.board.AnswerServiceImpl;

@RestController
public class AnswerBoardRestController {

	//AnswerServiceImpl주입
	@Autowired
	private AnswerServiceImpl answerservice;
	
	@DeleteMapping("/board/AnswerDelete.do")
	public Map answerdelete(@RequestBody Map bodymap) {
		
		System.out.println("AnswerBoardController입니다");
		System.out.println("answer_no값 출력:"+bodymap);
		Map map=new HashMap<>();
		//답변글 검색
		System.out.println("답변글 상세보기합니다");
		
		map=answerservice.answerselectOne(bodymap); //삭제될 정보 map에 저장
		System.out.println("map에 들어있는게 뭐야?"+map);
		System.out.println("answer_no값 출력:"+bodymap); //answer_no값
		System.out.println("이제 AnswerServiceImpl로 가세요");
		
		answerservice.answerdelete(bodymap); //(answer_no로)답변글 삭제
		System.out.println("map에 있는거 return전 확인:"+map); //{BOARD_NO=119, POSTDATE=2023-07-27 22:13:09.0, TITLE=asdf, ANSWER_NO=327, CONTENT=asdf, ID=choi, NAME=최승훈}
		return map;
	}
}
