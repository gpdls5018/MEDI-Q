package com.kosmo.springapp.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kosmo.springapp.model.FunctionalFoodListDTO;

@Mapper
public interface AndroidMapper {

	List<FunctionalFoodListDTO> selectFoodList();

	List<FunctionalFoodListDTO> selectFoodListByNutrient(String nutrient);

	List<FunctionalFoodListDTO> selectFoodListByPurpose(String purpose);

	FunctionalFoodListDTO selectFood(String no);

}
