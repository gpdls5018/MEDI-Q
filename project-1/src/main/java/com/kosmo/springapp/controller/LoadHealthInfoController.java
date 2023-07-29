package com.kosmo.springapp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.springapp.model.HealthInfoDTO;
import com.kosmo.springapp.service.JWTokensService;
import com.kosmo.springapp.service.impl.HealthInfoServiceImpl;

@Controller
public class LoadHealthInfoController {
	
	@Autowired
	HealthInfoServiceImpl healthInfoServiceImpl;
	
	
	@GetMapping("/loadHealthInfo.do")
	public String loadHealthInfoByOCR(HttpServletRequest req, HttpServletResponse resp, @RequestParam String userId,Model model) throws IOException {
		
		try {
			 if (userId == null || userId.isEmpty()) {
		        throw new NullPointerException();
			 }
		}catch(NullPointerException e) {
			resp.setContentType("text/html; charset=UTF-8");
			 resp.setCharacterEncoding("UTF-8");
			 PrintWriter out = resp.getWriter();
			 out.println("<script>alert('회원정보가 필요한 서비스입니다\\r로그인 후 이용해 주세요');location.href='/project/Login.do';</script>");
			 out.flush();
			 return null;
		}
		
		model.addAttribute("userId",userId);
		HealthInfoDTO loadHealthInfo = healthInfoServiceImpl.selectHealthInfoByUserId(userId);
		model.addAttribute("loadHealthInfo",loadHealthInfo);
		return "LoadHealthInfo";		
	}
	
	@Autowired
	JWTokensService jwTokensService;
	 @Value("${token-name}")
	 private String tokenName;
	 @Value("${secret-key}")
	 private String secretKey;
	
	@PostMapping("/saveHealthData.do")
	public String saveHealthData(HealthInfoDTO healthInfoDto,HttpServletRequest req, HttpServletResponse resp) {
		String token = jwTokensService.getToken(req, tokenName);
		Map<String, Object> payloads = jwTokensService.getTokenPayloads(token, secretKey);
		String id = payloads.get("sub").toString();
		healthInfoServiceImpl.saveHealthInfo(healthInfoDto);
		return "MachineLearning";
	}
	
	@GetMapping("/MachineLearn.do")
	public String machineLearn() {
		return "MachineLearning";
	}
	
	@PostMapping("/updateHealthData.do")
	public String updateHealthData(HealthInfoDTO healthInfoDto,HttpServletRequest req, HttpServletResponse resp) {
		healthInfoServiceImpl.updateHealthInfo(healthInfoDto);
		return "MachineLearning";
	}
	
	@GetMapping("/DiabetesPredict.do")
	public String diabetesPredict(HttpServletRequest req, HttpServletResponse resp,Model model) {
		try {
			String token = jwTokensService.getToken(req, tokenName);
			Map<String, Object> payloads = jwTokensService.getTokenPayloads(token, secretKey);
			String id = payloads.get("sub").toString();
			HealthInfoDTO healthInfoDto = healthInfoServiceImpl.selectHealthInfoByUserId(id);
			if(healthInfoDto != null) {
				model.addAttribute("healthInfoDto",healthInfoDto);
			}
		}
		catch (Exception e) {
			
		}
		return "DiabetesPredict";
	}
	
	@GetMapping("/CardiovascularPredict.do")
	public String cardiovascularPredict(HttpServletRequest req, HttpServletResponse resp,Model model) {
		try {
			String token = jwTokensService.getToken(req, tokenName);
			Map<String, Object> payloads = jwTokensService.getTokenPayloads(token, secretKey);
			String id = payloads.get("sub").toString();
			HealthInfoDTO healthInfoDto = healthInfoServiceImpl.selectHealthInfoByUserId(id);
			if(healthInfoDto != null) {
				model.addAttribute("healthInfoDto",healthInfoDto);
			}
		}
		catch (Exception e) {
			
		}
		return "CardiovascularPredict";
	}
}
