package com.kosmo.springapp.qnabbs.service.impl.board;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.springapp.qnabbs.service.AnswerService;

@Service("answerservice")
public class AnswerServiceImpl implements AnswerService {

	@Autowired
	private AnswerMapper mapper;
	//답변글 상세보기(View페이지에서 게시물과 같이 출력됨)
	@Override
	public Map answerselectOne(Map map) {
		return mapper.answerselectOne(map);
	}
	//답변글 작성
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
	//답변글 수정
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
	//답변테이블의 게시물 NO로 삭제
	@Override
	public int boarddelete(Map map) {
		System.out.println("boarddelete체크용 전");
		return mapper.boarddelete(map);
	}
	//답변글의 고유 NO로 삭제(sequence)
	@Override
	public int answerdelete(Map map) {
		System.out.println("AnswerServiceImpl의 answerdelete체크용 전");
		return mapper.answerdelete(map);
	}
}
