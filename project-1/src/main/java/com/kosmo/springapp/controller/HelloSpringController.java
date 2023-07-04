package com.kosmo.springapp.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller 
public class HelloSpringController {
	
	@GetMapping("/") 
	public String index(Model model) {
		
		return "Index";
	}
}
