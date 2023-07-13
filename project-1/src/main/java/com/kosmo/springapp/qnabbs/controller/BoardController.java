package com.kosmo.springapp.qnabbs.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.springapp.qnabbs.service.ListPagingData;
import com.kosmo.springapp.qnabbs.service.PagingUtil;
import com.kosmo.springapp.qnabbs.service.impl.board.BoardServiceImpl;




@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardServiceImpl board;
	
	@GetMapping("/List.do")
	public String list(
			@RequestParam Map map,
			@RequestParam(required = false,defaultValue = "1",value = PagingUtil.NOWPAGE) int nowPage,HttpServletRequest req,
			Model model) {
		//Map map = new HashMap<>();
		//List<Map> records = board.selectList(map);
		//System.out.println("페이징적용 후");
		//System.out.println("페이징 처리 확인용");
		ListPagingData<Map> listPagingData= board.selectList(map, req, nowPage);
		//System.out.println("페이징 처리 확인용1");
		//System.out.println(listPagingData);
		model.addAttribute("listPagingData", listPagingData);
		//System.out.println("페이징 처리 확인용2");
		return "board/List";
	}
	@GetMapping("/Write.do")
	public String write() {
		return "board/Write";
	}
	@PostMapping("/WriteProcess.do")
	public String writeProcess(@RequestParam Map map,Model model) {
		map.put("id", "KIM");
		int affected = board.insert(map);
		System.out.println(affected);
		//System.out.println("SELECT 전"+map);
		map = board.selectOne(map);
		//System.out.println("SELECT 후"+map);
		model.addAttribute("result", map);
		
		return  "board/View";
	}
	
	@RequestMapping("/View.do")
	public String view(@RequestParam Map map,Model model) { 
		
		map = board.selectOne(map);
		model.addAttribute("result", map);
		
		return "board/View";
	}
	@GetMapping("/Edit.do")
	public String edit(@RequestParam Map map,Model model) {
		System.out.println(123);
		map.put("id", "KIM");
		map=board.selectOne(map);
		System.out.println(map);
		model.addAttribute("result", map);
		System.out.println("result값확인"+model);
		return "board/Edit";
	}
	@PostMapping("/EditProcess.do")
	public String editProcess(@RequestParam Map map,Model model) {
		map.put("id", "KIM");
		System.out.println("여기부터...");
		int affected = board.update(map);
	    if (affected == 0) {
	        model.addAttribute("inputError", "입력 오류입니다. 다시 입력해주세요");
	        model.addAttribute("result", map);
	        return "board/Edit";
	    }
	    //redircet로도 가능
	    //return "redirect:/board/View.do?no=" + map.get("no");
	    // forward로 이동할 경로에 "/board"를 추가하여 수정
	    return "forward:/board/View.do";
	}
	
	@GetMapping("/Delete.do")
	public String delete(@RequestParam Map map,Model model) {
		map.put("id", "KIM");
		System.out.println("여기부터...또");
		//서비스 호출
		int affected = board.delete(map);
	    System.out.println("여기 delete후 "+affected);
		if (affected == 0) {
	        model.addAttribute("FAILURE", "삭제할 수 없어요");
	        return "forward:/board/View.do";
	    }
	    System.out.println("삭제된 글 수: " + affected);
	    // 뷰정보 반환 - 목록을 처리하는 컨트롤러로 이동
	    return "forward:/board/List.do"; 
	}	
	/*
	@GetMapping("/Reply.do")
	public String reply(@RequestParam Map map,Model model) {
		model.addAttribute("", model);
		return "";
	}
	*/
}
