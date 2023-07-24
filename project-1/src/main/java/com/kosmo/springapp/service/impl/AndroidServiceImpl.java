package com.kosmo.springapp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.springapp.model.FunctionalFoodListDTO;
import com.kosmo.springapp.service.AndroidMapper;

@Service
public class AndroidServiceImpl {
	
	@Autowired
	AndroidMapper androidMapper;
	
	public List<FunctionalFoodListDTO> selectFoodList() {
		return androidMapper.selectFoodList();
	}

}
