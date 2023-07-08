package com.kosmo.springapp.analyze.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.kosmo.springapp.analyze.model.HealthIssueDTO;
import com.kosmo.springapp.analyze.model.NutrientDTO;

@Service
public interface AnalyzeService {
	
	NutrientDTO findNutrientByName(String str);
	HealthIssueDTO findHealthIssueByNo(int hno);
}
