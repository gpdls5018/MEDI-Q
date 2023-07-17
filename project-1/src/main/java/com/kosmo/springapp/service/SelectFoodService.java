package com.kosmo.springapp.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kosmo.springapp.model.AvgStarScoreCountDTO;
import com.kosmo.springapp.model.CheckWordDTO;
import com.kosmo.springapp.model.FunctionalFoodListDTO;

@Service
public interface SelectFoodService {
	List<AvgStarScoreCountDTO> selectFoodListFromNameScore(String foodname);
	List<FunctionalFoodListDTO> selectFoodListFromName(String foodname);
	List<AvgStarScoreCountDTO> selectFoodListFoodScore();
	List<String> RankingKeyWord();
	List<CheckWordDTO> checkWord(String foodname);
	void newWord(String foodname);
	void selectKeyWord(String foodname);
}
