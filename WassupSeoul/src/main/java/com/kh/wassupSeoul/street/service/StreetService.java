package com.kh.wassupSeoul.street.service;

import org.springframework.stereotype.Service;

import com.kh.wassupSeoul.street.model.vo.Street;

@Service
public interface StreetService {

	/** 골목 조회용 service
	 * @param streetNo 
	 * @return street
	 * @throws Exception
	 */
	public abstract Street selectStreet(Integer streetNo) throws Exception;
	 
}
