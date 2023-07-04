package com.kosmo.springapp.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.springapp.model.FunctionalFoodListDTO;
import com.kosmo.springapp.service.impl.MainPageServiceImpl;


@Controller
public class MagazineController {
	
	@Autowired
	MainPageServiceImpl mainPageService;
	
	@GetMapping("/magazine.do")
	  public String magazine(@RequestParam String no,Map map,Model model) {
	    List<FunctionalFoodListDTO> listData = mainPageService.selectFoodList();
	    model.addAttribute("listData",listData);
	    return "slider/Magazine"+no;
	  }
}
