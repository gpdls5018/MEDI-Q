package com.kosmo.springapp.qnabbs.service;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

public interface DaoService<T> {

	ListPagingData<Map> selectList(Map map, HttpServletRequest req, int nowPage);
	Map selectOne(Map map);
	int insert(Map map);
	int update(Map map);
	int delete(Map map);
}
