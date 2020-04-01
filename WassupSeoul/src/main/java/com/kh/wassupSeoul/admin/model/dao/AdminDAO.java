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
	 * @param deleteMemberNo
	 * @return result
	 * @throws Exception
	 */
	public int deleteMember(int deleteMemberNo) throws Exception {
		
		return sqlSession.update("adminMapper.deleteMember", deleteMemberNo);
	}

	/** 골목 폐쇄용 DAO
	 * @param deleteStreetNo
	 * @return result
	 * @throws Exception
	 */
	public int deleteStreet(Integer deleteStreetNo) throws Exception {
		
		return sqlSession.update("adminMapper.deleteStreet", deleteStreetNo);
	}

	/** 관심사 삭제용 DAO
	 * @param deleteHobbyNo
	 * @return result
	 * @throws Exception
	 */
	public int deleteHobby(Integer deleteHobbyNo) throws Exception {
		
		return sqlSession.delete("adminMapper.deleteHobby", deleteHobbyNo);
	}

	/** 활동보고서 상세보기용 DAO
	 * @param selectReportNo
	 * @return report
	 * @throws Exception
	 */
	public Report selectReport(Integer selectReportNo) throws Exception {
		
		return sqlSession.selectOne("adminMapper.selectReport", selectReportNo);
	}

	/** 회원 상세보기용 DAO
	 * @param selectMemberNo
	 * @return member
	 * @throws Exception
	 */
	public Member selectMember(Integer selectMemberNo) throws Exception {
		
		return sqlSession.selectOne("adminMapper.selectMember", selectMemberNo);
	}

	/** 회원 상세보기용(관심사조회) DAO
	 * @param selectMemberNo
	 * @return hList
	 * @throws Exception
	 */
	public List<Hobby> selectHobby(Integer selectMemberNo) throws Exception {
		
		return sqlSession.selectList("adminMapper.selectHobby", selectMemberNo);
	}

	/** 골목 점수 부여용 DAO
	 * @param giveStreetPointReportNo
	 * @return result
	 * @throws Exception
	 */
	public int giveStreetPoint(int no) throws Exception {
		
		return sqlSession.update("adminMapper.giveStreetPoint", no);
	}

	/** 보고서 삭제용 DAO
	 * @param no
	 * @return result
	 * @throws Exception
	 */
	public int deleteReport(int no) throws Exception {
		
		return sqlSession.delete("adminMapper.deleteReport", no); 
	}

}
