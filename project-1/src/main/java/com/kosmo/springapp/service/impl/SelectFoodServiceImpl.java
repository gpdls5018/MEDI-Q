package com.kosmo.springapp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.springapp.model.AvgStarScoreCountDTO;
import com.kosmo.springapp.model.CheckWordDTO;
import com.kosmo.springapp.model.FunctionalFoodListDTO;
import com.kosmo.springapp.service.SelectFoodMapper;
import com.kosmo.springapp.service.SelectFoodService;

@Service
public class SelectFoodServiceImpl implements SelectFoodService{

	@Autowired
	SelectFoodMapper mapper;

	@Override
	public List<AvgStarScoreCountDTO> selectFoodListFromNameScore(String foodname,int casesel) {
		return mapper.selectFoodListFromNameScore(foodname,casesel);
	}

	@Override
	public List<AvgStarScoreCountDTO> selectFoodListFoodScore() {
		return mapper.selectFoodListFoodScore();
	}

	@Override
	public List<FunctionalFoodListDTO> selectFoodListFromName(String foodname,int casesel) {
		return mapper.selectFoodListFromName(foodname,casesel);
	}

	@Override
	public List<String> RankingKeyWord() {
		System.out.println(mapper.RankingKeyWord());
		return mapper.RankingKeyWord();
	}

	@Override
	public void selectKeyWord(String foodname) {
		mapper.selectKeyWord(foodname);
	}

	@Override
	public List<CheckWordDTO> checkWord(String foodname) {
		return mapper.checkWord(foodname);
	}

	@Override
	public void newWord(String foodname) {
		mapper.newWord(foodname);
	}

	@Override
	public List<AvgStarScoreCountDTO> selectFoodListFoodScoreTop10() {
		return mapper.selectFoodListFoodScoreTop10();
	}

	@Override
	public List<AvgStarScoreCountDTO> selectFoodListFromHealthissue(String healthissue) {
		return mapper.selectFoodListFromHealthissue(healthissue);
	}

	@Override
	public List<AvgStarScoreCountDTO> FoodListFromHealthissue(String healthissue) {
		return mapper.FoodListFromHealthissue(healthissue);
	}

	@Override
	public String healthIssueCou(String healthissue) {
		return mapper.healthIssueCou(healthissue);
	}

	@Override
	public List<FunctionalFoodListDTO> selectFoodListFromNut(String nut) {
		return mapper.selectFoodListFromNut(nut);
	}

	@Override
	public List<FunctionalFoodListDTO> RecommendationFood(String value) {
		return mapper.RecommendationFood(value);
	}
}
