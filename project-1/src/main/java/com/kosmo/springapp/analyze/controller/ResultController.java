package com.kosmo.springapp.analyze.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.springapp.model.FunctionalFoodListDTO;
import com.kosmo.springapp.service.impl.MainPageServiceImpl;

@Controller
public class ResultController {
	
	@Autowired
	MainPageServiceImpl mainPageService;
	
	static String[] nuts = {"비타민A"	,"베타카로틴","비타민B1","비타민B2","나이아신","판토텐산","비타민B6","비오틴","엽산","비타민B12"							,"비타민C","비타민D","비타민E","비타민K","칼슘","마그네슘","철","아연","구리","셀레늄","요오드","망간"							,"몰리브덴","칼륨","크롬","식이섬유","단백질","필수지방산"};
	
	static String[] ings = {"오메가3","프로바이오틱스(유산균)","가르시니아캄보지아","레시틴(포스파티딜콜린)","코엔자임Q10","루테인","바나바잎	"	
					,"글루코사민","옥타코사놀","쏘팔메토","폴리코사놀"	,"공액리놀레산"	,"스페인감초추출물(글라브리딘)","녹차추출물"		
					,"잔티젠","시서스추출물","홍삼","밀크씨슬(실리마린)","감마리놀렌산(GLA)","히알루론산","홍국","프로폴리스","지아잔틴	"	
					,"감태","아스타잔틴","빌베리추출물","허니부쉬추출물","인삼","MSM","유단백가수분해물"	,"은행잎추출물"	,"커큐민(강황추출물)	"	
					,"시네트롤	","로즈마리자몽추출복합물","보스웰리아","엉겅퀴복합추출물","대두이소플라본","알로에전잎","감마오리자놀"		
					,"그린커피빈","키토산","N-아세틸글루코사민","크레아틴","곰피","프락토올리고당","크랜베리(안토시아노사이드)","피크노제놀(프로시아니딘)"		
					,"아르기닌	","UDCA","테아닌","락토페린	","스피루리나","차전자피식이섬유","회화나무열매추출물","매스틱검","글루타치온"		
					,"폴리감마글루탐산","콜레우스포스콜리","L-카르니틴","콜라겐","포스파티딜세린","맥주효모","이눌린식이섬유","홍경천추출물	"	
					,"콘드로이친","마카","크릴오일","뮤코다당단백","알로에겔","클로렐라","헛개나무열매","헤모힘","프리바이오틱스","세라마이드"};
	
	@GetMapping("healthresult.do")
	public String healthResult(Map map,Model model,@RequestParam String no) {
		map.put("no",Integer.parseInt("6"));
		FunctionalFoodListDTO listOne = mainPageService.selectFoodOneByNo(map);
		System.out.println(listOne.getStandard());
		String input = listOne.getStandard();
		
        Map<String, String> ingredients = extractIngredients(input);
        for (Map.Entry<String, String> entry : ingredients.entrySet()) {
           String name = entry.getKey();
            String value = entry.getValue();
            System.out.println(name + ": " + value);
        }
    	return "/slider/Magazine"+5;
    }
	
	public static Map<String, String> extractIngredients(String input) {
    	Map<String,String> nut_dose = new HashMap<>();
        for (String nut : nuts) {
            String pattern = nut + "\\s[^0-9.]*([0-9.]+)";
            Pattern regex = Pattern.compile(pattern);
            Matcher matcher = regex.matcher(input);
            if (matcher.find()) {
                String nutNumber = matcher.group(1);
                nut_dose.put(nut,nutNumber);
                System.out.println(nut+":"+nut_dose.get(nut));
            }
        }
        return nut_dose;
    }

}
