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

import com.kosmo.springapp.analyze.model.HealthIssueDTO;
import com.kosmo.springapp.analyze.model.NutrientDTO;
import com.kosmo.springapp.analyze.service.impl.AnalyzeServiceImpl;
import com.kosmo.springapp.model.FunctionalFoodListDTO;
import com.kosmo.springapp.service.impl.MainPageServiceImpl;

@Controller
public class ResultController {
	
	@Autowired
	MainPageServiceImpl mainPageService;
	
	@Autowired
	AnalyzeServiceImpl analyzeService;
	
	
	static String[] nuts = {"비타민A"	,"베타카로틴","비타민B12","비타민B2","나이아신","판토텐산","비타민B6","비오틴","엽산"
					,"비타민B1","비타민C","비타민D","비타민E","비타민K","칼슘","마그네슘","철","아연","구리","셀레늄","요오드"		
					,"몰리브덴","망간","칼륨","크롬","식이섬유","단백질","필수지방산"};//나중에 nutrient테이블 N_SUBNAME으로 가져오기
	
	static String[] ings = {"오메가3","프로바이오틱스(유산균)","가르시니아캄보지아","레시틴(포스파티딜콜린)","코엔자임Q10","루테인","바나바잎"	
					,"글루코사민","옥타코사놀","쏘팔메토","폴리코사놀"	,"공액리놀레산"	,"스페인감초추출물(글라브리딘)","녹차추출물"		
					,"잔티젠","시서스추출물","홍삼","밀크씨슬(실리마린)","감마리놀렌산(GLA)","히알루론산","홍국","프로폴리스","지아잔틴"	
					,"감태","아스타잔틴","빌베리추출물","허니부쉬추출물","인삼","MSM","유단백가수분해물"	,"은행잎추출물"	,"커큐민(강황추출물)	"	
					,"시네트롤	","로즈마리자몽추출복합물","보스웰리아","엉겅퀴복합추출물","대두이소플라본","알로에전잎","감마오리자놀"		
					,"그린커피빈","키토산","N-아세틸글루코사민","크레아틴","곰피","프락토올리고당","크랜베리(안토시아노사이드)","피크노제놀(프로시아니딘)"		
					,"아르기닌	","UDCA","테아닌","락토페린	","스피루리나","차전자피식이섬유","회화나무열매추출물","매스틱검","글루타치온"		
					,"폴리감마글루탐산","콜레우스포스콜리","L-카르니틴","콜라겐","포스파티딜세린","맥주효모","이눌린식이섬유","홍경천추출물"	
					,"콘드로이친","마카","크릴오일","뮤코다당단백","알로에겔","클로렐라","헛개나무열매","헤모힘","프리바이오틱스","세라마이드"};//나중에 INGREDIENT에서 I_SUBNAME으로 가져오기
	
