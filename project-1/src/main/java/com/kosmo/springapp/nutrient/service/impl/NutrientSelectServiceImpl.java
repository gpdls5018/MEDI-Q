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
	public String editN_DESCbyVitaminName(String name) {

		String desc = mapper.getN_DESCbyVitaminName(name);
		desc = desc.replace(".", ".<br/>");
	    return desc;
	}
	
	@Override
	public String editN_CAUTIONbyVitaminName(String name) {

		String caution = mapper.getN_CAUTIONbyVitaminName(name);
	    
	    if (caution != null) {
	        caution = caution.replace("있음", "있어요.<br/>");
	        caution = caution.replace("필요", "필요해요.<br/>");
	    } 
	    else {
	        caution = "";
	    }
	    
	    return caution;
	}
	
	
	
	
	
	
	

}