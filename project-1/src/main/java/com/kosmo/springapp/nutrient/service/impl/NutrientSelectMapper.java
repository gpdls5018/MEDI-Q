package com.kosmo.springapp.nutrient.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NutrientSelectMapper {

	// select.xml에서 5대 영양소 비타민 이름 찾아오는 쿼리
	List<String> getVitaminName();
	
	// 5대 영양소 중 미네랄 등 이름 찾아오는 쿼리
	List<String> getETCName();
	
	// 기능성 원료 이름 찾아오는 쿼리
	List<String> getIngredientName();
	
	// 선택한 비타민의 건강고민 가져오는 쿼리
	String getN_FUNCbyVitaminName(String name);
	
	// 선택한 비타민의 상세설명 가져오는 쿼리
	String getN_DESCbyVitaminName(String name);
		
	// 선택한 비타민의 섭취량 가져오는 쿼리
	String getN_DRI_MbyVitaminName(String name);
	String getN_UL_MbyVitaminName(String name);
	String getN_DRI_FbyVitaminName(String name);
	String getN_UL_FbyVitaminName(String name);
			
	// 선택한 비타민의 결핍시 증상 가져오는 쿼리
	String getN_LACKbyVitaminName(String name);
	
	// 선택한 비타민의 주의사항 가져오는 쿼리
	String getN_CAUTIONbyVitaminName(String name);
		
	// 선택한 비타민의 섭취 음식 가져오는 쿼리
	String getN_FOODNbyVitaminName(String name);
	
	// 선택한 원료의 건강고민 가져오는 쿼리
	String getI_FUNCbyIngredientName(String name);

	// 선택한 원료의 섭취량 가져오는 쿼리
	String getI_DRIbyIngredientName(String name);
	String getI_ULbyIngredientName(String name);
	
	// 선택한 원료의 상세정보 가져오는 쿼리
	String getI_DESCbyIngredientName(String name);
	
	// 선택한 원료의 주의사항 가져오는 쿼리
	String getI_CAUTIONbyIngredientName(String name);

	// 해당 영양소 포함한 영양제 가져오는 쿼리
	// 이름
	List<Map<String, Object>> getProductNameNImgUrlFromFoodtable(String name);
	
	// 이미지 url
	String getImgurlFromFoodtable(String name);

	

	
	
	
	
	
	
	
	
	
	
	
	
}