	@GetMapping("/healthresult.do")
	public String healthResult(Map map,Model model,@RequestParam String no) {
		map.put("no",Integer.parseInt("6"));//사용자가 선택한 건기식의 고유번호를 가져옴
		FunctionalFoodListDTO listOne = mainPageService.selectFoodOneByNo(map);//map에 no라는 이름으로 no값가져와서 찾기
		HealthIssueDTO healthIssueOne = analyzeService.findHealthIssueByNo(8);//28개의 헬스이슈 고유의 번호가 있음
		Pattern cappattern = Pattern.compile("[0-9.]{1,}");//뒤의 단위 생략용도 ※상한용량은 null값이 있어서 사용에 조심해야함
		String healthissuepattern = "\\s*,\\s*";//비타민C, 비타민D, 칼슘, 셀레늄, 프로폴리스 이런식으로 저장되어 있음
        String[] h_nuts = healthIssueOne.getH_NUTRIENT().split(healthissuepattern);//위의 저 패턴으로 나눔
		float total_result=0;//영양제 점수
		
		
        for (String nut : nuts){//위에 저장된 28가지 영양소 만큼 for문
            NutrientDTO nutdto = analyzeService.findNutrientByName(nut);//현재 영양소에 해당하는 정보를 가져온다(서브네임과 비교한다)
            String listpattern = nut + "[^0-9.]*([0-9.]+)";//영양소 이름 다음에 나오는 숫자 또는 (.) 까지를 무시하고 숫자와.만 가져온다
            Pattern listregex = Pattern.compile(listpattern);
            Matcher listmatcher = listregex.matcher(listOne.getStandard());//건기식 정보를 가져올때 비타민 C 같은 경우가 있어 띄워쓰기를 없애는 용도
	        Matcher DMmatcher = cappattern.matcher(nutdto.getN_DRI_M());
            Matcher DFmatcher = cappattern.matcher(nutdto.getN_DRI_F());
            if (listmatcher.find()) {//남자 28가지영양소 점수 부여
                String nutNumber = listmatcher.group(1);//건기식에 저장된 영양소량 확인용
        		//System.out.println("헬스이슈에 있는 영양소:"+hnut.trim());
            	//if(nut.equalsIgnoreCase(hnut)) {//여기서 하는거아니고 75개 비교시 사용
            	//System.out.println(nut);//영양소확인용
            	//System.out.println(nutNumber);//영양소량 확인용
            	if(DMmatcher.find()) {
            		if(nutdto.getN_UL_M() != null) {//상한 섭취량 존재유무 판단
            			Matcher UMmatcher = cappattern.matcher(nutdto.getN_UL_M());
            			if(UMmatcher.find()) {
            				if(Float.parseFloat(DMmatcher.group(0)) > Float.parseFloat(nutNumber)) {
	            				total_result += 1.5;
	            				System.out.println(nut+" : "+nutNumber + " 최소용량 : " + DMmatcher.group(0));
	            			}//권장 섭취량 보다 조금 먹었을 경우 1.5점 추가
	            			else if(Float.parseFloat(DMmatcher.group(0)) <= Float.parseFloat(nutNumber) &&
	            					Float.parseFloat(UMmatcher.group(0)) > Float.parseFloat(nutNumber)) {
	            				total_result += 2.5;
	            				System.out.println(nut+" : "+nutNumber + " 최소용량 : " + DMmatcher.group(0) + " 최대용량 : " + UMmatcher.group(0));
	            			}//권장 섭취량과 상한 섭취량 사이로 먹었을 경우 2.5점 추가
	            			else {
	            				total_result += 2;
	            				System.out.println(nut+" : "+nutNumber + " 최소용량 : " + DMmatcher.group(0) + " 최대용량 : " + UMmatcher.group(0));
	            			}//상한섭취량보다 많이 먹었을 경우 2점추가
            			}//UMmatcher확인용
            		}//if(nutdto.getN_UL_F() != null) 끝(상한 섭취량이 존재함)
            		else {
            			if(Float.parseFloat(DMmatcher.group(0)) > Float.parseFloat(nutNumber)){
            				total_result += 1.5;
            				System.out.println(nut+" : "+nutNumber + " 최소용량 : " + DMmatcher.group(0));
            			}//상한 섭취량이 없고 권장서취량보다 적게 먹었을 경우 1.5점 추가
            			else if(Float.parseFloat(DMmatcher.group(0)) <= Float.parseFloat(nutNumber)){
            				total_result += 2.5;
            				System.out.println(nut+" : "+nutNumber + " 최소용량 : " + DMmatcher.group(0) + " 최대용량 : 없음");
            			}//상한섭취량이 없고 권장섭취량 보다 많이먹었을 경우 2.5점추가
            		}//if(nutdto.getN_UL_M() != null) else문 끝(상한 섭취량이 없는 경우)
        		}//DMmatcher확인용
            	
            	
	    		if(DFmatcher.find()) {//여자 28가지영양소 점수 부여
	    			if(nutdto.getN_UL_F() != null) {//상한 섭취량 존재 유무 판단
            			Matcher UFmatcher = cappattern.matcher(nutdto.getN_UL_F());
            			if(UFmatcher.find()) {
            				if(Float.parseFloat(DFmatcher.group(0)) > Float.parseFloat(nutNumber)) {
	            				total_result += 1.5;
	            				System.out.println(nut+" : "+nutNumber + " 최소용량 : " + DFmatcher.group(0));
	            			}//권장 섭취량 보다 조금 먹었을 경우 1.5점 추가
	            			else if(Float.parseFloat(DFmatcher.group(0)) <= Float.parseFloat(nutNumber) &&
	            					Float.parseFloat(UFmatcher.group(0)) > Float.parseFloat(nutNumber)) {
	            				total_result += 2.5;
	            				System.out.println(nut+" : "+nutNumber + " 최소용량 : " + DFmatcher.group(0) + " 최대용량 : " + UFmatcher.group(0));
	            			}//권장 섭취량과 상한 섭취량 사이로 먹었을 경우 2.5점 추가
	            			else {
	            				total_result += 2;
	            				System.out.println(nut+" : "+nutNumber + " 최소용량 : " + DFmatcher.group(0) + " 최대용량 : " + UFmatcher.group(0));
	            			}//상한섭취량보다 많이 먹었을 경우 2점추가
            			}//UFmatcher확인용
            		}//if(nutdto.getN_UL_M() != null) 끝(상한 섭취량이 존재함)
            		else {
            			if(Float.parseFloat(DFmatcher.group(0)) > Float.parseFloat(nutNumber)){
            				total_result += 1.5;
            				System.out.println(nut+" : "+nutNumber + " 최소용량 : " + DFmatcher.group(0));
            			}//상한 섭취량이 없고 권장서취량보다 적게 먹었을 경우 1.5점 추가
            			else if(Float.parseFloat(DFmatcher.group(0)) <= Float.parseFloat(nutNumber)){
            				total_result += 2.5;
            				System.out.println(nut+" : "+nutNumber + " 최소용량 : " + DFmatcher.group(0) + " 최대용량 : 없음");
            			}//상한섭취량이 없고 권장섭취량 보다 많이먹었을 경우 2.5점추가
            			
            		}//if(nutdto.getN_UL_F() != null) else문 끝(상한 섭취량이 없는 경우)
	    			
	        	}//여자 권장 섭취량확인 끝
	    		
            }//영양제 matcher확인 끝
            
        }//28가지 영양제for문 끝
        
		System.out.println("당신의 점수는: "+(int)Math.ceil(total_result));
    	return "test1";
    }
}
