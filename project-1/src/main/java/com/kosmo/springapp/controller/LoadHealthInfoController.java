package com.kosmo.springapp.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.springapp.model.HealthInfoDTO;
import com.kosmo.springapp.service.impl.HealthInfoServiceImpl;

@Controller
public class LoadHealthInfoController {
	
	@Autowired
	HealthInfoServiceImpl healthInfoServiceImpl;
	
	
	@GetMapping("/loadHealthInfo.do")
	public String loadHealthInfoByOCR(HttpServletRequest req, HttpServletResponse resp, @RequestParam String userId,Model model) throws IOException {
		/*
		try {
			 if (userId == null || userId.isEmpty()) {
		        throw new NullPointerException();
			 }
		}catch(NullPointerException e) {
			resp.setContentType("text/html; charset=UTF-8");
			 resp.setCharacterEncoding("UTF-8");
			 PrintWriter out = resp.getWriter();
			 out.println("<script>alert('로그인 후 이용해 주세요');history.back();</script>");
			 out.flush();
			 return null;
		}
		*/
		model.addAttribute("userId",userId);
		return "LoadHealthInfo";		
	}
	
	@PostMapping("/saveHealthData.do")
	public String saveHealthData(HealthInfoDTO healthInfoDto) {
		System.out.println("healthInfoDto.getBloodPressure_high() :" + healthInfoDto.getBloodPressure_high());
		healthInfoServiceImpl.saveHealthInfo(healthInfoDto);
		return "LoadHealthInfo";
	}
}
