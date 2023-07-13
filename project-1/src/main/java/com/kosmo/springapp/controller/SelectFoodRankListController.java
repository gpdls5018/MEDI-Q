package com.kosmo.springapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.springapp.model.FunctionalFoodListDTO;
import com.kosmo.springapp.service.MainPageService;
import com.kosmo.springapp.service.impl.SelectFoodServiceImpl;

@Controller
public class SelectFoodRankListController {

	@Autowired
	SelectFoodServiceImpl selectfoodservice;
	
	@GetMapping("/ranking/selectfood.do")
	public String foodrank() {
		
		return "ranking/FoodRank";
	}
	
	@GetMapping("/functionfood/select.do")
	public String selectfood(@RequestParam String foodname,Model model) {
		System.out.println(foodname);
		List<FunctionalFoodListDTO> listData = selectfoodservice.selectFoodListFormName(foodname);
		System.out.println(listData.size());
		model.addAttribute("listData", listData);
		model.addAttribute("foodname", foodname);
		return "ranking/FoodRank";
	}
}
