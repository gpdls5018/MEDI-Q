package com.kosmo.springapp.qnabbs.service.impl.board;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.kosmo.springapp.qnabbs.service.AnswerBoardDTO;

@Mapper
public interface AnswerMapper {
	
	Map answerselectOne(Map paramMap);
	//입력/수정/삭제용
	int answerinsert(Map paramMap);
	int answerupdate(Map paramMap);
	int answerdelete(Map paramMap);
	 
}
