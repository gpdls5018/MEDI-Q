package com.kosmo.springapp.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kosmo.springapp.model.AvgStarScoreCountDTO;
import com.kosmo.springapp.model.FunctionalFoodListDTO;
import com.kosmo.springapp.nutrient.service.impl.NutrientSelectMapper;
import com.kosmo.springapp.service.JWTokensService;
import com.kosmo.springapp.service.MainPageService;
import com.kosmo.springapp.service.impl.AnalyzeMyReportServiceImpl;
import com.kosmo.springapp.service.impl.MainPageServiceImpl;
import com.kosmo.springapp.service.impl.SelectFoodServiceImpl;

@Controller 
public class HelloSpringController {
	
	@Autowired
	private MainPageServiceImpl mainPageService;
	@Autowired
	private SelectFoodServiceImpl selectfoodservice;
	@Autowired
	private NutrientSelectMapper nutrietnSelectMapper;
	@Autowired
	private AnalyzeMyReportServiceImpl analyzeMyReportServiceImpl;
	@Autowired
	private JWTokensService jwTokensService;
	@Value("${token-name}")
	private String tokenName;
	@Value("${secret-key}")
	private String secretKey;
	
	
	@GetMapping("/") 
	public String index(Model model,HttpServletRequest req, HttpServletResponse resp) {
		List<FunctionalFoodListDTO> foodList  = mainPageService.selectFoodList();
		List<AvgStarScoreCountDTO> listData = selectfoodservice.selectFoodListFoodScore();
		String token = jwTokensService.getToken(req, tokenName);
		Map<String, Object> payloads = jwTokensService.getTokenPayloads(token, secretKey);
		try {
			String id = payloads.get("sub").toString();
			model.addAttribute("analyzeReport",analyzeMyReportServiceImpl.selectAnalyzeReport(id));
			model.addAttribute("id",id);
		}
		catch(NullPointerException e) {
			model.addAttribute("id","???");
			
		}
		model.addAttribute("listData", listData);
		model.addAttribute("foodList",foodList);
		
		// 조회수에 따른 인기영양소 Top10 가져오기
		List<String> top10 = nutrietnSelectMapper.getTop10();
		model.addAttribute("top10",top10);
		
		
		
		
		return "Index";
	}
}
