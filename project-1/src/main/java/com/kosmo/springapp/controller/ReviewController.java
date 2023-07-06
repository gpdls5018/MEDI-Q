package com.kosmo.springapp.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.springapp.model.FunctionalFoodListDTO;
import com.kosmo.springapp.model.MemberDTO;
import com.kosmo.springapp.model.ReviewDTO;
import com.kosmo.springapp.service.JWTokensService;
import com.kosmo.springapp.service.ReviewService;
import com.kosmo.springapp.service.impl.ReviewServiceImpl;

@Controller
public class ReviewController {
	
	@Autowired
	ReviewServiceImpl reviewServiceImpl;
	
	
	@RequestMapping(value = "/WriteReview.do", method = RequestMethod.POST)
	public String writeReview(@RequestBody Map map) {
		//System.out.println("map : "+map.get("takeTime"));
		//System.out.println("map : "+map.get("starScore"));
		//System.out.println("map : "+map.get("effect").toString());	
		//System.out.println("map : "+map.get("noEffect").toString());
		//System.out.println("map : "+map.get("content"));
		//System.out.println("map : "+map.get("no"));
		System.out.println("map.get(id).toString():"+map.get("id").toString());
		int result = reviewServiceImpl.registerReview(map);
		return "Detail";
	}
	
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/SelectReview.do", method = RequestMethod.GET)
	public List<ReviewDTO> selectReview(@RequestParam Map map) {
		List<ReviewDTO> listDto = reviewServiceImpl.selectReviewByFoodNo(map);
		return listDto;
	}
}
