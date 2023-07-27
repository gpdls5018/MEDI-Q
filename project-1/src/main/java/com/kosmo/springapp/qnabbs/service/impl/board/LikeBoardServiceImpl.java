package com.kosmo.springapp.qnabbs.service.impl.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.springapp.qnabbs.service.LikeBoardService;


@Service("likeBoardservice")
public class LikeBoardServiceImpl implements LikeBoardService {

	@Autowired
	private LikeBoardMapper mapper;
	
	// 좋아요 추가 또는 취소
	@Override
	public boolean toggleLike(String id, int no) {

		int likeCount = mapper.getLike(id, no);
        if (likeCount > 0) {
            mapper.deleteLike(id, no);
            return false; // 좋아요 취소
        } else {
            mapper.insertLike(id, no);
            return true; // 좋아요 추가
        }
	}
	
	@Override
	public int getLike(String id, int no) {
		return mapper.getLike(id, no);
	}

	@Override
	public int getTotalLikes(int no) {
		System.out.println("like체크용");
		return mapper.getTotalLikes(no);
	}
}
