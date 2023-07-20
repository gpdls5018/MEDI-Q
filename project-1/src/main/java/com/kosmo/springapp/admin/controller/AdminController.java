package com.kosmo.springapp.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

	
	@GetMapping("/AdminMain.do")
	public String adminMain() {
		
		
		
		
		
		
		
	    return "admin/AdminMain";
	}
	
	@GetMapping("/AdminMember.do")
	public String adminMember() {
		
		
		
		
		
		
		
	    return "admin/AdminMember";
	}
	
	
	
	
	
	
	
	
}
