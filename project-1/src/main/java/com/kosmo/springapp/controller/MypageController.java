package com.kosmo.springapp.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.springapp.model.MemberDTO;
import com.kosmo.springapp.model.ProfileImageDTO;
import com.kosmo.springapp.service.JWTokensService;
import com.kosmo.springapp.service.impl.LoginServiceImpl;

@RequestMapping("/project")
@Controller
public class MypageController {

	@Autowired
	private LoginServiceImpl loginService;
	@Autowired
	private JWTokensService jwTokensService;

	@Value("${secret-key}")
	private String secretKey;
	@Value("${token-name}")
	private String tokenName;

	//마이페이지 클릭 시
	@GetMapping("/MyPage.do")
	public String mypage(HttpServletRequest req, HttpServletResponse resp, Model model) {
		LocalDate current = LocalDate.now(); //현재날짜 구하기
		
		MemberDTO member = loginService.selectOne(req,resp);
		ProfileImageDTO profImg = loginService.selectProfImg(member.getId());
		
		model.addAttribute("current", current);
		model.addAttribute("info", member);//추후 더 추가해야함
		model.addAttribute("profImg", profImg);
		return "login/MyPage";
	}

	@PostMapping("/Password.do")
	@ResponseBody
	public String password(@RequestParam Map map) {
		boolean flag = loginService.isCorrectPassword(map);
		// 비밀번호가 틀린 경우는 이전 페이지로
		if (!flag) {
			return "<script>alert('비밀번호가 일치하지 않아요');history.back();</script>";
		}
		String queryString = "/project/JoinEdit.do?id="+map.get("id");
		// 비밀번호가 일치하는 경우
		return "<script>location.href='"+queryString+"'</script>";
	}
	
	//회원수정 클릭 후 비밀번호 일치 시
	@GetMapping("/JoinEdit.do")
	public String joinEdit(@RequestParam String id, Map map) {
		map.put("id", id);
		map.put("member",loginService.selectOne(map));
		
		return "login/JoinEdit";
	}
	
	@PostMapping("/JoinEditOk.do")
	@ResponseBody
	public String joinEditOk(@Valid MemberDTO member, Errors errors) {
		if (errors.hasErrors()) {
			return "<script>history.back();</script>";
		}
		int affected = loginService.update(member);
		if (affected == 1) {
			return "<script>alert('회원정보 수정이 완료되었습니다\\r\\마이페이지 화면으로 이동합니다');location.href=\'/project/MyPage.do\';</script>";
		} else {
			return "<script>alert('회원정보 수정에 실패하였습니다');history.back()</script>";
		}
	}
	
	//이미지 수정 클릭 시(파일선택)
	@PostMapping(value = "/ProfImgEdit.do", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public String profImgEdit(ProfileImageDTO dto, MemberDTO member, Model model) throws IllegalStateException, IOException {
		
		ProfileImageDTO info = loginService.editProfImg(dto);
		int insertFlag = loginService.insertProfImg(info);
		
		if(insertFlag==1) {
			member.setProf_Img_Fl("Y");
			loginService.updateProfImg(member);
		}
		
		model.addAttribute("SUCCFAIL", insertFlag);
		model.addAttribute("WHERE", "PROF");
		return "login/Message";
	}
	
	//이미지 수정 클릭 시(기본이미지)
	@GetMapping("/ProfImgEdit.do")
	public String profImgEditDefault(ProfileImageDTO dto, MemberDTO member, HttpServletRequest req, Model model) throws IllegalStateException, IOException {
		String id = jwTokensService.getTokenPayloads(jwTokensService.getToken(req, tokenName), secretKey).get("sub").toString();
		dto.setId(id);
		int deleteFlag = loginService.editProfImgDefault(dto);
		
		if(deleteFlag==1) {
			member.setProf_Img_Fl("N");
			member.setId(id);
			loginService.updateProfImg(member);
		}
		
		model.addAttribute("SUCCFAIL", deleteFlag);
		model.addAttribute("WHERE", "PROF");
		
		return "login/Message";
	}
	
	//클릭한 날짜 ajax로 받기
	@PostMapping("/Memo.do")
	public Map calendarPost(@RequestParam Map date) {
		System.out.println("date: "+date);
		return date;
	}
}
