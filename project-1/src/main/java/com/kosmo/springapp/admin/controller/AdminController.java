package com.kosmo.springapp.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;



import com.kosmo.springapp.admin.service.AdminMapper;
import com.kosmo.springapp.model.MemberDTO;

@Controller
public class AdminController {

	@Autowired
	private AdminMapper adminMapper;
	
	@GetMapping("/AdminMain.do")
	public String adminMain() {
		
		
		
		
		
		
		
	    return "admin/AdminMain";
	}
	
	@GetMapping("/AdminMember.do")
	public String adminMember(Model model) {
		
		List<MemberDTO> members = adminMapper.getMemberInfo();
		
		// SimpleDateFormat을 사용하여 시분초를 제거하고 날짜를 다시 set
		 for (MemberDTO member : members) {
	            // 시분초 제거: "2000-03-18 00:00:00" -> "2000-03-18"
	            String birthString = member.getBirth().substring(0, 10);
	            member.setBirth(birthString);
	        }
		
		model.addAttribute("members",members);
		
		
		
		
	    return "admin/AdminMember";
	}
	
	
	
	
	
	
	
	
}
