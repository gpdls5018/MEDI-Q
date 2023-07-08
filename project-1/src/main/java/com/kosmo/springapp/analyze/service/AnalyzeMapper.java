package com.kosmo.springapp.analyze.service;

import org.apache.ibatis.annotations.Mapper;

import com.kosmo.springapp.analyze.model.HealthIssueDTO;
import com.kosmo.springapp.analyze.model.NutrientDTO;

@Mapper
public interface AnalyzeMapper {
	
	NutrientDTO findNutrientByName(String str);
	HealthIssueDTO findHealthIssueByNo(int hno);
}
