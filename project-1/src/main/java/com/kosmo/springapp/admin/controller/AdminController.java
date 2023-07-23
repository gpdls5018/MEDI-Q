package com.kosmo.springapp.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
    	
    	// 데이터 변환 - 생년월일
        if (memberdto.getBirth() != null) {
            try {
                SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
                SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy/MM/dd");
                Date birthDate = inputFormat.parse(memberdto.getBirth());
                String formattedBirth = outputFormat.format(birthDate);
                memberdto.setBirth(formattedBirth);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        
        // 데이터 변환 - 비활성화일자
//        if (memberdto.getInactive_date() != null) {
//            try {
//                SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy/MM/dd");
//                Date inactiveDate = inputFormat.parse(memberdto.getInactive_date());
//                memberdto.setInactive_date(inactiveDate);
//            } catch (ParseException e) {
//                e.printStackTrace();
//                response.put("success", false);
//                response.put("message", "비활성화일자 형식 변환 중 오류가 발생하였습니다.");
//                return response;
//            }
//        }
        
       
        
        System.out.println("전달받은 JSON 데이터 - ID: " + memberdto.getId());
        System.out.println("전달받은 JSON 데이터 - NAME: " + memberdto.getName());
        System.out.println("전달받은 JSON 데이터 - BIRTH: " + memberdto.getBirth());
        System.out.println("전달받은 JSON 데이터 - GENDER: " + memberdto.getGender());
        System.out.println("전달받은 JSON 데이터 - EMAIL: " + memberdto.getEmail());
        System.out.println("전달받은 JSON 데이터 - ACTIVE: " + memberdto.getActive());
        System.out.println("전달받은 JSON 데이터 - INACTIVE_DATE: " + memberdto.getInactive_date());
        System.out.println("전달받은 JSON 데이터 - SITE: " + memberdto.getSite());
        System.out.println("전달받은 JSON 데이터 - SOCIAL_FL: " + memberdto.getSocial_Fl());

        
        
        
    	

    	try {
            int affectedRows = adminMapper.updateMemberInfoByAdmin(memberdto);
            if (affectedRows > 0) {
                response.put("success", true);
                response.put("message", "회원 정보가 성공적으로 수정되었습니다.");
            } else {
                response.put("success", false);
                response.put("message", "회원 정보 수정에 실패하였습니다. 다시 시도해주세요.");
            }
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "회원 정보 수정 중 오류가 발생하였습니다. 관리자에게 문의해주세요.");
        }

        return response;
    }
	
	
	
	
	
	
	
	
	
	
}
