package com.kh.wassupSeoul.square.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.wassupSeoul.common.vo.PageInfo;
import com.kh.wassupSeoul.street.model.vo.Keyword;
import com.kh.wassupSeoul.street.model.vo.Street;

@Repository
public class SquareDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 골목 수 조회용 DAO
	 * @return listCount
	 * @throws Exception
	 */
	public int getListCount() throws Exception{
		return sqlSession.selectOne("streetMapper.getListCount");
	}
	
	
	/** 골목 리스트 조회용 DAO
	 * @param pInf
	 * @return sList
	 * @throws Exception
	 */
	public List<Street> selectList(PageInfo pInf, Map<String, Object> map) throws Exception{
		int offset = (pInf.getCurrentPage() - 1) * pInf.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInf.getLimit());
		return sqlSession.selectList("streetMapper.selectList", map, rowBounds);
	}


	/** 골목 키워드 리스트 조회용 DAO
	 * @param sList
	 * @return kList
	 * @throws Exception
	 */
	public List<Keyword> selectKeywordList(List<Street> sList) throws Exception{
		return sqlSession.selectList("streetMapper.selectKeywordList", sList);
	}

}
