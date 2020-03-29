package com.kh.wassupSeoul.admin.model.service;

import java.util.List;

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
	 * @param memberNo
	 * @return result
	 * @throws Exception
	 */
	public abstract int deleteMember(int memberNo) throws Exception;

}
