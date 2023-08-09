package com.kosmo.springapp.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kosmo.springapp.model.AllFoodDTO;
import com.kosmo.springapp.model.AvgStarScoreCountDTO;
import com.kosmo.springapp.model.CheckWordDTO;
import com.kosmo.springapp.model.FunctionalFoodListDTO;

@Service
public interface SelectFoodService {
	List<AvgStarScoreCountDTO> selectFoodListFromNameScore(String foodname,int casesel);
	List<FunctionalFoodListDTO> selectFoodListFromName(String foodname,int casesel);
	List<FunctionalFoodListDTO> selectFoodListFromNut(String nut);
	List<FunctionalFoodListDTO> healthissuetakefood(String healthissue);
	List<AvgStarScoreCountDTO> selectFoodListFromHealthissue(String healthissue);
	List<AvgStarScoreCountDTO> FoodListFromHealthissue(String healthissue);
	List<AvgStarScoreCountDTO> selectFoodListFoodScore();
	List<AvgStarScoreCountDTO> selectFoodListFoodScoreTop10();
	List<FunctionalFoodListDTO> RecommendationFood(String value);
	int IntakeFood(String no,String ID);
	List<String> RankingKeyWord();
	List<AllFoodDTO> FoodSearch(String food);
	List<CheckWordDTO> checkWord(String foodname);
	String healthIssueCou(String healthissue);
	void newWord(String foodname);
	void selectKeyWord(String foodname);
}
