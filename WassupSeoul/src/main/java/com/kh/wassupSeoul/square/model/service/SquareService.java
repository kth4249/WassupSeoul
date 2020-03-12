package com.kh.wassupSeoul.square.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kh.wassupSeoul.common.vo.PageInfo;
import com.kh.wassupSeoul.street.model.vo.Keyword;
import com.kh.wassupSeoul.street.model.vo.Street;

@Service
public interface SquareService {

	
	/** 골목 조회용 Service
	 * @return listCount
	 * @throws Exception
	 */
	public abstract int getListCount() throws Exception;

	
	/** 전체 골목 조회용 Service
	 * @return list
	 * @throws Exception
	 */
	public abstract List<Street> selectList(PageInfo pInf, Map<String, Object> map) throws Exception;


	/** 골목 키워드 조회용 Service
	 * @param sList
	 * @return kList
	 * @throws Exception
	 */
	public abstract List<Keyword> selectKeywordList(List<Street> sList) throws Exception;
	


}
