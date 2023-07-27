package com.kosmo.springapp.qnabbs.service;

public interface LikeBoardService {

    int getLike(String id, int no);

    int getTotalLikes(int no);

	boolean toggleLike(String id, int no);
}
