package com.kosmo.springapp.qnabbs.service.impl.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardMapper {

	List<Map> selectList(Map map);
	Map selectOne(Map map);
	int insert(Map map);
	int update(Map map);
	int delete(Map map);
	int count(Map map);
}
