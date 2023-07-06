package com.kosmo.springapp.analyze.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HealthIssueController {

	@GetMapping("issue.do")
	public String healthIssue(Model model,@RequestParam String issue) {
		model.addAttribute("issue", issue);
		return "/analyze/healthindex";
	}
}