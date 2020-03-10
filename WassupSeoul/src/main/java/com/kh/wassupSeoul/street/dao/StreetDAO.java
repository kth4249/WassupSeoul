package com.kh.wassupSeoul.street.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class StreetDAO {

	@Autowired	
	private SqlSessionTemplate sqlSession;

}
