package com.kosmo.springapp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.kosmo.springapp.model.HealthMemoDTO;
import com.kosmo.springapp.model.MemberDTO;
import com.kosmo.springapp.model.ProfileImageDTO;
import com.kosmo.springapp.service.FCMInitializer;
import com.kosmo.springapp.service.JWTokensService;
import com.kosmo.springapp.service.impl.HealthMemoIServicempl;
import com.kosmo.springapp.service.impl.LoginServiceImpl;

@RequestMapping("/project")
@Controller
public class MypageController {

	@Autowired
	private LoginServiceImpl loginService;
	@Autowired
	private HealthMemoIServicempl healthMemoIServicempl;
	@Autowired
	private JWTokensService jwTokensService;

	@Value("${secret-key}")
	private String secretKey;
	@Value("${token-name}")
	private String tokenName;

	//마이페이지 클릭 시
	@GetMapping("/MyPage.do")
	public String mypage(HttpServletRequest req, HttpServletResponse resp, Model model) throws IOException {
		/*
		//firebase
		String filePath = "json";
        
		Resource resource = new ClassPathResource(filePath);
		String directoryPath = resource.getFile().getAbsolutePath()+File.separator+FCMInitializer.FIREBASE_CONFIG_PATH;
		
        // ClassPathResource객체 생성.
        ClassPathResource resource = new ClassPathResource(filePath);
        
        //물리적 경로 얻기
        File file = resource.getFile();
        String directoryPath = file.getAbsolutePath();
        
		System.out.println("directoryPath: "+directoryPath);
		//"path/to/serviceAccountKey.json"
		FileInputStream serviceAccount = new FileInputStream(directoryPath);
		
		FirebaseApp firebaseApp = null;
		List<FirebaseApp> firebaseApps = FirebaseApp.getApps();
		if(firebaseApps != null && !firebaseApps.isEmpty()) {
			System.out.println("if문 안");
			for(FirebaseApp app : firebaseApps) {
				System.out.println("app: "+app);
				if(app.getName().equals(FirebaseApp.DEFAULT_APP_NAME))
					firebaseApp = app;
			}
		}
		else {
			System.out.println("else문 안");
			FirebaseOptions options = new FirebaseOptions.Builder()
					   .setCredentials(GoogleCredentials.fromStream(serviceAccount))
					   .build();
	
			firebaseApp = FirebaseApp.initializeApp(options);
		}
		System.out.println("firebaseApp: "+firebaseApp);
		*/
		LocalDate current = LocalDate.now(); //현재날짜 구하기
		Map map = new HashMap<>();
		//System.out.println("date: "+date);
		MemberDTO member = loginService.selectOne(req,resp);
		
		String id="";
		String sm_email="";
		ProfileImageDTO profImg=null;
		
		if(member.getId() == null) {
			sm_email = member.getEmail();
			map.put("sm_email", sm_email);
			profImg = loginService.selectProfImg(sm_email);
		}
		else {
			id = member.getId();
			map.put("id", id);
			profImg = loginService.selectProfImg(id);
		}
		
		String key = member.getId()==null?member.getEmail():member.getId();
		
		
		List<HealthMemoDTO> memos = healthMemoIServicempl.selectAll(req);
		for(HealthMemoDTO m : memos) {
			m.setMm_Date(m.getMm_Date().split(" ")[0]);
		}
		
		map.put("mm_Id", key);//////////////////////////////////////////
		map.put("mm_Date", current);
		HealthMemoDTO memo = healthMemoIServicempl.selectOne(map);
		if(memo != null) {
			memo.setMm_Date(memo.getMm_Date().split(" ")[0]);
		}
		model.addAttribute("current", current);
		model.addAttribute("info", member);//추후 더 추가해야함
		model.addAttribute("profImg", profImg);
		model.addAttribute("memos", memos);
		model.addAttribute("memo", memo);
		
		return "login/MyPage";
	}
	
	@GetMapping("/ClickDate.do")
	public String clickDate(@RequestParam String clickDate, HttpServletRequest req, HttpServletResponse resp, Model model) {
		MemberDTO member = loginService.selectOne(req,resp);

		ProfileImageDTO profImg = loginService.selectProfImg(member.getId()==null?member.getEmail():member.getId());
		List<HealthMemoDTO> memos = healthMemoIServicempl.selectAll(req);
		for(HealthMemoDTO m : memos) {
			m.setMm_Date(m.getMm_Date().split(" ")[0]);
		}
		
		String key = member.getId()==null?member.getEmail():member.getId();
		
		Map map = new HashMap<>();
		
		if(key.contains("@")) {
			map.put("mm_email", key);
		}
		else {
			map.put("mm_Id", key);
		}
		map.put("mm_Date", clickDate);
		HealthMemoDTO memo = healthMemoIServicempl.selectOne(map);
		
		if(memo != null) {
			memo.setMm_Date(memo.getMm_Date().split(" ")[0]);
		}
		model.addAttribute("clickDate", clickDate);
		model.addAttribute("info", member);//추후 더 추가해야함
		model.addAttribute("profImg", profImg);
		model.addAttribute("memos", memos);
		model.addAttribute("memo", memo);
		
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
		return "<script>location.href='/project/JoinEdit.do'</script>";
	}
	
	//회원수정 클릭 후 비밀번호 일치 시
	@GetMapping("/JoinEdit.do")
	public String joinEdit(HttpServletRequest req, HttpServletResponse resp, Map map) {
		MemberDTO member = loginService.selectOne(req,resp);
		String key = member.getId()==null ? member.getEmail() : member.getId();
		if(key.contains("@")) {
			map.put("email", key);
		}
		else {
			map.put("id", key);
		}
		map.put("info",loginService.selectOne(map));
		
		return "login/JoinEdit";
	}
	
	//회원정보 수정 완료 클릭 후
	@PostMapping("/JoinEditOk.do")
	@ResponseBody
	public String joinEditOk(@Valid MemberDTO member, Errors errors) {
		if (errors.hasErrors()) {
			System.out.println("에러: "+errors);
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
		System.out.println("member.getId(): "+member.getId());
		System.out.println("getSm_Email: "+info.getSm_Email());
		if(dto.getId().contains("@")) {
			info.setSm_Email(dto.getId());
			System.out.println("if문 안: "+info.getSm_Email());
		}
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
	
	//정신건강테스트1
	@GetMapping("/MentalTest1.do")
	public String mentalTest1() {
		return "mentaltest/MentalTest1";
	}
	//정신건강테스트2
	@GetMapping("/MentalTest2.do")
	public String mentalTest2() {
		return "mentaltest/MentalTest2";
	}
	//정신건강테스트3
	@GetMapping("/MentalTest3.do")
	public String mentalTest3(HttpServletRequest req, HttpServletResponse resp, Model model) {
		MemberDTO member = loginService.selectOne(req,resp);
		System.out.println("member: "+member);
		model.addAttribute("info", member);
		return "mentaltest/MentalTest3";
	}
	//정신건강테스트4
	@GetMapping("/MentalTest4.do")
	public String mentalTest4() {
		return "mentaltest/MentalTest4";
	}
	
}
