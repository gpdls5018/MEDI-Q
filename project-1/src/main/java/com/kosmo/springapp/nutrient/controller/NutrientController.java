package com.kosmo.springapp.nutrient.controller;

import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.springapp.nutrient.service.impl.NutrientSelectMapper;
import com.kosmo.springapp.nutrient.service.impl.NutrientSelectServiceImpl;

@Controller
public class NutrientController {

	@Autowired
	private NutrientSelectMapper nutrietnSelectMapper;
	
	@Autowired
	private NutrientSelectServiceImpl nutrientSelectServiceImpl;
	
	@GetMapping("/NutrientSelect.do")
	public String nutrientselect(Model model) {
		
		List<String> vitaminNames = nutrietnSelectMapper.getVitaminName();
		model.addAttribute("vitaminNames",vitaminNames);
		
		List<String> etcNames = nutrietnSelectMapper.getETCName();
		model.addAttribute("etcNames",etcNames);
		
		List<String> ingredientNames = nutrietnSelectMapper.getIngredientName();
		model.addAttribute("ingredientNames",ingredientNames);
		
		// 조회수에 따른 Top10 가져오기
		List<String> top10 = nutrietnSelectMapper.getTop10();
		model.addAttribute("top10",top10);
		
		return "nutrient/NutrientSelect";
	}
	
	@GetMapping("/NutrientDetail.do")
	public String nutrientdetail(@RequestParam String name, Model model) {
		
		// 탭 이동시 뿌려주기
		List<String> vitaminNames = nutrietnSelectMapper.getVitaminName();
		model.addAttribute("vitaminNames",vitaminNames);
		
		List<String> etcNames = nutrietnSelectMapper.getETCName();
		model.addAttribute("etcNames",etcNames);
		
		List<String> ingredientNames = nutrietnSelectMapper.getIngredientName();
		model.addAttribute("ingredientNames",ingredientNames);
		
		// 5대 영양소 상세정보들
		String n_FUNC = nutrietnSelectMapper.getN_FUNCbyVitaminName(name);
		model.addAttribute("n_FUNC",n_FUNC);
		
//		String n_DESC = nutrietnSelectMapper.getN_DESCbyVitaminName(name);
//		model.addAttribute("n_DESC",n_DESC);
		
		String desc = nutrientSelectServiceImpl.editN_DESCbyVitaminName(name);
		model.addAttribute("desc",desc);
		
		String n_DRI_M = nutrietnSelectMapper.getN_DRI_MbyVitaminName(name);
		model.addAttribute("n_DRI_M",n_DRI_M);
		
		String n_DRI_F = nutrietnSelectMapper.getN_DRI_FbyVitaminName(name);
		model.addAttribute("n_DRI_F",n_DRI_F);
		
		String n_UL_M = nutrietnSelectMapper.getN_UL_MbyVitaminName(name);
		model.addAttribute("n_UL_M",n_UL_M);
		
		String n_UL_F = nutrietnSelectMapper.getN_UL_FbyVitaminName(name);
		model.addAttribute("n_UL_F",n_UL_F);
		
		String n_LACK = nutrietnSelectMapper.getN_LACKbyVitaminName(name);
		model.addAttribute("n_LACK",n_LACK);
		
//		String n_CAUTION = nutrietnSelectMapper.getN_CAUTIONbyVitaminName(name);
//		model.addAttribute("n_CAUTION",n_CAUTION);
		
		String caution = nutrientSelectServiceImpl.editN_CAUTIONbyVitaminName(name);
		model.addAttribute("caution",caution);
		
		String n_FOOD = nutrietnSelectMapper.getN_FOODNbyVitaminName(name);
		model.addAttribute("n_FOOD",n_FOOD);
		
		// 원료 상세정보들
		String i_FUNC = nutrietnSelectMapper.getI_FUNCbyIngredientName(name);
		model.addAttribute("i_FUNC",i_FUNC);
		
//		String i_DESC = nutrietnSelectMapper.getI_DESCbyIngredientName(name);
//		model.addAttribute("i_DESC",i_DESC);
		
		String i_desc = nutrientSelectServiceImpl.editI_DESCbyIngredientName(name);
		model.addAttribute("i_desc",i_desc);
		
		String i_DRI = nutrietnSelectMapper.getI_DRIbyIngredientName(name);
		model.addAttribute("i_DRI",i_DRI);
		
		String i_UL = nutrietnSelectMapper.getI_ULbyIngredientName(name);
		model.addAttribute("i_UL",i_UL);
		
//		String i_CAUTION = nutrietnSelectMapper.getI_CAUTIONbyIngredientName(name);
//		model.addAttribute("i_CAUTION",i_CAUTION);
		
		String i_caution = nutrientSelectServiceImpl.editI_CAUTIONbyIngredientName(name);
		model.addAttribute("i_caution",i_caution);
		
		// 5대 영양소 포함 추천 영양제 Top5
		List<Map<String, Object>> n_productInfoList = nutrietnSelectMapper.getProductNameNImgUrlFromFoodtableByN(name);
		model.addAttribute("n_productInfoList", n_productInfoList);

		// 기능성 원료 포함 추천 영양제 Top5
		List<Map<String, Object>> i_productInfoList = nutrietnSelectMapper.getProductNameNImgUrlFromFoodtableByI(name);
		model.addAttribute("i_productInfoList", i_productInfoList);

		
		// 조회수
		// 5대 영양소
		if (vitaminNames.contains(name) || etcNames.contains(name)) {
			int n_view = nutrietnSelectMapper.getN_VIEW(name);
			//System.out.println(n_view);
			nutrietnSelectMapper.increaseN_VIEW(name);
			model.addAttribute("n_view",n_view+1);
		}
		// 기능성 원료
		else {
			int i_view = nutrietnSelectMapper.getI_VIEW(name);
			//System.out.println(i_view);
			nutrietnSelectMapper.increaseI_VIEW(name);
			model.addAttribute("i_view",i_view+1);
		}
		
		// 조회수에 따른 Top10 가져오기
		List<String> top10 = nutrietnSelectMapper.getTop10();
		model.addAttribute("top10",top10);
		
		
		
		
		return "nutrient/NutrientDetail";
		
	}
	
	// 추천 영양제 상세페이지로 이동
	@GetMapping("/NutrientToFoodDetail.do")
	public String nutrientToFoodDetail(@RequestParam String name, Model model) {
		
		// 영양제의 번호 가져오기
		String no = nutrietnSelectMapper.findNobyFoodName(name);
		//System.out.println(no);
		
		// 영양제의 조회수 가져오기
		int f_view = nutrietnSelectMapper.getF_VIEW(name);
		nutrietnSelectMapper.increaseF_VIEW(name);
		model.addAttribute("f_view",f_view+1);
		
		
		
		
		
		
		
	    return "redirect:/detail.do?no=" + no;
	}
		
		
		
		
	
	
	
}
	
	
	
	
	
	
	
	
	
	
	
	
