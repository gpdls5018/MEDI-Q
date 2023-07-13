package com.kosmo.springapp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.springapp.model.FunctionalFoodListDTO;
import com.kosmo.springapp.service.SelectFoodMapper;
import com.kosmo.springapp.service.SelectFoodService;

@Service
public class SelectFoodServiceImpl implements SelectFoodService{

	@Autowired
	SelectFoodMapper mapper;
	
	@Override
	public List<FunctionalFoodListDTO> selectFoodListFormName(String foodname) {
		return mapper.selectFoodListFormName(foodname);
	}

}
