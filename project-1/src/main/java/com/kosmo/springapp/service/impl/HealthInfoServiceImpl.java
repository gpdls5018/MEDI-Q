package com.kosmo.springapp.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.springapp.model.HealthInfoDTO;
import com.kosmo.springapp.service.HealthInfoMapper;

@Service()
public class HealthInfoServiceImpl {
	
	@Autowired
	HealthInfoMapper healthInfoMapper;
	
	public int saveHealthInfo(HealthInfoDTO healthInfoDto) {
		return healthInfoMapper.saveHealthInfo(healthInfoDto);
	};
}
