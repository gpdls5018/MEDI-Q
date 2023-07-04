package com.kosmo.springapp.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kosmo.springapp.model.FunctionalFoodListDTO;

@Service
public interface MainPageService {
	List<FunctionalFoodListDTO> selectFoodList();
}
