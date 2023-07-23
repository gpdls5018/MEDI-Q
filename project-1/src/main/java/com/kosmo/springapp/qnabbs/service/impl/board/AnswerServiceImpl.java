package com.kosmo.springapp.qnabbs.service.impl.board;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.springapp.qnabbs.service.AnswerBoardDTO;
import com.kosmo.springapp.qnabbs.service.AnswerService;

@Service("answerservice")
public class AnswerServiceImpl implements AnswerService {

	@Autowired
	private AnswerMapper mapper;
	
	@Override
	public Map answerselectOne(Map paramMap) {
		return mapper.answerselectOne(paramMap);
	}
	
	@Override
	public int answerinsert(Map paramMap) {
		
		int affected=0;
		
		try {
			System.out.println("매퍼에서 오류발생?");
			affected=mapper.answerinsert(paramMap);
			System.out.println(456);
		}
		catch (Exception e) {
			System.out.println("오류났어?");
			e.printStackTrace();
		}
		return affected;
		
	}

	@Override
	public int answerupdate(Map paramMap) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int answerdelete(Map paramMap) {
		// TODO Auto-generated method stub
		return 0;
	}
}
