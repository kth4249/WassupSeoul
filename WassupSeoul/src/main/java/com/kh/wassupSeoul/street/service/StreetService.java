package com.kh.wassupSeoul.street.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.wassupSeoul.street.model.vo.Board;
import com.kh.wassupSeoul.street.model.vo.Street;

@Service
public interface StreetService {

	/** 골목 조회용 service
	 * @param streetNo 
	 * @return street
	 * @throws Exception
	 */
	public abstract Street selectStreet(Integer streetNo) throws Exception;

	
	/** 골목 게시글 조회용 service
	 * @param streetNo
	 * @return list
	 * @throws Exception
	 */
	public abstract List<Board> selectBoard(Integer streetNo) throws Exception;
	 
}
