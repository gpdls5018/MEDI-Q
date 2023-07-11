package com.kosmo.springapp.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.springapp.model.FunctionalFoodListDTO;
import com.kosmo.springapp.model.ReviewDTO;
import com.kosmo.springapp.model.TotalReviewDTO;
import com.kosmo.springapp.service.ReviewMapper;
import com.kosmo.springapp.service.ReviewService;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewDTO reviewDTO;
	
	@Autowired
	ReviewMapper reviewMapper;
	
	@Override
	public int registerReview(Map map) {
		reviewDTO.setR_id(map.get("id").toString());
		System.out.println("map.get(id).toString():"+map.get("id").toString());
		reviewDTO.setTakeTime(map.get("takeTime").toString());
		reviewDTO.setStarScore(map.get("starScore").toString());
		reviewDTO.setEffect(map.get("effect").toString());
		reviewDTO.setNoEffect(map.get("noEffect").toString());
		reviewDTO.setContent(map.get("content").toString());
		reviewDTO.setR_productNo(Integer.parseInt(map.get("no").toString()));
		
		
		return reviewMapper.registerReview(reviewDTO);
	}

	@Override
	public FunctionalFoodListDTO selectFoodOneByNo(int no) {
		return reviewMapper.selectFoodOneByNo(no);
	}

	@Override
	public List<ReviewDTO> selectReviewByFoodNo(Map map) {
		return reviewMapper.selectReviewByFoodNo(map);
	}

	@Override
	public TotalReviewDTO selectTotalReviewInfo(int no) {
		TotalReviewDTO totalReviewDto = new TotalReviewDTO();
		int starScoreAVG = reviewMapper.selectTotalReviewInfoStarScoreAverage(no);
		totalReviewDto.setStarScoreTotal(starScoreAVG);
		Map starScore = reviewMapper.selectTotalReviewInfoStarScore(no);
		totalReviewDto.setStarScore(starScore);
		
		List<Map<String,Integer>> effectList = reviewMapper.selectTotalReviewInfoEffectList(no);
		totalReviewDto.setEffectList(effectList);
		
		List<Map<String,Integer>> noEffectList = reviewMapper.selectTotalReviewInfoNoEffectList(no);
		totalReviewDto.setNoEffectList(noEffectList);
		
		return totalReviewDto;
	}

}
