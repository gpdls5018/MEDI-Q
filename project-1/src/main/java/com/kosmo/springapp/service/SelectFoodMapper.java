package com.kosmo.springapp.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kosmo.springapp.model.AvgStarScoreCountDTO;
import com.kosmo.springapp.model.CheckWordDTO;
import com.kosmo.springapp.model.FunctionalFoodListDTO;

@Mapper
public interface SelectFoodMapper {
	List<AvgStarScoreCountDTO> selectFoodListFromNameScore(String foodname,int casesel);
	List<FunctionalFoodListDTO> selectFoodListFromName(String foodname,int casesel);
	List<FunctionalFoodListDTO> selectFoodListFromNut(String nut);
	List<AvgStarScoreCountDTO> selectFoodListFromHealthissue(String healthissue);
	List<AvgStarScoreCountDTO> FoodListFromHealthissue(String healthissue);
	List<AvgStarScoreCountDTO> selectFoodListFoodScore();
	List<AvgStarScoreCountDTO> selectFoodListFoodScoreTop10();
	List<FunctionalFoodListDTO> RecommendationFood(String value);
	List<String> RankingKeyWord();
	List<CheckWordDTO> checkWord(String foodname);
	String healthIssueCou(String healthissue);
	void newWord(String foodname);
	void selectKeyWord(String foodname);
}
