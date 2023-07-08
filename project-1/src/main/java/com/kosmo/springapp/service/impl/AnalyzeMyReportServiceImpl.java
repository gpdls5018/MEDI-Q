package com.kosmo.springapp.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.springapp.service.AnalyzeMyReportMapper;

@Service
public class AnalyzeMyReportServiceImpl {

	@Autowired
	AnalyzeMyReportMapper analyzeMyReportMapper;
	
	public Map<String, List<String>> analyzeMyReport(Map map) {
		String takePurpose = ((List)map.get("takePurpose")).get(0).toString();
		System.out.println("사용자의 복용 목적 : "+takePurpose);
		System.out.println(takePurpose +"를 위해 필요한 영양소 SELECT =====================");
		List<String> foodList = analyzeMyReportMapper.selectFoodListForMyTakePurpose(takePurpose);
		for(String food : foodList) {
			System.out.println(food);
		}
		System.out.println(takePurpose +"를 위해 필요한 영양소 ===================== END");
		System.out.println("사용자가 현재 복용중인 건기식의 영양소 SELECT ==========================");
		String takeFood = ((List)map.get("takeFood")).get(0).toString();
		
		List<String> myfoodList = analyzeMyReportMapper.selectMyFoodList(takeFood);
		
		List<String> ingredient_list = analyzeMyReportMapper.selectIngredient_list();
		List<String> ingredient_list_report = new ArrayList<String>();
		List<String> ingredient_list_no_report = new ArrayList<String>(ingredient_list);
		List<String> nutrient_list = analyzeMyReportMapper.selectNutrient_list();
		List<String> nutrient_list_report = new ArrayList<String>();
		List<String> nutrient_list_no_report = new ArrayList<String>(nutrient_list);
		
		for(String foods : myfoodList) {
			System.out.println(foods);
			List<String> food = Arrays.asList(foods.split("\\$"))
					.stream()
					.map(item-> item.trim())
					.toList();
			System.out.println("사용자가 평소에 복용해야 하는 영양소(비타민 등)중 현재 섭취하고 있는 영양소 SELECT");
			for(String item : food) {
				item = item.replaceAll("\\s","");
				for(String ingredient : ingredient_list) {
					if(ingredient.contains(item)) {
						ingredient_list_no_report.remove(ingredient);
						ingredient_list_report.add(ingredient);
						System.out.println("현재 기능성 영양소 :"+item+"를 섭취중");
					}
				}
				for(String nutrient : nutrient_list) {
					if(nutrient.contains(item)) {
						nutrient_list_no_report.remove(nutrient);
						nutrient_list_report.add(nutrient);
						System.out.println("현재 비타민 :"+item+"를 섭취중");
					}
				}
			}
			
			System.out.println("현재 섭취하지 않고 있는 비타민  :" + nutrient_list_no_report.toString());
			System.out.println("현재 섭취하고 있는 비타민  :" + nutrient_list_report.toString());
			System.out.println("현재 섭취하지 않고 있는 기능성 영양소  :" + ingredient_list_no_report.toString());
			System.out.println("현재 섭취하고 있는 기능성 영양소  :" + ingredient_list_report.toString());
		}
		
		
		System.out.println("사용자가 현재 복용중인 건기식의 영양소 ========================== END");
		//System.out.println("사용자의 점수는 : "+ nutrient_list_report.size()*3+(ingredient_list_report.size()/foodList.size())*3+"점 입니다");
		//최종 저장
		//int score = nutrient_list_report.size()*3+(ingredient_list_report.size()/foodList.size())*3;
		Map<String,List<String>> resultMap = new HashMap<String, List<String>>();
		resultMap.put("ingredient_list_report",ingredient_list_report);
		resultMap.put("nutrient_list_report", nutrient_list_report);
		resultMap.put("nutrient_list_no_report", nutrient_list_no_report);
		resultMap.put("foodList", foodList);
		return resultMap;
	}
}
