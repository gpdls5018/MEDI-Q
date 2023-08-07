package com.kosmo.springapp.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.impl.model.file.FileDataModel;
import org.apache.mahout.cf.taste.impl.neighborhood.ThresholdUserNeighborhood;
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.EuclideanDistanceSimilarity;
import org.apache.mahout.cf.taste.impl.similarity.TanimotoCoefficientSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.neighborhood.UserNeighborhood;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.UserBasedRecommender;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.springapp.model.AllFoodDTO;
import com.kosmo.springapp.model.AvgStarScoreCountDTO;
import com.kosmo.springapp.model.FunctionalFoodListDTO;
import com.kosmo.springapp.model.MemberDTO;
import com.kosmo.springapp.service.impl.LoginServiceImpl;
import com.kosmo.springapp.service.impl.SelectFoodServiceImpl;
@Controller
public class SelectFoodRankListController {
	@Autowired
	SelectFoodServiceImpl selectfoodservice;

	@Autowired
	 private LoginServiceImpl loginService;
	
	@GetMapping("/ranking/selectfoodcompany.do")
	public String foodcompany(Model model) {
		List<String> RankingKeyWord = selectfoodservice.RankingKeyWord();
		List<AvgStarScoreCountDTO> listData = selectfoodservice.selectFoodListFoodScore();
		model.addAttribute("RankingKeyWord", RankingKeyWord);
		model.addAttribute("listData", listData);
		model.addAttribute("casesel",3);
		return "ranking/FoodRank";
	}

	@GetMapping("/functionfood/selectissue.do")
    public String hselectissue2(Model models,HttpServletRequest req,HttpServletResponse resp) throws IOException, TasteException {
        List<FunctionalFoodListDTO> list1 = new ArrayList<>();
		MemberDTO memberDto = loginService.selectOne(req);
		Calendar calendar = Calendar.getInstance();
        int currentYear = calendar.get(Calendar.YEAR);
        System.out.println((int)currentYear - Integer.parseInt(memberDto.getBirth().substring(0, 4)));
        int age = (int)currentYear - Integer.parseInt(memberDto.getBirth().substring(0, 4));
        int ages = age - (age %10);
        System.out.println(ages);
        if(ages >60) {
        	ages = 60;
        }
        // 모델 로드 또는 생성
        DataModel model = new FileDataModel(new File("src/main/resources/static/Data/random_rating.csv"));

        UserSimilarity similarity = new EuclideanDistanceSimilarity(model);
        UserNeighborhood neighborhood = new ThresholdUserNeighborhood(0.1, similarity, model);
        UserBasedRecommender recommender = new GenericUserBasedRecommender(model, neighborhood, similarity);
        List<RecommendedItem> recommendations = recommender.recommend(ages, 5); // 사용자 20에게 5개의 추천 아이템 가져오기
        System.out.println("Recommendations for user "+ages+"대 추천");
        for (RecommendedItem recommendation : recommendations) {
            System.out.println(recommendation);
            list1.addAll(selectfoodservice.RecommendationFood(Long.toString(recommendation.getItemID())));
        }
        models.addAttribute("listData", list1);
        models.addAttribute("ages", ages);
        return "test1";
    }
	
	@GetMapping("/food/foodsearch.do")
	public String foodsearch(String food,Model model) {
		List<AllFoodDTO> foodlist = selectfoodservice.FoodSearch(food);
		model.addAttribute("foodlist", foodlist);
		return "test2";
	}
	@GetMapping("/food/intakefood.do")
	public String intakefood(String no,HttpServletRequest req,HttpServletResponse resp) {
		System.out.println(no);
		MemberDTO memberDto = loginService.selectOne(req);
		String ID = memberDto.getId();
		selectfoodservice.IntakeFood(no, ID);
		Date currentDate = new Date();

        SimpleDateFormat dateFormat = new SimpleDateFormat("yy/MM/dd");
        String formattedDate = dateFormat.format(currentDate);
        System.out.println(formattedDate);
		return "test2";
	}
	@GetMapping("/food/test2.do")
	public String test2() {
		return "test2";
	}

	
	@GetMapping("/ranking/HealthSelect.do")
	public String hselectissue() {
		return "ranking/HealthSelect";
	}
	
