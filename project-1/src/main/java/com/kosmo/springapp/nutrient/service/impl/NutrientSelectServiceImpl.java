package com.kosmo.springapp.nutrient.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.springapp.nutrient.service.NutrientSelectService;


@Service
public class NutrientSelectServiceImpl implements NutrientSelectService {

	@Autowired
	private NutrientSelectMapper mapper;
	
	@Override
	public String editN_DESCbyVitaminName(String name) {

		String desc = mapper.getN_DESCbyVitaminName(name);

		if(desc != null) {
			desc = desc.replace("요.", "요.<br/><br/>");
			desc = desc.replace("해요!", "해요.<br/><br/>");
			desc = desc.replace("고용량 섭취했을 때 나타날 수 있는", "· 고용량 섭취했을 때 나타날 수 있는");
			desc = desc.replace("이 부위가", "· 이 부위가");
			desc = desc.replace("따라서 하나의 통일된 기준으로", "· 따라서 하나의 통일된 기준으로");
	        desc = desc.replace("하지만 다른 수용성 비타민에 비해", "· 하지만 다른 수용성 비타민에 비해");

		}
		else {
			desc = "";
		}
	    return desc;
	}
	
	@Override
	public String editN_CAUTIONbyVitaminName(String name) {

		String caution = mapper.getN_CAUTIONbyVitaminName(name);
	    
	    if (caution != null) {
	        caution = caution.replace("있음", "있어요.<br/><br/>");
	        caution = caution.replace("주의", "주의해야해요.<br/><br/>");
	        caution = caution.replace("권장함", "권장해요.<br/><br/>");
	        caution = caution.replace("기준으로 함", "기준으로 해요.<br/><br/>");
	        caution = caution.replace("상담 필요", "상담이 필요해요.<br/><br/>");
	        caution = caution.replace("추천", "추천해요.<br/><br/>");
	        caution = caution.replace("좋음", "좋아요.<br/><br/>");
	        caution = caution.replace("불쾌감 유발가능", "불쾌감을 유발할 수 있어요.<br/><br/>");
	        caution = caution.replace("· 장기간 고용량 복용시 흡연자 폐암 위험이 증가할 수 있어요.", "<span style=\"font-size: 27px;\">🚬</span> 장기간 고용량 복용시 흡연자 폐암 위험이 증가할 수 있어요.");
	        caution = caution.replace("· 임신 중 과다 복용시 기형 발생 위험 있어요.", "<span style=\"font-size: 27px;\">🤰</span> 임신 중 과다 복용시 기형 발생 위험 있어요.");
	        caution = caution.replace("· 고용량 섭취하면 간 기능에 영향을 줄 수 있으므로 전문가와 상담이 필요해요.", "<span style=\"font-size: 27px;\">🩺</span> 고용량 섭취하면 간 기능에 영향을 줄 수 있으므로 전문가와 상담이 필요해요.");
	        caution = caution.replace("· 통풍 환자는 증상이 악화될 수 있으므로 전문가와 상담이 필요해요.", "<span style=\"font-size: 27px;\">🩺</span> 통풍 환자는 증상이 악화될 수 있으므로 전문가와 상담이 필요해요.");
	        caution = caution.replace("· 심장 질환이 있는 경우 전문가와 상담이 필요해요.", "<span style=\"font-size: 27px;\">💗</span> 심장 질환이 있는 경우 전문가와 상담이 필요해요.");
	        caution = caution.replace("· 고용량 섭취하면 발작 증상이 나타날 수 있으므로 뇌전증 환자는 전문가와 상담이 필요해요.", "<span style=\"font-size: 27px;\">🧠</span> 고용량 섭취하면 발작 증상이 나타날 수 있으므로 뇌전증 환자는 전문가와 상담이 필요해요.");
	        caution = caution.replace("· 고용량 섭취하면 신장", "<span style=\"font-size: 27px;\">🚽</span> 고용량 섭취하면 신장");
	        caution = caution.replace("· 칼슘 흡수가 증가하므로 고칼슘혈증이 있는 경우 전문가와 상담이 필요해요.", "<span style=\"font-size: 27px;\">🩺</span> 칼슘 흡수가 증가하므로 고칼슘혈증이 있는 경우 전문가와 상담이 필요해요.");
	        caution = caution.replace("· 칼슘의 흡수를 높이기 때문에 심장 질환이 있는 경우 고용량 섭취", "<span style=\"font-size: 27px;\">💗</span> 칼슘의 흡수를 높이기 때문에 심장 질환이 있는 경우 고용량 섭취");
	        caution = caution.replace("· 수술 전후 지혈을 늦출 수 있어요.", "<span style=\"font-size: 27px;\">🩸</span> 수술 전후 지혈을 늦출 수 있어요.");
	        caution = caution.replace("· 고함량 복용 시 당뇨 환자의 심혈관질환 위험을 높일 수 있으므로 주의해야해요.", "<span style=\"font-size: 27px;\">💗</span> 고함량 복용 시 당뇨 환자의 심혈관질환 위험을 높일 수 있으므로 주의해야해요.");
	        caution = caution.replace("· 고용량 복용 시 일부 암의 재발 위험을 높일 수 있으므로 주의해야해요.", "<span style=\"font-size: 27px;\">🧬</span> 고용량 복용 시 일부 암의 재발 위험을 높일 수 있으므로 주의해야해요.");
	        caution = caution.replace("· 전립선 암에 악영향을 줄 수 있다는 우려가 있으므로", "<span style=\"font-size: 27px;\">🧬</span> 전립선 암에 악영향을 줄 수 있다는 우려가 있으므로");
	        caution = caution.replace("· 고용량 섭취시 복통 또는 설사 유발 가능하므로 주의해야해요.", "<span style=\"font-size: 27px;\">🚽</span> 고용량 섭취시 복통 또는 설사 유발 가능하므로 주의해야해요.");
	        caution = caution.replace("· 과도한 단백질 섭취시 신장과 간에 부담을 줄 수 있어요.", "<span style=\"font-size: 27px;\">🚽</span> 과도한 단백질 섭취시 신장과 간에 부담을 줄 수 있어요.");
	        caution = caution.replace("· 과도한 단백질 섭취시 당뇨 및 심혈관질환 발생가능성 증가","<span style=\"font-size: 27px;\">💗</span> 과도한 단백질 섭취시 당뇨 및 심혈관질환 발생가능성 증가");
	        caution = caution.replace("· 영양제를 통한 고용량 섭취 시 위장장애를 유발할 수 있으므로 주의해야해요.", "<span style=\"font-size: 27px;\">🚽</span> 영양제를 통한 고용량 섭취 시 위장장애를 유발할 수 있으므로 주의해야해요.");
	        caution = caution.replace("· 건강한 배변활동을 위해 충분한 수분섭취를 병행하는 것이 좋아요.", "<span style=\"font-size: 27px;\">💧</span> 건강한 배변활동을 위해 충분한 수분섭취를 병행하는 것이 좋아요.");
	        caution = caution.replace("· 과도한 식이섬유 섭취시 복통 또는 소화장애 등의 불쾌감을 유발할 수 있어요.", "<span style=\"font-size: 27px;\">🚽</span> 과도한 식이섬유 섭취시 복통 또는 소화장애 등의 불쾌감을 유발할 수 있어요.");
	        caution = caution.replace("· 식품으로 섭취했을 때 흡수되는 정도가 10~40%로 높지 않으므로", "<span style=\"font-size: 27px;\">💊</span> 식품으로 섭취했을 때 흡수되는 정도가 10~40%로 높지 않으므로");
	        caution = caution.replace("· 고용량 섭취시 두드러기 또는 가려움 유발", "<span style=\"font-size: 27px;\">🩹</span> 고용량 섭취시 두드러기 또는 가려움 유발");
	        caution = caution.replace("· 섭취량은 상황에 따라 개인차가", "<span style=\"font-size: 27px;\">🩺</span> 섭취량은 상황에 따라 개인차가");
	        caution = caution.replace("· 위장의 흡수 기능에", "<span style=\"font-size: 27px;\">🚽</span> 위장의 흡수 기능에");
	        caution = caution.replace("· 신장 질환이 있는 경우 전문가와 상담이 필요해요.", "<span style=\"font-size: 27px;\">🩺</span> 신장 질환이 있는 경우 전문가와 상담이 필요해요.");
	        caution = caution.replace("· 혈압이 너무 낮아질 수 있으므로", "<span style=\"font-size: 27px;\">🩸</span> 혈압이 너무 낮아질 수 있으므로");
	        caution = caution.replace("· 1000(μg) 이상으로 고용량 섭취", "<span style=\"font-size: 27px;\">🩺</span> 1000(μg) 이상으로 고용량 섭취");
	        caution = caution.replace("· 오메가-3와 오메가-6를", "<span style=\"font-size: 27px;\">⚖</span> 오메가-3와 오메가-6를");
	        
	        } 
	    else {
	        caution = "";
	    }
	    
	    return caution;
	}
	
