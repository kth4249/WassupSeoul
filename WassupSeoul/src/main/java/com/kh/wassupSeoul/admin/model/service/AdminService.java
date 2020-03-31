package com.kh.wassupSeoul.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kh.wassupSeoul.hobby.model.vo.Hobby;
import com.kh.wassupSeoul.member.model.vo.Member;
import com.kh.wassupSeoul.street.model.vo.Report;
import com.kh.wassupSeoul.street.model.vo.Street;

@Service
public interface AdminService {

	
	/** 회원 목록 조회용 Service
	 * @return mList
	 * @throws Exception
	 */
	public abstract List<Member> selectMemberList() throws Exception;

	/** 골목 목록 조회용 Service
	 * @return sList
	 * @throws Exception
	 */
	public abstract List<Street> selectStreetList() throws Exception;

	/** 전체 관심사 목록 조회용 Service
	 * @return hList
	 * @throws Exception
	 */
	public abstract List<Hobby> selectHobbyList() throws Exception;

	/** 활동보고서 목록 조회용 Service
	 * @return rList
	 * @throws Exception
	 */
	public abstract List<Report> selectReportList() throws Exception;

	/** 회원 강퇴용 Service
	 * @param deleteMemberNo
	 * @return result
	 * @throws Exception
	 */
	public abstract int deleteMember(int deleteMemberNo) throws Exception;

	/** 골목 폐쇄용 Service
	 * @param deleteStreetNo
	 * @return result
	 * @throws Exception
	 */
	public abstract int deleteStreet(Integer deleteStreetNo) throws Exception;

	/** 관심사 삭제용 Service
	 * @param hobbyNo
	 * @return result
	 * @throws Exception
	 */
	public abstract int deleteHobby(Integer deleteHobbyNo) throws Exception;

	/** 활동 보고서 상세보기용 Service
	 * @param selectReportNo
	 * @return report
	 * @throws Exception
	 */
	public abstract Report selectReport(Integer selectReportNo) throws Exception;

	/** 회원 상세보기용 Service
	 * @param selectMemberNo
	 * @return member
	 * @throws Exception
	 */
	public abstract Map<String, Object> selectMember(Integer selectMemberNo) throws Exception;


}
