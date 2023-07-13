package com.kosmo.springapp.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kosmo.springapp.model.FunctionalFoodListDTO;

@Service
public interface SelectFoodService {
	List<FunctionalFoodListDTO> selectFoodListFormName(String foodname);
}
