package com.kosmo.springapp.analyze.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FormalationController {

	@GetMapping("formalation.do")
	public String Formalation(Model model,@RequestParam String formalation) {
		
		model.addAttribute("formalation", formalation);
		return "/analyze/healthindex";
	}
}
