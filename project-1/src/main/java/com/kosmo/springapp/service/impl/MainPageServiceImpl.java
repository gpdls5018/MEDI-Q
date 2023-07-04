package com.kosmo.springapp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.springapp.model.FunctionalFoodListDTO;
import com.kosmo.springapp.service.MainPageMapper;
import com.kosmo.springapp.service.MainPageService;

@Service
public class MainPageServiceImpl implements MainPageService{

	@Autowired
	MainPageMapper mapper;
	
	@Override
	public List<FunctionalFoodListDTO> selectFoodList() {
		// TODO Auto-generated method stub
		return mapper.selectFoodList();
	}

}
