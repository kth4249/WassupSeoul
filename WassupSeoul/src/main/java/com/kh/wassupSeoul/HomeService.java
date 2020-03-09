package com.kh.wassupSeoul;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.wassupSeoul.common.vo.PageInfo;
import com.kh.wassupSeoul.street.model.vo.Street;

@Service
public interface HomeService {

	
	/** 골목 조회용 Service
	 * @return listCount
	 * @throws Exception
	 */
	public abstract int getListCount() throws Exception;

	
	/** 전체 골목 조회용 Service
	 * @return list
	 * @throws Exception
	 */
	public abstract List<Street> selectList(PageInfo pInf) throws Exception;
	


}
