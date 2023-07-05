package com.kosmo.springapp.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.springapp.model.FunctionalFoodListDTO;
import com.kosmo.springapp.service.JWTokensService;
import com.kosmo.springapp.service.impl.MainPageServiceImpl;



@Controller
public class FoodDetailController {
	
	 @Autowired
	 MainPageServiceImpl mainPageService;
	 
	 @Autowired
	 private JWTokensService jwTokensService;
	 @Value("${token-name}")
	 private String tokenName;
	 @Value("${secret-key}")
	 private String secretKey;
	
	 @GetMapping("/detail.do")
	 public String detailPage(Model model, Map map, @RequestParam String no) {
		   map.put("no",Integer.parseInt(no));
		   FunctionalFoodListDTO listOne = mainPageService.selectFoodOneByNo(map);
		   model.addAttribute("listOne",listOne);
		   return "Detail";
	 }
	 
	 @GetMapping("/writeReview.do")
	 public String reviewPage(HttpServletRequest req) {
		String token = jwTokensService.getToken(req, tokenName);
		Map<String, Object> payloads = jwTokensService.getTokenPayloads(token, secretKey);
		String id = payloads.get("sub").toString();
		System.out.println("id : "+id);
		return "Review";
	 }
}
