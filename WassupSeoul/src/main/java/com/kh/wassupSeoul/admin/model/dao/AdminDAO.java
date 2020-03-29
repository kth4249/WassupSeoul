package com.kh.wassupSeoul.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.wassupSeoul.hobby.model.vo.Hobby;
import com.kh.wassupSeoul.member.model.vo.Member;
import com.kh.wassupSeoul.street.model.vo.Report;
import com.kh.wassupSeoul.street.model.vo.Street;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 회원 목록 조회용 DAO
	 * @return mList
	 * @throws Exception
	 */
	public List<Member> selectMemberList() throws Exception {
		
		return sqlSession.selectList("adminMapper.selectMemberList");
	}

	/** 골목 목록 조회용 DAO
	 * @return sList
	 * @throws Exception
	 */
	public List<Street> selectStreetList() throws Exception {
		
		return sqlSession.selectList("adminMapper.selectStreetList");
	}

	/** 전체 관심사 목록 조회용 DAO
	 * @return hList
	 * @throws Exception
	 */
	public List<Hobby> selectHobbyList() throws Exception {
		
		return sqlSession.selectList("adminMapper.selectHobbyList");
	}

	/** 활동보고서 목록 조회용 DAO
	 * @return rList
	 * @throws Exception
	 */
	public List<Report> selectReportList() throws Exception {
		
		return sqlSession.selectList("adminMapper.selectReportList");
	}

	/** 회원 강퇴용 DAO
	 * @param memberNo
	 * @return result
	 * @throws Exception
	 */
	public int deleteMember(int memberNo) throws Exception {
		
		return sqlSession.update("adminMapper.deleteMember", memberNo);
	}

}