	@GetMapping("/functionfood/healthissue.do")
	public String hissue(@RequestParam String healthissue,Model model) {
		List<AvgStarScoreCountDTO> listData = new ArrayList<>();
		List<AvgStarScoreCountDTO> listData2 = new ArrayList<>();
		String Hissuecous = selectfoodservice.healthIssueCou(healthissue);
		String[] Hissuecou = Hissuecous.split("\\$");
		Set<AvgStarScoreCountDTO> uniqueData = new HashSet<>();
        for (String hins : Hissuecou) {
            for (AvgStarScoreCountDTO hin : selectfoodservice.selectFoodListFromHealthissue(hins)) {
                // listData에 객체를 추가하기 전에 중복 여부를 체크합니다.
                if (!uniqueData.contains(hin)) {
                    listData.add(hin);
                    uniqueData.add(hin);
                }
            }
            for (AvgStarScoreCountDTO hin : selectfoodservice.FoodListFromHealthissue(hins)) {
                // listData2에 객체를 추가하기 전에 중복 여부를 체크합니다.
                if (!uniqueData.contains(hin)) {
                    listData2.add(hin);
                    uniqueData.add(hin);
                }
            }
        }
        if(healthissue.trim().equals("혈관")) {
        	healthissue = "혈관 & 혈액순환";
        }
        else if(healthissue.trim().equals("스트레스")) {
        	healthissue = "스트레스 & 수면";
        }
        else if(healthissue.trim().equals("노화")) {
        	healthissue = "노화 & 항산화";
        }
        else if(healthissue.trim().equals("소화")) {
        	healthissue = "소화 & 위식도 건강";
        }
        else if(healthissue.trim().equals("치아")) {
        	healthissue = "치아 & 잇몸";
        }
        else if(healthissue.trim().equals("임산부")) {
        	healthissue = "임산부 & 태아 건강";
        }
        else if(healthissue.trim().equals("운동 능력")) {
        	healthissue = "운동 능력 & 근육량";
        }
        else if(healthissue.trim().equals("탈모")) {
        	healthissue = "탈모 & 손톱 건강";
        }

		model.addAttribute("healthissue", healthissue);
		model.addAttribute("listData", listData);
		model.addAttribute("listData2", listData2);
		model.addAttribute("listsize", uniqueData.size());
		return "ranking/HealthIssueFood";
	}
	
	@GetMapping("/ranking/selectfoodnutrient.do")
	public String foodnutrient(Model model) {
		List<String> RankingKeyWord = selectfoodservice.RankingKeyWord();
		List<AvgStarScoreCountDTO> listData = selectfoodservice.selectFoodListFoodScore();
		model.addAttribute("RankingKeyWord", RankingKeyWord);
		model.addAttribute("listData", listData);
		model.addAttribute("casesel",2);
		return "ranking/FoodRank";
	}
	
	@GetMapping("/ranking/selectfood.do")
	public String foodrank(Model model) {
		List<String> RankingKeyWord = selectfoodservice.RankingKeyWord();
		List<AvgStarScoreCountDTO> listData = selectfoodservice.selectFoodListFoodScore();
		model.addAttribute("RankingKeyWord", RankingKeyWord);
		model.addAttribute("listData", listData);
		model.addAttribute("casesel",1);
		
		return "ranking/FoodRank";
	}
	////////////////////////////////////////////////////////////////////////
	@GetMapping("/functionfood/select.do")
	public String selectfood(@RequestParam String foodname,Model model) {
		if(selectfoodservice.checkWord(foodname).size() == 0) {
			selectfoodservice.newWord(foodname);
		}
		selectfoodservice.selectKeyWord(foodname);
		List<String> RankingKeyWord = selectfoodservice.RankingKeyWord();
		List<AvgStarScoreCountDTO> listData = selectfoodservice.selectFoodListFromNameScore(foodname,1);
		List<FunctionalFoodListDTO> listData2 = selectfoodservice.selectFoodListFromName(foodname,1);
		
		model.addAttribute("RankingKeyWord", RankingKeyWord);
		model.addAttribute("listData", listData);
		model.addAttribute("listData2", listData2);
		model.addAttribute("foodname", foodname);
		model.addAttribute("casesel", 1);
		return "ranking/FoodRank";
	}
	
	@GetMapping("/functionfood/selectnutrient.do")
	public String selectfoodnutrient(@RequestParam String foodname,Model model) {
		if(selectfoodservice.checkWord(foodname).size() == 0) {
			selectfoodservice.newWord(foodname);
		}
		selectfoodservice.selectKeyWord(foodname);
		List<String> RankingKeyWord = selectfoodservice.RankingKeyWord();
		List<AvgStarScoreCountDTO> listData = selectfoodservice.selectFoodListFromNameScore(foodname,2);
		List<FunctionalFoodListDTO> listData2 = selectfoodservice.selectFoodListFromName(foodname,2);
		
		model.addAttribute("RankingKeyWord", RankingKeyWord);
		model.addAttribute("listData", listData);
		model.addAttribute("listData2", listData2);
		model.addAttribute("foodname", foodname);
		model.addAttribute("casesel", 2);
		return "ranking/FoodRank";
	}
	
	@GetMapping("/functionfood/selectcompany.do")
	public String selectfoodcompany(@RequestParam String foodname,Model model) {
		if(selectfoodservice.checkWord(foodname).size() == 0) {
			selectfoodservice.newWord(foodname);
		}
		selectfoodservice.selectKeyWord(foodname);
		List<String> RankingKeyWord = selectfoodservice.RankingKeyWord();
		List<AvgStarScoreCountDTO> listData = selectfoodservice.selectFoodListFromNameScore(foodname,3);
		List<FunctionalFoodListDTO> listData2 = selectfoodservice.selectFoodListFromName(foodname,3);
		
		model.addAttribute("RankingKeyWord", RankingKeyWord);
		model.addAttribute("listData", listData);
		model.addAttribute("listData2", listData2);
		model.addAttribute("foodname", foodname);
		model.addAttribute("casesel", 3);
		return "ranking/FoodRank";
	}
}
