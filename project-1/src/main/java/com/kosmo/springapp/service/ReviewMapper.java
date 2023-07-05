package com.kosmo.springapp.service;

import org.apache.ibatis.annotations.Mapper;

import com.kosmo.springapp.model.FunctionalFoodListDTO;
import com.kosmo.springapp.model.ReviewDTO;

@Mapper
public interface ReviewMapper {

	int registerReview(ReviewDTO reviewDTO);

	FunctionalFoodListDTO selectFoodOneByNo(int no);
}
