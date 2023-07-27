package com.kosmo.springapp.qnabbs.service.impl.board;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LikeBoardMapper {

	void insertLike(String id, int no);

    void deleteLike(String id, int no);

    int getLike(String id, int no);

    int getTotalLikes(int no);
    
    boolean toggleLike(String id, int no);
}
