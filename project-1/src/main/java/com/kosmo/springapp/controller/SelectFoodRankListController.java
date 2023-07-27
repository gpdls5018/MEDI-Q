package com.kosmo.springapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.springapp.model.AvgStarScoreCountDTO;
import com.kosmo.springapp.model.FunctionalFoodListDTO;
import com.kosmo.springapp.service.MainPageService;
import com.kosmo.springapp.service.impl.SelectFoodServiceImpl;

@Controller
public class SelectFoodRankListController {

	@Autowired
	SelectFoodServiceImpl selectfoodservice;
	
	@GetMapping("/ranking/selectfoodcompany.do")
	public String foodcompany(Model model) {
		List<String> RankingKeyWord = selectfoodservice.RankingKeyWord();
		List<AvgStarScoreCountDTO> listData = selectfoodservice.selectFoodListFoodScore();
		model.addAttribute("RankingKeyWord", RankingKeyWord);
		model.addAttribute("listData", listData);
		model.addAttribute("casesel",3);
		return "ranking/FoodRank";
	}
	
	@GetMapping("/functionfood/selectissue.do")
	public String hselectissue() {
		return "ranking/HealthIssueFood";
	}
	@GetMapping("/functionfood/healthissue.do")
	public String hissue(@RequestParam String healthissue,Model model) {
		List<AvgStarScoreCountDTO> listData = selectfoodservice.selectFoodListFromHealthissue(healthissue);
		List<AvgStarScoreCountDTO> listData2 = selectfoodservice.FoodListFromHealthissue(healthissue);
		System.out.println(listData2.size());
		model.addAttribute("healthissue", healthissue);
		model.addAttribute("listData", listData);
		model.addAttribute("listData2", listData2);
		return "ranking/HealthIssueFood";
	}
	
	@GetMapping("/ranking/selectfoodnutrient.do")
	public String foodnutrient(Model model) {
		List<String> RankingKeyWord = selectfoodservice.RankingKeyWord();
		List<AvgStarScoreCountDTO> listData = selectfoodservice.selectFoodListFoodScore();
		model.addAttribute("RankingKeyWord", RankingKeyWord);
		model.addAttribute("listData", listData);
		model.addAttribute("casesel",2);
		return "ranking/FoodRank";
	}
	
	@GetMapping("/ranking/selectfood.do")
	public String foodrank(Model model) {
		List<String> RankingKeyWord = selectfoodservice.RankingKeyWord();
		List<AvgStarScoreCountDTO> listData = selectfoodservice.selectFoodListFoodScore();
		model.addAttribute("RankingKeyWord", RankingKeyWord);
		model.addAttribute("listData", listData);
		model.addAttribute("casesel",1);
		
		return "ranking/FoodRank";
	}
	////////////////////////////////////////////////////////////////////////
	@GetMapping("/functionfood/select.do")
	public String selectfood(@RequestParam String foodname,Model model) {
		if(selectfoodservice.checkWord(foodname).size() == 0) {
			selectfoodservice.newWord(foodname);
		}
		selectfoodservice.selectKeyWord(foodname);
		List<String> RankingKeyWord = selectfoodservice.RankingKeyWord();
		List<AvgStarScoreCountDTO> listData = selectfoodservice.selectFoodListFromNameScore(foodname,1);
		List<FunctionalFoodListDTO> listData2 = selectfoodservice.selectFoodListFromName(foodname,1);
		
		model.addAttribute("RankingKeyWord", RankingKeyWord);
		model.addAttribute("listData", listData);
		model.addAttribute("listData2", listData2);
		model.addAttribute("foodname", foodname);
		model.addAttribute("casesel", 1);
		return "ranking/FoodRank";
	}
	
	@GetMapping("/functionfood/selectnutrient.do")
	public String selectfoodnutrient(@RequestParam String foodname,Model model) {
		if(selectfoodservice.checkWord(foodname).size() == 0) {
			selectfoodservice.newWord(foodname);
		}
		selectfoodservice.selectKeyWord(foodname);
		List<String> RankingKeyWord = selectfoodservice.RankingKeyWord();
		List<AvgStarScoreCountDTO> listData = selectfoodservice.selectFoodListFromNameScore(foodname,2);
		List<FunctionalFoodListDTO> listData2 = selectfoodservice.selectFoodListFromName(foodname,2);
		
		model.addAttribute("RankingKeyWord", RankingKeyWord);
		model.addAttribute("listData", listData);
		model.addAttribute("listData2", listData2);
		model.addAttribute("foodname", foodname);
		model.addAttribute("casesel", 2);
		return "ranking/FoodRank";
	}
	
	@GetMapping("/functionfood/selectcompany.do")
	public String selectfoodcompany(@RequestParam String foodname,Model model) {
		if(selectfoodservice.checkWord(foodname).size() == 0) {
			selectfoodservice.newWord(foodname);
		}
		selectfoodservice.selectKeyWord(foodname);
		List<String> RankingKeyWord = selectfoodservice.RankingKeyWord();
		List<AvgStarScoreCountDTO> listData = selectfoodservice.selectFoodListFromNameScore(foodname,3);
		List<FunctionalFoodListDTO> listData2 = selectfoodservice.selectFoodListFromName(foodname,3);
		
		model.addAttribute("RankingKeyWord", RankingKeyWord);
		model.addAttribute("listData", listData);
		model.addAttribute("listData2", listData2);
		model.addAttribute("foodname", foodname);
		model.addAttribute("casesel", 3);
		return "ranking/FoodRank";
	}
}
