package com.kosmo.springapp.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.springapp.magazine.service.impl.MagazineSelectMapper;
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
	/*
	@GetMapping("/magazineindex.do")
	  public String magazineinddex(Map map) {
	    return "slider/MagazineIndex";
	  }
	*/
	@Autowired(required=false)
	private MagazineSelectMapper magazineSelectMapper;
	
	//전체 카테고리로 이동
	@GetMapping("/magazineindex.do")
	public String magazineSelect(Map map, Model model) {
		
		List<String> titleCommonSense = magazineSelectMapper.getTitleCommonSense();
		model.addAttribute("titleCommonSense", titleCommonSense);
		List<String> titleNutrient = magazineSelectMapper.getTitleNutrient();
		model.addAttribute("titleNutrient", titleNutrient);
		List<String> titleRecipe = magazineSelectMapper.getTitleRecipe();
		model.addAttribute("titleRecipe", titleRecipe);
		List<String> titleTrue = magazineSelectMapper.getTitleTrue();
		model.addAttribute("titleTrue", titleTrue);
		List<String> titleHealth = magazineSelectMapper.getTitleHealth();
		model.addAttribute("titleHealth", titleHealth);
		//조회수에 따른 Top6 가져오기
		//List<String> top6 = magazineSelectMapper.getTop6();
		
		return "slider/MagazineIndex";
	}////////magazineSelect

	
	/*
	//영양제 상식 카테고리로 이동
	@GetMapping("/magazineCommonSense.do")
	public String magazineSelectCommonSense(Model model) {

	}////////magazineSelectCommonSense
	*/
	
	//영양소 A to Z 카테고리로 이동
	
	
	
	//영양제 레시피 카테고리로 이동
	
	
	
	//영양제 팩트체크 카테고리로 이동
	
	
	
	//Health & Life 카테고리로 이동
	
}///////////////////////////
