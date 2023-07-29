package com.kosmo.springapp.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.springapp.service.MentalTestMapper;

@Service
public class MentalTestServiceImpl {
	
	@Autowired
	private MentalTestMapper mapper;
	
	public Map selectResult(String id) {
		
		return mapper.selectResult(id);
	}
	
	public int insertResult(Map map) {
		String id = map.get("id").toString();
		int flag = mapper.selectFlag(id);
		System.out.println("flag: "+flag);
		if(flag == 0) {
			System.out.println("insert/////////////");
			return mapper.insertResult(map);
		}
		else {
			return mapper.updateResult(map);
		}
	}
	
	public int updateResult(Map map) {
		
		return mapper.updateResult(map);
	}
}
