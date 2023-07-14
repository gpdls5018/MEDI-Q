package com.kosmo.springapp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.springapp.analyze.model.AnalyzeResultListDTO;
import com.kosmo.springapp.model.FunctionalFoodListDTO;
import com.kosmo.springapp.model.MemberDTO;
import com.kosmo.springapp.model.ProfileImageDTO;
import com.kosmo.springapp.model.ReviewDTO;
import com.kosmo.springapp.model.TotalReviewDTO;
import com.kosmo.springapp.service.JWTokensService;
import com.kosmo.springapp.service.impl.AnalyzeMyReportServiceImpl;
import com.kosmo.springapp.service.impl.LoginServiceImpl;
import com.kosmo.springapp.service.impl.MainPageServiceImpl;
import com.kosmo.springapp.service.impl.ReviewServiceImpl;



@Controller
public class FoodDetailController {
	
	 @Autowired
	 MainPageServiceImpl mainPageServiceImpl;
	 
	 @Autowired
	 ReviewServiceImpl reviewServiceImpl;
	 
	 
	 @Autowired
	 private JWTokensService jwTokensService;
	 @Value("${token-name}")
	 private String tokenName;
	 @Value("${secret-key}")
	 private String secretKey;
	
	 @GetMapping("/detail.do")
	 public String detailPage(Model model, Map map, @RequestParam String no) {
		   map.put("no",Integer.parseInt(no));
		   FunctionalFoodListDTO listOne = mainPageServiceImpl.selectFoodOneByNo(map);
		   TotalReviewDTO totalReviewDto = reviewServiceImpl.selectTotalReviewInfo(Integer.parseInt(no));
		   model.addAttribute("listOne",listOne);
		   model.addAttribute("totalReviewDto",totalReviewDto);
		   return "Detail";
	 }
	 
	 @GetMapping("/Review.do")
	 public String reviewPage(HttpServletRequest req,@RequestParam String no) {
		String token = jwTokensService.getToken(req, tokenName);
		Map<String, Object> payloads = jwTokensService.getTokenPayloads(token, secretKey);
		String id = payloads.get("sub").toString();
		FunctionalFoodListDTO listOne = reviewServiceImpl.selectFoodOneByNo(Integer.parseInt(no));
		req.setAttribute("listOne", listOne);
		req.setAttribute("id", id);
		return "Review";
	 }
	 
	 
	 @Autowired
	 private LoginServiceImpl loginService;
	 
	 @GetMapping("/analyzeMyFood.do")
	 public String analyzeMyFood(HttpServletRequest req, HttpServletResponse resp, Model model) throws IOException {
		 String userId;
		 ProfileImageDTO profImg;
		 try {
			 MemberDTO member = loginService.selectOne(req,resp);
			 System.out.println("member.getId() :"+member.getId());
			 profImg = loginService.selectProfImg(member.getId());
			 userId = member.getId();
		 }
		 catch(NullPointerException e) {
			 resp.setContentType("text/html; charset=UTF-8");
			 resp.setCharacterEncoding("UTF-8");
			 PrintWriter out = resp.getWriter();
			 out.println("<script>alert('로그인 후 이용해 주세요');history.back();</script>");
			 out.flush();
			 return null;
		 }
		 model.addAttribute("UserId" , userId);
		 model.addAttribute("profImg", profImg);
		 return "Analyze";
	 }
	 
	 @GetMapping("/AnalyzeNewReport.do")
	 public String analyzeNewReport() {
		 return "AnalyzeNewReport";
	 }
	 
	 @Autowired
	 AnalyzeMyReportServiceImpl analyzeMyReportServiceImpl; 
	 
	 @CrossOrigin
	 @PostMapping("/analyzeMyReport.do")
	 public String analyzeMyReport(@RequestParam Map<String,String> map,Model model) {
		 
		 List<String> takeList = Arrays.asList(map.get("takePurpose").split(","));
		 List<String> foodList = Arrays.asList(map.get("takeFood").split(","));
		 Map<String,List<String>> userMap = new HashMap<>();
		 userMap.put("takePurpose", takeList);
		 userMap.put("takeFood", foodList);
		 AnalyzeResultListDTO resultListDto = analyzeMyReportServiceImpl.analyzeMyReport(userMap);
		 model.addAttribute("resultListDto",resultListDto);
		 return "AnalyzeReportResult";
	 }
	 
	 @GetMapping("/searchMyFood.do")
	 @ResponseBody
	 public List searchMyFood(@RequestParam String searchWord) {
		 List<Map> nameList = mainPageServiceImpl.selectFoodNameList(searchWord);
		 return nameList;
	 }
	 
}
