package com.kosmo.springapp.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.springapp.model.MemberDTO;
import com.kosmo.springapp.service.impl.LoginServiceImpl;

@RequestMapping("/project")
@Controller
public class MypageController {

	@Autowired
	private LoginServiceImpl loginService;

	@GetMapping("/MyPage.do")
	public String mypage() {
		// 정보 꾸려야함
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
		// 비밀번호가 일치하는 경우
		return "<script>location.href=\'/project/JoinEdit.do\'</script>";
	}
	
	//회원가입 클릭 후 비밀번호 입력 시
	@PostMapping("JoinEdit.do")
	public String joinEdit(@RequestParam Map map) {
		loginService.selectOne(map);
		
		return "login/JoinEdit";
	}
	
	@PostMapping("JoinEditOk.do")
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
}
