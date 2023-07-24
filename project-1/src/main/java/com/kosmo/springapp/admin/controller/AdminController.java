package com.kosmo.springapp.admin.controller;

import java.util.ArrayList;
import java.util.Arrays;
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
import java.sql.Date;

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
    public Map<String, Object> editMember(@RequestBody Map<String, Object> request) {
        
    	Map<String, Object> response = new HashMap<>();

    	try {
            // MemberDTO 객체 생성
            MemberDTO memberDto = new MemberDTO();
            
            // 아이디
            memberDto.setId((String) request.get("id"));
            // 이름
            memberDto.setName((String) request.get("name"));
            // 생년월일 설정
            String birthStr = (String) request.get("birth");
            memberDto.setBirth(birthStr);
            // 성별
            memberDto.setGender((String) request.get("gender"));
            // 이메일
            memberDto.setEmail((String) request.get("email"));
            // 활동상태     
            memberDto.setActive((String) request.get("active"));
            // 활동변경일자
            // 받은 JSON 데이터에서 inactive_date를 파싱하여 Date 타입으로 변환
            String inactiveDateStr = (String) request.get("inactive_Date");
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date utilInactiveDate = dateFormat.parse(inactiveDateStr);
            java.sql.Date sqlInactiveDate = new java.sql.Date(utilInactiveDate.getTime());
            memberDto.setInactive_date(sqlInactiveDate);                       
            // 소셜 여부
            memberDto.setSocial_Fl((String) request.get("socialFl"));
            // 소셜 사이트
            memberDto.setSite((String) request.get("site"));
            
            // 회원정보 업데이트
            int affectedRows = adminMapper.updateMemberInfoByAdmin(memberDto);
            
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
	
	// 회원 정보 수정 전 조회
    @GetMapping("/countLoginMember.do")
    @ResponseBody
    public List<Integer> countLoginMember() {
        try {
            // 로그인 로그를 조회하는 로직 (데이터베이스 조회 등)
            // 여기에서는 예시 데이터로 임의의 결과를 반환합니다.
        	// 로그인 로그를 조회하는 로직을 LoginLogService에서 처리하여 가져옵니다.
        	int count_6days_ago = adminMapper.count_6days_ago();
        	int count_5days_ago = adminMapper.count_5days_ago();
        	int count_4days_ago = adminMapper.count_4days_ago();
        	int count_3days_ago = adminMapper.count_3days_ago();
        	int count_2days_ago = adminMapper.count_2days_ago();
        	int count_1days_ago = adminMapper.count_1days_ago();
        	int count_0days_ago = adminMapper.count_0days_ago();
        	
        	// 조회된 로그인 수를 List에 담아서 반환합니다.
            List<Integer> loginCounts = new ArrayList<>();
            loginCounts.add(count_6days_ago);
            loginCounts.add(count_5days_ago);
            loginCounts.add(count_4days_ago);
            loginCounts.add(count_3days_ago);
            loginCounts.add(count_2days_ago);
            loginCounts.add(count_1days_ago);
            loginCounts.add(count_0days_ago);
        	
            
            return loginCounts;
        } 
        catch (Exception e) {
            e.printStackTrace();
            return null; 
        }
    }

	
	
	
	
	
}
