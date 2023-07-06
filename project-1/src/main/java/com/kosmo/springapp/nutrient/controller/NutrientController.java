package com.kosmo.springapp.nutrient.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kosmo.springapp.nutrient.service.NutrientData;
import com.kosmo.springapp.nutrient.service.NutrientSelectService;
import com.kosmo.springapp.nutrient.service.impl.NutrientSelectMapper;

@Controller
public class NutrientController {

	@Autowired
	private NutrientSelectMapper nutrietnSelectMapper;
	
	@GetMapping("/NutrientSelect.do")
	public String nutrientselect(Model model) {
		
		List<String> nutrientNames = nutrietnSelectMapper.selectName();
		model.addAttribute("nutrientNames",nutrientNames);
		return "nutrient/NutrientSelect";
	}
	
	@GetMapping("/NutrientDetail.do")
	public String nutrientdetail() {
		
		return "nutrient/NutrientDetail";
	}
}
