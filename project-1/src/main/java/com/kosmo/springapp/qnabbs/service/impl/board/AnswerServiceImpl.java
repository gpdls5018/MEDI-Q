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
	public Map answerselectOne(Map map) {
		return mapper.answerselectOne(map);
	}
	
	@Override
	public int answerinsert(Map map) {
		
		int affected=0;
		
		try {
			System.out.println("매퍼에서 오류발생?");
			affected=mapper.answerinsert(map);
			System.out.println(456);
		}
		catch (Exception e) {
			System.out.println("오류났어?");
			e.printStackTrace();
		}
		return affected;
		
	}

	@Override
	public int answerupdate(Map map) {
		int affected=0;
		try {
			System.out.println("mapper에서 전체크");
			affected=mapper.answerupdate(map);
			System.out.println("mapper에서 후체크");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return affected;
	}

	@Override
	public int answerdelete(Map map) {
		System.out.println("answerdelete체크용 전");
		return mapper.answerdelete(map);
	}
}
