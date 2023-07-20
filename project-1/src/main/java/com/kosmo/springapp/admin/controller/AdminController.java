package com.kosmo.springapp.admin.controller;

import org.springframework.web.bind.annotation.GetMapping;

public class AdminController {

	
	@GetMapping("/NutrientToFoodDetail.do")
	public String nutrientToFoodDetail() {
		
		
	    return "admin/AdminMain";
	}
}
