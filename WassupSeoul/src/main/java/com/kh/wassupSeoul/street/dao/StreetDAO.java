package com.kh.wassupSeoul.street.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.wassupSeoul.street.model.vo.Street;

@Repository
public class StreetDAO {

	@Autowired	
	private SqlSessionTemplate sqlSession;

	/** 골목 조회용 DAO
	 * @param streetNo
	 * @return street
	 * @throws Exception
	 */
	public Street selectStreet(Integer streetNo) throws Exception{
		return sqlSession.selectOne("streetMapper.selectStreet", streetNo );
	}

}
