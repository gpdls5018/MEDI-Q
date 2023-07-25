package com.kosmo.springapp.admin.service;

import java.util.List;
import java.util.Map;

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

	// 달력에 회원가입자 수 뿌려주기
	int scount_6days_ago();
	int scount_5days_ago();
	int scount_4days_ago();
	int scount_3days_ago();
	int scount_2days_ago();
	int scount_1days_ago();
	int scount_0days_ago();

	// 연령대별 회원 가져오기
	List<Map<String, Object>> getAgeData();

	
	
	
	
	
	
	
	
	
	
	
	
}
