package com.kosmo.springapp.magazine.service.impl;

import java.util.List;

public interface MagazineSelectMapper {

	// '영양소 A to Z' 부제목 가져오는 쿼리
	List<String> getMagazineTitle();
	
	// 기타 부제목 가져오는 쿼리
	List<String> getETCTitle();
	
	// 매거진 내용에 포함된 영양제 찾아오는 쿼리
	List<String> getIngredientName();
	
	// 조회수로 Top6 가져오기
	List<String> getTop6();


}/////////////////////////////////
