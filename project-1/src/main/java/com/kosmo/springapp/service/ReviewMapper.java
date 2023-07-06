package com.kosmo.springapp.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.kosmo.springapp.model.FunctionalFoodListDTO;
import com.kosmo.springapp.model.ReviewDTO;

@Mapper
public interface ReviewMapper {

	int registerReview(ReviewDTO reviewDTO);

	FunctionalFoodListDTO selectFoodOneByNo(int no);

	List<ReviewDTO> selectReviewByFoodNo(Map map);
}
