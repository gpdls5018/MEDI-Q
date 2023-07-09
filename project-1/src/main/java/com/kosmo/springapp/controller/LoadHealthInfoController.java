package com.kosmo.springapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoadHealthInfoController {
	
	@GetMapping("/loadHealthInfo.do")
	public String loadHealthInfoByOCR(@RequestParam String userId,Model model) {
		model.addAttribute("userId",userId);
		return "LoadHealthInfo";
	}
}
