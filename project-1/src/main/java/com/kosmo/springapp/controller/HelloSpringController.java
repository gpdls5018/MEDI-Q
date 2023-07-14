package com.kosmo.springapp.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kosmo.springapp.model.AvgStarScoreCountDTO;
import com.kosmo.springapp.model.FunctionalFoodListDTO;
import com.kosmo.springapp.service.MainPageService;
import com.kosmo.springapp.service.impl.MainPageServiceImpl;
import com.kosmo.springapp.service.impl.SelectFoodServiceImpl;

@Controller 
public class HelloSpringController {
	
	@Autowired
	MainPageServiceImpl mainPageService;
	@Autowired
	SelectFoodServiceImpl selectfoodservice;
	
	@GetMapping("/") 
	public String index(Model model) {
		List<FunctionalFoodListDTO> foodList = mainPageService.selectFoodList();
		List<AvgStarScoreCountDTO> listData = selectfoodservice.selectFoodListFoodScore();
		model.addAttribute("listData", listData);
		model.addAttribute("foodList",foodList);
		return "Index";
	}
}
