package com.kosmo.springapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NutrientController {

	@GetMapping("/NutrientSelect.do")
	public String nutrientselect() {
		
		return "nutrient/NutrientSelect";
	}
}
