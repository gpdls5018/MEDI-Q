package com.kosmo.springapp.qnabbs.service;

import java.util.Map;

public interface AnswerService<T> {
	
	Map answerselectOne(Map paramMap);
	//입력/수정/삭제용
	int answerinsert(Map paramMap);
	int answerupdate(Map paramMap);
	int answerdelete(Map paramMap);
}
