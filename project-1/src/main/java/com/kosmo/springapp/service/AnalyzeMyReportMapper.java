package com.kosmo.springapp.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AnalyzeMyReportMapper {
	
	List<String> selectFoodListForMyTakePurpose(String takePurpose);

	List<String> selectMyFoodList(String takeFood);

	List<String> selectIngredient_list();

	List<String> selectNutrient_list();
}
