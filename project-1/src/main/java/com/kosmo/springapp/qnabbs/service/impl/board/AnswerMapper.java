package com.kosmo.springapp.qnabbs.service.impl.board;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.kosmo.springapp.qnabbs.service.AnswerBoardDTO;

@Mapper
public interface AnswerMapper {
	//상세보기(board/View.jsp)
	Map answerselectOne(Map paramMap);
	//입력
	int answerinsert(Map paramMap);
	//수정
	int answerupdate(Map paramMap);
	//답변만 삭제
	int answerdelete(Map paramMap);
	//질문글 삭제시 답변도 같이 삭제
	int boarddelete(Map paramMap); 
}
