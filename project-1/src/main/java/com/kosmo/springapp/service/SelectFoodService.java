package com.kosmo.springapp.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

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
	List<String> intakeFoodNo(String formatDate,String ID);
	AllFoodDTO intakeFoodData(String no);
	int IntakeFood(String no,String ID);
	List<AllFoodDTO> FoodSearch(String food);
	List<String> RankingKeyWord();
	List<CheckWordDTO> checkWord(String foodname);
	String healthIssueCou(String healthissue);
	String foodNo(String takefood);
	String checkUserinfo(String ID);
	Map<String, String> userinfo(String ID);
	void newUserinfo(float Fatrate,float Prorate,float Cbhrate,int healthIssueSelect,float dailyCalories,String ID);
	void updateUserinfo(float Fatrate,float Prorate,float Cbhrate,int healthIssueSelect,float dailyCalories,String ID);
	void newWord(String foodname);
	void selectKeyWord(String foodname);
}
