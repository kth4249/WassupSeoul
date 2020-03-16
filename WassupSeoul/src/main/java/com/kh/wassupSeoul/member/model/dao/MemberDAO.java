package com.kh.wassupSeoul.member.model.dao;

import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.wassupSeoul.hobby.model.vo.Hobby;
import com.kh.wassupSeoul.member.model.vo.Member;
import com.kh.wassupSeoul.member.model.vo.ProfileStreet;
import com.kh.wassupSeoul.street.model.vo.Keyword;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 회원가입용 DAO
	 * @param signUpMember
	 * @return result
	 * @throws Exception
	 */
	public int signUp(Member signUpMember) throws Exception {
		return sqlSession.insert("memberMapper.signUp", signUpMember);
	}

	/** 로그인용 DAO
	 * @param member
	 * @return Member
	 * @throws Exception
	 */
	public Member selectMember(Member member) throws Exception{
		return sqlSession.selectOne("memberMapper.loginMember", member);
	}


	/** 이메일 찾기용 DAO
	 * @param member
	 * @return memberEmail
	 * @throws Exception
	 */
	public String findEmail(Member member) throws Exception{
		return sqlSession.selectOne("memberMapper.findEmail", member);
	}
	
	/** 비밀번호 찾기용 DAO
	 * @param member
	 * @return memberPassword
	 * @throws Exception
	 */
	public String findPassword(Member member) throws Exception{
		return sqlSession.selectOne("memberMapper.findPassword", member);
	}

	

	/** 이메일 중복 검사용 DAO
	 * @param memberEmail
	 * @return result
	 * @throws Exception
	 */
	public int emailDupcheck(String memberEmail) throws Exception{
		return sqlSession.selectOne("memberMapper.emailDupcheck", memberEmail);
	}

	/** 닉네임 중복 검사용 DAO
	 * @param memberNickname
	 * @return result
	 * @throws Exception
	 */
	public int nickNameDupcheck(String memberNickname) throws Exception{
		return sqlSession.selectOne("memberMapper.nickNameDupcheck", memberNickname);
	}

	/**
	 * @param randomPsd
	 * @return randomPsd
	 * @throws Exception
	 */
	public int makeRandomPwd(Map <String,String> randomMap) throws Exception{
		return sqlSession.update("memberMapper.makeRandomPwd",randomMap);
	}
	
	/** 프로필 관심사 조회용 DAO
	 * @param memberNo
	 * @return myHobby
	 * @throws Exception
	 */
	public List<Hobby> selectHobby(int memberNo) throws Exception{
		return sqlSession.selectList("memberMapper.selectHobby", memberNo);
	}
	
	/** 내골목 조회용 DAO
	 * @param memberNo
	 * @return myStreet
	 * @throws Exception
	 */
	public List<ProfileStreet> selectProfileStreet(int memberNo) throws Exception{
		return sqlSession.selectList("memberMapper.selectProfileStreet", memberNo);
	}
	
	/** 내골목 골목대장 조회용 DAO
	 * @param streetNo
	 * @return streetMaster
	 * @throws Exception
	 */
	public String selectStreetMaster(int streetNo) throws Exception{
		return sqlSession.selectOne("memberMapper.selectStreetMaster", streetNo);
	}
	
	/** 내골목 키워드 조회용 DAO
	 * @param streetNo
	 * @return myKeyword
	 * @throws Exception
	 */
	public List<Keyword> selecyMyKeyword(int streetNo) throws Exception{
		return sqlSession.selectList("memberMapper.selectMyKeyword", streetNo);
	}
	
	/** 현재 비밀번호 조회용 DAO
	 * @param memberNo
	 * @return currentPwd
	 * @throws Exception
	 */
	public String selectMemberPwd(int memberNo) throws Exception{
		return sqlSession.selectOne("memberMapper.selectMemberPwd", memberNo);
	}
	
	/** 검색된 관심사 조회용 DAO
	 * @param searchHobbyContent
	 * @return hobbyList
	 * @throws Exception
	 */
	public List<Hobby> searchHobby(String searchHobbyContent) throws Exception{
		return sqlSession.selectList("memberMapper.searchHobby", searchHobbyContent);
	}
	
	/** 검색된 관심사 지정 회원수 조회용 DAO
	 * @param hobbyNm
	 * @return count
	 * @throws Exception
	 */
	public int selectHobbyCount(String hobbyName) throws Exception{
		return sqlSession.selectOne("memberMapper.selectHobbyCount", hobbyName);
	}
	
	/** 회원정보 수정용 DAO
	 * @param member
	 * @return result
	 * @throws Exception
	 */
	public int updateMember(Member member) throws Exception{
		return sqlSession.update("memberMapper.updateMember", member);
	}

	
	
	
	
	
	
	
	
	
	
	
} // DAO 종료
