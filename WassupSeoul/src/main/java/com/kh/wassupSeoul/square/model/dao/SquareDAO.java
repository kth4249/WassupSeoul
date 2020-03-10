package com.kh.wassupSeoul.square.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.wassupSeoul.common.vo.PageInfo;
import com.kh.wassupSeoul.street.model.vo.Street;

@Repository
public class SquareDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getListCount() throws Exception{
		return sqlSession.selectOne("streetMapper.getListCount");
	}
	
	
	public List<Street> selectList(PageInfo pInf) throws Exception{
		int offset = (pInf.getCurrentPage() - 1) * pInf.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInf.getLimit());
		return sqlSession.selectList("streetMapper.selectList", null, rowBounds);
	}

}
