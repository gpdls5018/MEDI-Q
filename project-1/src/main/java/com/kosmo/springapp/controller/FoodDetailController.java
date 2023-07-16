package com.kosmo.springapp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
		   String nutrient_before = listOne.getNutrient();
		   String nutrient_after = change_nutrientName(nutrient_before);
		   TotalReviewDTO totalReviewDto = reviewServiceImpl.selectTotalReviewInfo(Integer.parseInt(no));
		   if(listOne.getStandard() != null) {
			   if(listOne.getStandard().contains("1)")) {
				   if(listOne.getStandard().contains("(1)")) {
					   System.out.println("들어옴)");
					   String input = listOne.getStandard();
					   String pattern = "\\(\\d+\\)\\s.*?(?=\\(\\d+\\)|$)";
				        Pattern regex = Pattern.compile(pattern);
				        Matcher matcher = regex.matcher(input);
				        
				        List<String> Sgroups = new ArrayList<>();
				        
				        while (matcher.find()) {
				            String item = matcher.group().trim();
				            Sgroups.add(item);
				        }
				        model.addAttribute("Sgroups", Sgroups);
				   }
				   else {
					   System.out.println("들어옴()");
					   String input = listOne.getStandard();
					   String pattern = "\\d+\\)\\s.*?(?=\\d+\\)|$)";
				        Pattern regex = Pattern.compile(pattern);
				        Matcher matcher = regex.matcher(input);
				        
				        List<String> Sgroups = new ArrayList<>();
				        
				        while (matcher.find()) {
				            String item = matcher.group().trim();
				            Sgroups.add(item);
				        }
				        model.addAttribute("Sgroups", Sgroups);
				   }
			   }
			   if(listOne.getStandard().contains("①")) {
				   String input = listOne.getStandard();
				   String pattern = "①|②|③|④|⑤|⑥|⑦|⑧|⑨|⑩";
			        Pattern regex = Pattern.compile(pattern);
			        Matcher matcher = regex.matcher(input);
			        
			        List<String> Sgroups = new ArrayList<>();
			        
			        int start = 0;
			        while (matcher.find()) {
			            String item = input.substring(start, matcher.start()).trim();
			            Sgroups.add(item);
			            start = matcher.start();
			        }
			        String lastGroup = input.substring(start).trim();
			        Sgroups.add(lastGroup);
			        
			        model.addAttribute("Sgroups", Sgroups);
			   }
			   
			   if(listOne.getStandard().contains("2. ")) {
				   System.out.println("들어옴.");
				   String input = listOne.getStandard();
				   String pattern = "\\d+\\.\\s.*?(?=\\d+\\.|$)";
			        Pattern regex = Pattern.compile(pattern);
			        Matcher matcher = regex.matcher(input);
			        
			        List<String> Sgroups = new ArrayList<>();
			        
			        while (matcher.find()) {
			            String item = matcher.group().trim();
			            Sgroups.add(item);
			        }
			        model.addAttribute("Sgroups", Sgroups);
			   }
			   
		   }
		   if(listOne.getCaution() != null) {
			   if(listOne.getStandard().contains("1)")) {  
				   if(listOne.getCaution().contains("(1)")) {
					   String input = listOne.getCaution();
					   String pattern = "\\(\\d+\\)\\s.*?(?=\\(\\d+\\)|$)";
				        Pattern regex = Pattern.compile(pattern);
				        Matcher matcher = regex.matcher(input);
				        
				        List<String> Cgroups = new ArrayList<>();
				        
				        while (matcher.find()) {
				            String item = matcher.group().trim();
				            Cgroups.add(item);
				        }
				        model.addAttribute("Cgroups", Cgroups);
				   }
				   else {
					   String input = listOne.getCaution();
					   String pattern = "\\d+\\)\\s.*?(?=\\d+\\)|$)";
				        Pattern regex = Pattern.compile(pattern);
				        Matcher matcher = regex.matcher(input);
				        
				        List<String> Cgroups = new ArrayList<>();
				        
				        while (matcher.find()) {
				            String item = matcher.group().trim();
				            Cgroups.add(item);
				        }
				        model.addAttribute("Cgroups", Cgroups);
				   }
			   }
			   if(listOne.getCaution().contains("①")) {
				   String input = listOne.getCaution();
				   String pattern = "①|②|③|④|⑤|⑥|⑦|⑧|⑨|⑩";
			        Pattern regex = Pattern.compile(pattern);
			        Matcher matcher = regex.matcher(input);
			        
			        List<String> Cgroups = new ArrayList<>();
			        
			        int start = 0;
			        while (matcher.find()) {
			            String item = input.substring(start, matcher.start()).trim();
			            Cgroups.add(item);
			            start = matcher.start();
			        }
			        String lastGroup = input.substring(start).trim();
			        Cgroups.add(lastGroup);
			        
			        model.addAttribute("Cgroups", Cgroups);
			   }
			   
			   if(listOne.getCaution().contains("1. ")) {
				   System.out.println("들어옴.");
				   String input = listOne.getCaution();
				   String pattern = "\\d+\\.\\s.*?(?=\\d+\\.|$)";
			        Pattern regex = Pattern.compile(pattern);
			        Matcher matcher = regex.matcher(input);
			        
			        List<String> Cgroups = new ArrayList<>();
			        
			        while (matcher.find()) {
			            String item = matcher.group().trim();
			            Cgroups.add(item);
			        }
			        model.addAttribute("Cgroups", Cgroups);
			   }
		   }
		   
		   model.addAttribute("listOne",listOne);
		   model.addAttribute("totalReviewDto",totalReviewDto);
		   return "Detail";
	 }
	 
	 private String change_nutrientName(String nutrient_before) {
		List<String> nutrientList = Arrays.asList(nutrient_before.split("$"));
		List<String> havetochangeList;
		
		return null;
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
		 String userName;
		 ProfileImageDTO profImg;
		 try {
			 MemberDTO member = loginService.selectOne(req,resp);
			 System.out.println("member.getId() :"+member.getId());
			 profImg = loginService.selectProfImg(member.getId());
			 userName = member.getName();
		 }
		 catch(NullPointerException e) {
			 resp.setContentType("text/html; charset=UTF-8");
			 resp.setCharacterEncoding("UTF-8");
			 PrintWriter out = resp.getWriter();
			 out.println("<script>alert('로그인 후 이용해 주세요');history.back();</script>");
			 out.flush();
			 return null;
		 }
		 model.addAttribute("UserName" , userName);
		 model.addAttribute("profImg", profImg);
		 return "Analyze";
	 }
	 
	 @GetMapping("/AnalyzeNewReport.do")
	 public String analyzeNewReport(HttpServletRequest req, HttpServletResponse resp, Model model) throws IOException {
		 String userName;
		 try {
			 MemberDTO member = loginService.selectOne(req,resp);
			 userName = member.getName();
		 }
		 catch(NullPointerException e) {
			 resp.setContentType("text/html; charset=UTF-8");
			 resp.setCharacterEncoding("UTF-8");
			 PrintWriter out = resp.getWriter();
			 out.println("<script>alert('로그인 후 이용해 주세요');history.back();</script>");
			 out.flush();
			 return null;
		 }
		 model.addAttribute("UserName" , userName);
		 return "AnalyzeNewReport";
	 }
	 
	 @Autowired
	 AnalyzeMyReportServiceImpl analyzeMyReportServiceImpl; 
	 
	 @CrossOrigin
	 @PostMapping("/analyzeMyReport.do")
	 public String analyzeMyReport(@RequestParam Map<String,String> map,Model model,HttpServletRequest req,HttpServletResponse resp) {
		 
		 List<String> takeList = Arrays.asList(map.get("takePurpose").split(","));
		 List<String> foodList = Arrays.asList(map.get("takeFood").split(","));
		 Map<String,List<String>> userMap = new HashMap<>();
		 userMap.put("takePurpose", takeList);
		 userMap.put("takeFood", foodList);
		 AnalyzeResultListDTO resultListDto = analyzeMyReportServiceImpl.analyzeMyReport(userMap);
		 MemberDTO memberDto = loginService.selectOne(req,resp);
		 model.addAttribute("memberDto",memberDto);
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
