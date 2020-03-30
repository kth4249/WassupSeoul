package com.kh.wassupSeoul.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wassupSeoul.admin.model.dao.AdminDAO;
import com.kh.wassupSeoul.hobby.model.vo.Hobby;
import com.kh.wassupSeoul.member.model.vo.Member;
import com.kh.wassupSeoul.street.model.vo.Report;
import com.kh.wassupSeoul.street.model.vo.Street;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO adminDAO;

	
	/** 회원 목록 조회용 Service
	 * @return mList
	 * @throws Exception
	 */
	@Override
	public List<Member> selectMemberList() throws Exception {
		
		return adminDAO.selectMemberList();
	}
	
	/** 골목 목록 조회용 Service
	 * @return sList
	 * @throws Exception
	 */
	@Override
	public List<Street> selectStreetList() throws Exception {
		
		return adminDAO.selectStreetList();
	}
	
	
	
	/** 전체 관심사 목록 조회용 Service
	 * @return hList
	 * @throws Exception
	 */
	@Override
	public List<Hobby> selectHobbyList() throws Exception {
		
		return adminDAO.selectHobbyList();
	}
	
	
	/** 활동보고서 목록 조회용 Service
	 * @return rList
	 * @throws Exception
	 */
	@Override
	public List<Report> selectReportList() throws Exception {
		
		return adminDAO.selectReportList();
	}
	
	/** 회원 강퇴용 Service
	 * @param deleteMemberNo
	 * @return result
	 * @throws Exception
	 */
	@Override
	public int deleteMember(int deleteMemberNo) throws Exception {
		
		return adminDAO.deleteMember(deleteMemberNo);
	}
	
	/** 골목 폐쇄용 Service
	 * @param deleteStreetNo
	 * @return result
	 * @throws Exception
	 */
	@Override
	public int deleteStreet(Integer deleteStreetNo) throws Exception {
		
		return adminDAO.deleteStreet(deleteStreetNo);
	}
	
	/** 관심사 삭제용 Service
	 * @param hobbyNo
	 * @return result
	 * @throws Exception
	 */
	@Override
	public int deleteHobby(Integer deleteHobbyNo) throws Exception {
		
		return adminDAO.deleteHobby(deleteHobbyNo);
	}
	
	/** 활동 보고서 상세보기용 Service
	 * @param selectReportNo
	 * @return report
	 * @throws Exception
	 */
	@Override
	public Report selectReport(Integer selectReportNo) throws Exception {
		
		return adminDAO.selectReport(selectReportNo);
	}
	
	/** 회원 상세보기용 Service
	 * @param selectMemberNo
	 * @return member
	 * @throws Exception
	 */
	@Override
	public Member selectMember(Integer selectMemberNo) throws Exception {
		
		return adminDAO.selectMember(selectMemberNo);
	}
}
