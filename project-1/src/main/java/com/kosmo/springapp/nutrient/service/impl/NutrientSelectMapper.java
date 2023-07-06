package com.kosmo.springapp.nutrient.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NutrientSelectMapper {

	// select.xml에서 영양소 이름 찾아오는 쿼리
	List<String> selectName();
}
