package com.kosmo.springapp.qnabbs.service;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface DaoService {

	ListPagingData<Map> selectList(Map map, HttpServletRequest req, int nowPage);
	Map selectOne(Map map);
	int insert(Map map);
	int update(Map map);
	int delete(Map map);
}
