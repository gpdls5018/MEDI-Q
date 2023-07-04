package com.kosmo.springapp.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class MagazineController {
	@GetMapping("/magazine.do")
	  public String magazine(@RequestParam String no,Map map,Model model) {
	    //List<FunctionalFoodListDTO> listData = mainService.selectFoodList(map);
	    //model.addAttribute("listData",listData);
	    return "slider/Magazine"+no;
	  }
}
