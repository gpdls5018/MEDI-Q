package com.kosmo.springapp.model;

import java.sql.Date;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

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
@Alias("socialDto")
@Component
public class SocialDTO {
	
	public static final String REGEX_EMAIL = "^[a-z][a-z0-9]{5,11}@[a-z]{3,8}\\.(com|net|co\\.kr)$";
	public static final String REGEX_NAME = "[가-힣]{2,}";

	@NotBlank(message = "이메일을 입력하세요")
	@Pattern(regexp = REGEX_EMAIL,message = "잘못된 이메일 형식입니다")
	private String email;
	
	private String gender;
	
	private String site;
	
	private Date reg_Date;
	
	private String update_Info;//정부 추가 여부
	
	@Pattern(regexp = REGEX_NAME, message = "한글 2자 이상 입력하세요")
	private String name;
	
	private String birth;
}
