package com.kosmo.springapp.nutrient.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.springapp.nutrient.service.NutrientData;
import com.kosmo.springapp.nutrient.service.NutrientSelectService;


@Service
public class NutrientSelectServiceImpl implements NutrientSelectService {

	@Autowired
	private NutrientSelectMapper mapper;
	
	@Override
	public NutrientData showNutrientName() {
		
		List<String> nutrientNames = mapper.selectName();
		
		NutrientData nutrientData = NutrientData.builder()
												.nutrientNames(nutrientNames)
												.build();
		
		return nutrientData;
		
		
	}
}