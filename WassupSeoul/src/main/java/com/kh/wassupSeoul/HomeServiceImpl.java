package com.kh.wassupSeoul;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wassupSeoul.common.vo.PageInfo;
import com.kh.wassupSeoul.street.model.vo.Street;

@Service
public class HomeServiceImpl implements HomeService{
	
	@Autowired
	private HomeDAO homeDAO;
	
	/** 골목 조회용 Service
	 * @return listCount
	 * @throws Exception
	 */
	@Override
	public int getListCount() throws Exception {
		return homeDAO.getListCount();
	}
	
	
	/** 전체 골목 조회용 Service
	 * @return list
	 * @throws Exception
	 */
	@Override
	public List<Street> selectList(PageInfo pInf) throws Exception{
		return homeDAO.selectList(pInf);
	}
}