	@Override
	public String editI_DESCbyIngredientName(String name) {
		
		String desc = mapper.getI_DESCbyIngredientName(name);

		if(desc != null) {
			desc = desc.replace("요.", "요.<br/><br/>");
			desc = desc.replace("해요!", "해요.<br/><br/>");
			desc = desc.replace("고용량 섭취했을 때 나타날 수 있는", "· 고용량 섭취했을 때 나타날 수 있는");
			desc = desc.replace("이 부위가", "· 이 부위에");
			desc = desc.replace("운동과", "· 운동과");
			desc = desc.replace("3.66mg", "3.66(mg)");
			desc = desc.replace("0.111mg", "0.111(mg)<br/>");
			desc = desc.replace("따라서 하나의 통일된 기준으로", "· 따라서 하나의 통일된 기준으로");
			desc = desc.replace("· 건강기능식품으로 인증 받지", "<br/>· 건강기능식품으로 인증 받지");
			desc = desc.replace("이런 경우에는", "· 이런 경우에는");
			desc = desc.replace("의 기술 수준에 따라서 실제로 건강에 도움이 되는 성분 함량이 달라질 수 있어요. · ", "의 기술 수준에 따라서 실제로 건강에 도움이 되는 성분 함량이 달라질 수 있어요.");
			desc = desc.replace("항산화 작용을 통해 노화를 막고,", "· 항산화 작용을 통해 노화를 막고,");
			desc = desc.replace("제품에서 추천하는 섭취량을 따르고, 느껴지는 효과에 따라 섭취량", "· 제품에서 추천하는 섭취량을 따르고, 느껴지는 효과에 따라 섭취량");
			desc = desc.replace("만약 고용량을 드시려는 경우에는", "· 만약 고용량을 드시려는 경우에는");
			desc = desc.replace("1) 뼈 & 관절 건강: 0.5~1(g)","1) 뼈 & 관절 건강: 0.5~1(g)<br/><br/>");
			desc = desc.replace("HCA 함량이 표시되어 있다면", "· HCA 함량이 표시되어 있다면");
			
		}
		else {
			desc = "";
		}
	    return desc;
	}
	
	
	@Override
	public String editI_CAUTIONbyIngredientName(String name) {
		
		String caution = mapper.getI_CAUTIONbyIngredientName(name);
	    
	    if (caution != null) {
	        caution = caution.replace("있음", "있어요.<br/><br/>");
	        caution = caution.replace("주의", "주의해야해요.<br/><br/>");
	        caution = caution.replace("권장함", "권장해요.<br/><br/>");
	        caution = caution.replace("기준으로 함", "기준으로 해요.<br/><br/>");
	        caution = caution.replace("상담 필요", "상담이 필요해요.<br/><br/>");
	        caution = caution.replace("추천", "추천해요.<br/><br/>");
	        caution = caution.replace("좋음", "좋아요.<br/><br/>");
	        caution = caution.replace("불쾌감 유발가능", "불쾌감을 유발할 수 있어요.<br/><br/>");
	        caution = caution.replace("· 신장 질환이 있는 경우 전문가와 상담이 필요해요.", "<span style=\"font-size: 27px;\">🩺</span> 신장 질환이 있는 경우 전문가와 상담이 필요해요.");
	        caution = caution.replace("· 수술 전후 지혈을 늦출 수 있어요.", "<span style=\"font-size: 27px;\">🩸</span> 수술 전후 지혈을 늦출 수 있어요.");
	        caution = caution.replace("· 임산부 대상 연구가 부족하므로 전문가와 상담이 필요해요.", "<span style=\"font-size: 27px;\">🤰</span> 임산부 대상 연구가 부족하므로 전문가와 상담이 필요해요.");
	        caution = caution.replace("· 수유부 대상 연구가 부족하므로 전문가와 상담이 필요해요.", "<span style=\"font-size: 27px;\">👶</span> 수유부 대상 연구가 부족하므로 전문가와 상담이 필요해요.");
	        caution = caution.replace("· 발작 증상이 나타날 수 있으므로 뇌전증 환자는","<span style=\"font-size: 27px;\">🧠</span> 발작 증상이 나타날 수 있으므로 뇌전증 환자는");
	        caution = caution.replace("· 갑상선 질환이 있거나", "<span style=\"font-size: 27px;\">🩺</span> 갑상선 질환이 있거나");
	        caution = caution.replace("· 갑각류 알러지 주의해야해요.","<span style=\"font-size: 27px;\">🦞</span> 갑각류 알러지 주의해야해요.");
	        caution = caution.replace("· 천식 치료제의 효과", "<span style=\"font-size: 27px;\">😷</span> 천식 치료제의 효과");
	        caution = caution.replace("· 간 기능이 저하될 수 있으므로", "<span style=\"font-size: 27px;\">🩺</span> 간 기능이 저하될 수 있으므로");
	        caution = caution.replace("· 심장 질환이 있는 경우 전문가와 상담이 필요해요.", "<span style=\"font-size: 27px;\">💗</span> 심장 질환이 있는 경우 전문가와 상담이 필요해요.");
	        caution = caution.replace("· 정신행동질환이 있는 경우", "<span style=\"font-size: 27px;\">🧠</span> 정신행동질환이 있는 경우");
	        caution = caution.replace("· 수술 전후 혈당 수치와", "<span style=\"font-size: 27px;\">🩸</span> 수술 전후 혈당 수치와");
	        //가르니시아
	        
	        	        
	        
	    } 
	    else {
	        caution = "";
	    }
	    
	    return caution;
	}
	
	
	
	
	
	

}