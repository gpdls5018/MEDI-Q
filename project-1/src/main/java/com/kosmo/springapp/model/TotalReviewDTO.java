package com.kosmo.springapp.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.type.Alias;
import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Component
@Alias("totalReviewDto")
public class TotalReviewDTO {
	int starScoreTotal;
	Map starScore;
	List<Map<String,Integer>> effectList;
	List<Map<String,Integer>> noEffectList;
}
