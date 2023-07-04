package com.kosmo.springapp.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.springapp.model.FunctionalFoodListDTO;
import com.kosmo.springapp.service.impl.MainPageServiceImpl;



@Controller
public class FoodDetailController {
	
	 @Autowired
	 MainPageServiceImpl mainPageService;
	
	 @GetMapping("/detail.do")
	 public String detailPage(Model model, Map map, @RequestParam String no) {
		   map.put("no",Integer.parseInt(no));
		   FunctionalFoodListDTO listOne = mainPageService.selectFoodOneByNo(map);
		   model.addAttribute("listOne",listOne);
		   return "Detail";
	 }
}
