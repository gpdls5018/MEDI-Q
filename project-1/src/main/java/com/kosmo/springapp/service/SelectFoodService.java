package com.kosmo.springapp.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kosmo.springapp.model.AvgStarScoreCountDTO;
import com.kosmo.springapp.model.FunctionalFoodListDTO;

@Service
public interface SelectFoodService {
	List<AvgStarScoreCountDTO> selectFoodListFromNameScore(String foodname);
	List<FunctionalFoodListDTO> selectFoodListFromName(String foodname);
	List<AvgStarScoreCountDTO> selectFoodListFoodScore();
}
