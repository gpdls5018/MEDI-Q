package com.kosmo.springapp.service;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.kosmo.springapp.model.MemberDTO;

@Mapper
public interface LoginMapper {

	boolean findByIdAndPwd(Map map);//회원여부 체크

	boolean checkById(Map map);//아이디 중복 체크용

	int save(MemberDTO member);//회원가입 insert

	MemberDTO searchIdNPwd(Map map); //아이디 찾기, 비밀번호 찾기로 얻은 회원 정보 

	int saveSocial(Map userInfo);//카카오,네이버 로그인 시 회원정보 저장

	int checkBySocial(Map userInfo);//카카오, 네이버 로그인 정보 확인

	boolean checkByPassword(Map map); //로그인한 회원이 입력한 비밀번호가 일치하는지 확인

	int update(MemberDTO info); //회원정보 수정

}
