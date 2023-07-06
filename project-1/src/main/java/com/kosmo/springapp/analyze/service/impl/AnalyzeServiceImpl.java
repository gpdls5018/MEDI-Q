package com.kosmo.springapp.analyze.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.springapp.analyze.model.NutrientDTO;
import com.kosmo.springapp.analyze.service.AnalyzeMapper;
import com.kosmo.springapp.analyze.service.AnalyzeService;

@Service
public class AnalyzeServiceImpl implements AnalyzeService {

	@Autowired
	AnalyzeMapper mapper;
	
	public NutrientDTO findNutrientByName(String str) {
		return mapper.findNutrientByName(str);
	}
	
}
