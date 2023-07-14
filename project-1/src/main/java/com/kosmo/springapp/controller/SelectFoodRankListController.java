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
	
	@GetMapping("/ranking/selectfood.do")
	public String foodrank(Model model) {		
		List<AvgStarScoreCountDTO> listData = selectfoodservice.selectFoodListFoodScore();
		model.addAttribute("listData", listData);
		return "ranking/FoodRank";
	}
	
	@GetMapping("/functionfood/select.do")
	public String selectfood(@RequestParam String foodname,Model model) {
		List<AvgStarScoreCountDTO> listData = selectfoodservice.selectFoodListFromNameScore(foodname);
		List<FunctionalFoodListDTO> listData2 = selectfoodservice.selectFoodListFromName(foodname);
		model.addAttribute("listData", listData);
		model.addAttribute("listData2", listData2);
		model.addAttribute("foodname", foodname);
		return "ranking/FoodRank";
	}
}
