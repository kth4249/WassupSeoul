package com.kh.wassupSeoul.street.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wassupSeoul.street.dao.StreetDAO;
import com.kh.wassupSeoul.street.model.vo.Street;

@Service
public class StreetServiceImpl implements StreetService{

	
	@Autowired
	private StreetDAO streetDAO;


	/** 골목 조회용 service
	 * @return street
	 * @throws Exception
	 */
	@Override
	public Street selectStreet(Integer streetNo) throws Exception {
		return streetDAO.selectStreet(streetNo);
	}
	
	
	
	
	
}
