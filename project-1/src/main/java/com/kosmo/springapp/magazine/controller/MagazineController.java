package com.kosmo.springapp.magazine.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kosmo.springapp.magazine.service.impl.MagazineSelectMapper;

@Controller
public class MagazineController {
	
	@Autowired
	private MagazineSelectMapper magazineSelectMapper;
	
	//전체 카테고리로 이동
	@GetMapping("/magazine.do")
	public String magazineSelect(Model model) {
		
		List<String> magazineTitles = magazineSelectMapper.getMagazineTitle();
		
		List<String> etcTitles = magazineSelectMapper.getETCTitle();
		
		List<String> ingredientNames = magazineSelectMapper.getIngredientName();
		
		//조회수에 따른 Top6 가져오기
		List<String> top6 = magazineSelectMapper.getTop6();
		
		return "slider/MagazineIndex";
	}////////magazineSelect
	
	
	
}///////////////////
