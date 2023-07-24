package com.kosmo.springapp.service;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HeartCountMapper {
	
	String HeartCount(String id,String name);
	void insertHeart(String id,String name);
	void deleteHeart(String id,String name);
}
