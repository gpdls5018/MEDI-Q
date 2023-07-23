package com.kosmo.springapp.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		
		// 회원정보 출력
		List<MemberDTO> members = adminMapper.getMemberInfo();
		
		// 생년월일에서 시분초 제거
		for (MemberDTO member : members) {
	        // 시분초 제거: "2000-03-18 00:00:00" -> "2000-03-18"
	        String birthString = member.getBirth().substring(0, 10);
	        member.setBirth(birthString);
	    }
		
		model.addAttribute("members",members);
		
	    return "admin/AdminMember";
	}
	
	// 회원 정보 삭제
	@PostMapping("/deleteMember.do")
	@ResponseBody
	public Map<String, Object> deleteMember(@RequestBody Map<String, Object> data) {
		
	    String memberId = (String) data.get("memberId");

	    Map<String, Object> response = new HashMap<>();
	    int deletedRows = adminMapper.deleteMemberInfoByAdmin(memberId);

	    if (deletedRows > 0) {
	        response.put("success", true);
	        response.put("message", " 회원 삭제가 성공적으로 완료되었습니다.");
	    } else {
	        response.put("success", false);
	        response.put("message", " 회원 삭제를 실패하였습니다. 다시 시도해주세요.");
	    }

	    return response;
	}
	
	// 회원 정보 수정 전 조회
	@GetMapping("/getMemberById/{memberId}")
	@ResponseBody
	public Map<String, Object> getMemberById(@PathVariable String memberId) {
		
		System.out.println(memberId);
	    Map<String, Object> response = new HashMap<>();

	    try {
	        MemberDTO memberdto = adminMapper.getMemberInfoById(memberId);
	        if (memberdto != null) {
	            response.put("success", true);
	            response.put("member", memberdto);
	        } else {
	            response.put("success", false);
	            response.put("message", "회원 정보를 찾을 수 없습니다.");
	        }
	    } 
	    catch (Exception e) {
	        response.put("success", false);
	        response.put("message", "회원 정보 조회에 실패하였습니다.");
	    }

	    return response;
	}
	
	// 회원 정보 수정 후 처리
    @PostMapping("/editMember")
    @ResponseBody
    public Map<String, Object> editMember(@RequestBody MemberDTO memberdto) {
        
    	Map<String, Object> response = new HashMap<>();

        try {
            boolean success = adminMapper.updateMemberInfoByAdmin(memberdto);
            if (success) {
                response.put("success", true);
                response.put("message", "회원 정보가 성공적으로 수정되었습니다.");
            } else {
                response.put("success", false);
                response.put("message", "회원 정보 수정에 실패하였습니다. 다시 시도해주세요.");
            }
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "회원 정보 수정에 실패하였습니다. 다시 시도해주세요.");
        }

        return response;
    }
	
	
	
	
	
	
	
	
	
	
}
