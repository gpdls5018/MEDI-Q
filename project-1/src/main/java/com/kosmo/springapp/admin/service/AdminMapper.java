package com.kosmo.springapp.admin.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kosmo.springapp.model.MemberDTO;

@Mapper
public interface AdminMapper {

	// 전체 회원 목록 가져오기
	List<MemberDTO> getMemberInfo();
	
	// 회원 정보 삭제
	int deleteMemberInfoByAdmin(String memberId);

	// 회원 정보 수정 전 조회
	MemberDTO getMemberInfoById(String memberId);
	
	// 회원 정보 수정 후 처리
	int updateMemberInfoByAdmin(MemberDTO memberdto);

	// 달력에 로그인 수 뿌려주기
	int count_6days_ago();
	int count_5days_ago();
	int count_4days_ago();
	int count_3days_ago();
	int count_2days_ago();
	int count_1days_ago();
	int count_0days_ago();

	// 로그인 기록 테이블에 추가
	void insertLoginMember(String id);

	
	
	
	
	
	
	/*
	 ///////////////////MEMBER 테이블

	MemberDTO findMember(String id); //아이디로 회원정보 가져오기

	boolean findByIdAndPwd(Map map);//회원여부 체크

	boolean checkById(Map map);//아이디 중복 체크용

	int save(MemberDTO member);//회원가입 insert

	MemberDTO searchIdNPwd(Map map); //아이디 찾기, 비밀번호 찾기로 얻은 회원 정보 

	boolean checkByPassword(Map map); //로그인한 회원이 입력한 비밀번호가 일치하는지 확인

	int update(MemberDTO info); //회원정보 수정
	
	int updateProfImg(MemberDTO dto); //프로필 이미지 유무 업데이트
	
	
	
	///////////////////SOCIAL 테이블
	
	int saveSocial(Map userInfo);//카카오,네이버 로그인 시 회원정보 저장

	int checkBySocial(Map userInfo);//카카오, 네이버 로그인 정보 확인
	
	
	
	///////////////////PROFILE_IMAGE 테이블

	int saveProfImg(ProfileImageDTO info); //프로필 이미지 선택 시(기본 이미지 X)

	ProfileImageDTO findProfImg(String id); //회원의 프로필 이미지 정보 가져오기

	int deleteProfImg(String id); //기본이미지 선택 시 회원의 프로필 이미지 삭제
 
	 */
	
	
	
}
