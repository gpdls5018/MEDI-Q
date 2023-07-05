package com.kosmo.springapp.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.kosmo.springapp.model.FunctionalFoodListDTO;

@Service
public interface ReviewService {

	int registerReview(Map map);
	FunctionalFoodListDTO selectFoodOneByNo(int no);
	
}
