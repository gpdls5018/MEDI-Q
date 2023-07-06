package com.kosmo.springapp.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kosmo.springapp.model.FunctionalFoodListDTO;
import com.kosmo.springapp.model.ReviewDTO;

@Service
public interface ReviewService {

	int registerReview(Map map);
	FunctionalFoodListDTO selectFoodOneByNo(int no);
	List<ReviewDTO> selectReviewByFoodNo(Map map);
	
}
