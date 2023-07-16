package com.kosmo.springapp.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.springapp.analyze.model.AnalyzeResultDTO;
import com.kosmo.springapp.analyze.model.AnalyzeResultListDTO;
import com.kosmo.springapp.service.AnalyzeMyReportMapper;

@Service
public class AnalyzeMyReportServiceImpl {

	@Autowired
	AnalyzeMyReportMapper analyzeMyReportMapper;
	
	public AnalyzeResultListDTO analyzeMyReport(Map map) {
		
		
		// 필수 영양소(비타민 등)을 담기 위한 리스트(모든 필수 영양소, 현재 섭취중인 필수 영양소, 섭취가 필요한 필수 영양소)
		List<String> nutrient_list = analyzeMyReportMapper.selectNutrient_list();
		List<String> nutrient_list_report = new ArrayList<String>();
		List<String> nutrient_list_no_report = new ArrayList<String>(nutrient_list);
		AnalyzeResultListDTO analyzeResultListDTO = new AnalyzeResultListDTO();
		List<AnalyzeResultDTO> analyzeResultDTOs = new ArrayList<AnalyzeResultDTO>();
		List<String> takePurposes = ((List)map.get("takePurpose"));
		int nutrient_score = 0;
		int ingredient_score = 0;
		for(String takePurpose : takePurposes) {//복용 목적을 하나씩 비교
			AnalyzeResultDTO analyzeResultDTO = new AnalyzeResultDTO();
			List<String> foodList = analyzeMyReportMapper.selectFoodListForMyTakePurpose(takePurpose);//사용자의 복용 목적을 위해 필요한 영양소
			System.out.println("사용자의 복용 목적["+takePurpose+"]을 위해 필요한 영양소 : " + foodList);
			List<String> ingredient_list_no_report = new ArrayList<String>(foodList);
			List<String> takeFoods = ((List)map.get("takeFood"));//사용자가 복용중인 건기식
			System.out.println("사용자가 복용중인 건기식 : "+ takeFoods);
			Map<String,List> foodForHelpPurpose = new HashMap<>();
			for(String takeFood : takeFoods) {//사용자가 복용중인 건기식들을 하나씩 비교
				List<String> myfoodList = analyzeMyReportMapper.selectMyFoodList(takeFood);//사용자가 복용중인 건기식에 들어있는 것들
				System.out.println("사용자가 복용중인 건기식("+ takeFood +") 에 들어있는 것들 : "+myfoodList);
				List<String> ingredient_list = new ArrayList<String>(foodList);//사용자가 복용중인 건기식의 기능성 영양소를 담을 리스트(복용 목적을 위해 필요한 모든 기능성 영양소, 사용자가 복용중인 건기식의 기능성 영양소, 사용자가 먹지 않고 있는 기능성 영양소)
				List<String> ingredient_list_report = new ArrayList<String>();
				
				for(String foods : myfoodList) {
					List<String> food = Arrays.asList(foods.split("\\$")).stream().map(item-> item.trim()).toList();//문자열을 구분 -> 리스트에 담음
					for(String item : food) {//들어있는 성분 하나를 들고옴-> 공백 제거
						item = item.replaceAll("\\s","");
						for(String ingredient : ingredient_list) {//기능성 영양소에서 하나 가져옴
							if(item.contains(ingredient)) {//복용목적을 위한 올바른 기능영 영양소라면
								ingredient_list_no_report.remove(ingredient);
								ingredient_list_report.add(ingredient);	
							}
						}
						for(String nutrient : nutrient_list) {//필수 영양소에서 하나를 가져옴 -> 모든 건기식에 대해 수행해야 한다
							
							if(nutrient.contains(item)) {//필수 비타민을 섭취 중이라면
								if(!nutrient_list_report.contains(nutrient)) { // 중복 제거
									nutrient_list_no_report.remove(nutrient);
									nutrient_list_report.add(nutrient);	
								}
							}
						}
					}			
				}

				//건기식 for 중
				// 이번 건기식에서 사용자의 복용 목적에 도움되는 기능성 영양소들 -> 있을 시에 추가 //1. 있을 시 -> 건기식 이름 저장 -> 없을 시 계속
				if(ingredient_list_report.size() != 0) {
					foodForHelpPurpose.put(takeFood, ingredient_list_report);
					ingredient_score += ingredient_list_report.size();
				}
			}
			analyzeResultDTO.setTakePurpose(takePurpose);// 복용 목적
			analyzeResultDTO.setFoodForHelpPurpose(foodForHelpPurpose);//(있을경우)건기식 이름,건기식에서 사용자의 복용 목적에 도움되는 기능성 영양소List
			analyzeResultDTO.setIngredient_list_no_report(ingredient_list_no_report);//사용자가 먹는 건기식에서 나오지 않은 복용목적에 필요한 기능성 영양소 - 섭취가 필요한
			analyzeResultDTO.setFoodList(foodList);//사용자가 복용 목적을 위해 필요한 영양소들
			analyzeResultDTOs.add(analyzeResultDTO);
		
			//1. 
		}
		
		analyzeResultListDTO.setListdto(analyzeResultDTOs);
		analyzeResultListDTO.setNutrient_list_report(nutrient_list_report);
		analyzeResultListDTO.setNutrient_list_no_report(nutrient_list_no_report);
		//최종 점수 구하기
		nutrient_score = nutrient_list_report.size() *3 / takePurposes.size();
		int resultScore = ingredient_score*30 + nutrient_score;
		analyzeResultListDTO.setResultScore(resultScore);
		analyzeResultListDTO.setIngredientCount(((List)map.get("takeFood")).size());
		return analyzeResultListDTO;
	}
}
