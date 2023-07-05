package com.kosmo.springapp.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosmo.springapp.model.MemberDTO;
import com.kosmo.springapp.service.JWTokensService;

@Controller
public class ReviewController {
	

	
	
	@RequestMapping(value = "/WriteReview.do", method = RequestMethod.POST)
	public String mypage(@RequestBody Map map) {
		System.out.println("map : "+map.get("takeTime"));
		System.out.println("map : "+map.get("starScore"));
		System.out.println("map : "+map.get("effect"));
		System.out.println("map : "+map.get("noEffect"));
		System.out.println("map : "+map.get("content"));
		return null;
	}
}
