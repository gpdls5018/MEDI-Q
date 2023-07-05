package com.kosmo.springapp.controller;

import org.springframework.web.bind.annotation.GetMapping;

public class NutrientSelectController {

	@GetMapping("/NutrientSelect.do")
	public String nutrientselect() {
		return "NutrientSelect";
	}
}
