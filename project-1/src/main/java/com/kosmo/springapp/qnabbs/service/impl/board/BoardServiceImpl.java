package com.kosmo.springapp.qnabbs.service.impl.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.springapp.qnabbs.service.DaoService;



@Service
public class BoardServiceImpl implements DaoService {

	@Autowired
	private BoardMapper mapper;
	
	@Override
	public List<Map> selectList(Map map) {
		return mapper.selectList(map);
	}

	@Override
	public Map selectOne(Map map) {
		return mapper.selectOne(map);
	}

	@Override
	public int insert(Map map) {
		return mapper.insert(map);
	}

	@Override
	public int update(Map map) {
		return mapper.update(map);
	}

	@Override
	public int delete(Map map) {
		return mapper.delete(map);
	}

}
