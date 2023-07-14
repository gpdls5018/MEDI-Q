package com.kosmo.springapp.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kosmo.springapp.model.AvgStarScoreCountDTO;
import com.kosmo.springapp.model.FunctionalFoodListDTO;

@Mapper
public interface SelectFoodMapper {

	List<AvgStarScoreCountDTO> selectFoodListFromNameScore(String foodname);
	List<FunctionalFoodListDTO> selectFoodListFromName(String foodname);
	List<AvgStarScoreCountDTO> selectFoodListFoodScore();
}
