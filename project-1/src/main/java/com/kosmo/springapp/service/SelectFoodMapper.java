package com.kosmo.springapp.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kosmo.springapp.model.FunctionalFoodListDTO;

@Mapper
public interface SelectFoodMapper {

	List<FunctionalFoodListDTO> selectFoodListFormName(String foodname);
}
