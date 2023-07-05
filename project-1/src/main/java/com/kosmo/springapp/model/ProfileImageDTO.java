package com.kosmo.springapp.model;

import javax.validation.constraints.NotNull;

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
@Alias("profImgDto")
@Component
public class ProfileImageDTO {

	@NotNull
	private String piNo; //프로필이미지 일련번호
	
	private String id; //프로필이미지 등록 아이디
	
	private String smEail; //프로필이미지 등록 이메일(소셜로그인)
	
	@NotNull
	private String piPath; //프로필이미지 저장경로
	
	@NotNull
	private String piFilename; //프로필이미지 파일명
	
	@NotNull
	private String piExt; //프로필이미지 파일 확장자
}
