package com.kosmo.springapp.qnabbs.service;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

//안쓸듯?
@Getter
@Setter
@Alias("answerDto")
public class AnswerBoardDTO {

	private String answer_no;
	private String board_no;
	private String content;
	private Date postdate;
	private String id;
	private String name;
}
