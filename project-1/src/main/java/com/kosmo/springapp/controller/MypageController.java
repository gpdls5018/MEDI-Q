package com.kosmo.springapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/project")
@Controller
public class MypageController {

	@GetMapping("/MyPage.do")
	public String mypage() {
		//정보 꾸려야함
		return "login/MyPage";
	}
	
	//@PostMapping("/Password.do")
	//public String password() {
		
	//}
}
