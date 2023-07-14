package com.kosmo.springapp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.springapp.model.AvgStarScoreCountDTO;
import com.kosmo.springapp.model.FunctionalFoodListDTO;
import com.kosmo.springapp.service.SelectFoodMapper;
import com.kosmo.springapp.service.SelectFoodService;

@Service
public class SelectFoodServiceImpl implements SelectFoodService{

	@Autowired
	SelectFoodMapper mapper;
	
	@Override
	public List<AvgStarScoreCountDTO> selectFoodListFromNameScore(String foodname) {
		return mapper.selectFoodListFromNameScore(foodname);
	}

	@Override
	public List<AvgStarScoreCountDTO> selectFoodListFoodScore() {
		return mapper.selectFoodListFoodScore();
	}

	@Override
	public List<FunctionalFoodListDTO> selectFoodListFromName(String foodname) {
		return mapper.selectFoodListFromName(foodname);
	}
	
	
}
