package com.kosmo.springapp.ml.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MLController {

	@GetMapping("/StrokePredict.do")
	public String StrokePredict() {
		
	    return "StrokePredict";
	}
}
