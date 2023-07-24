package com.kosmo.springapp.qnabbs.service;

import java.util.Map;

public interface AnswerService<T> {
	
	Map answerselectOne(Map map);
	//입력/수정/삭제용
	int answerinsert(Map map);
	int answerupdate(Map map);
	int answerdelete(Map map);
}
