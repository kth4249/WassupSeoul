package com.kh.wassupSeoul.square.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wassupSeoul.common.vo.PageInfo;
import com.kh.wassupSeoul.square.model.dao.SquareDAO;
import com.kh.wassupSeoul.square.model.vo.Alarm;
import com.kh.wassupSeoul.street.model.vo.Keyword;
import com.kh.wassupSeoul.street.model.vo.Street;

@Service
public class SquareServiceImpl implements SquareService{
	
	@Autowired
	private SquareDAO squareDAO;
	
	/** 골목 조회용 Service
	 * @return listCount
	 * @throws Exception
	 */
	@Override
	public int getListCount(Map<String, Object> map) throws Exception {
		return squareDAO.getListCount(map);
	}
	
	
	/** 전체 골목 조회용 Service
	 * @return list
	 * @throws Exception
	 */
	@Override
	public List<Street> selectList(PageInfo pInf, Map<String, Object> map) throws Exception{
		return squareDAO.selectList(pInf, map);
	}
	
	
	/** 골목 키워드 조회용 Service
	 * @param sList
	 * @return kList
	 * @throws Exception
	 */
	@Override
	public List<Keyword> selectKeywordList(List<Street> sList) throws Exception {
		return squareDAO.selectKeywordList(sList);
	}
	
	
	/** 알람 테이블 조회용 Service
	 * @param memberNo
	 * @return alList
	 */
	@Override
	public List<Alarm> selectAlarm(int memberNo) {
		return squareDAO.selectAlarm(memberNo);
	}
	
	
	/** 알람 확인상태로 변경 Service
	 * @param alarmNo
	 */
	@Override
	public void checkAlarm(int alarmNo) {
		squareDAO.checkAlarm(alarmNo);
	}
	
}
