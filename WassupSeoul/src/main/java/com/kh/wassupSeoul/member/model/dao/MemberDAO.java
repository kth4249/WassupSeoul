package com.kh.wassupSeoul.member.model.dao;

import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.wassupSeoul.hobby.model.vo.Hobby;
import com.kh.wassupSeoul.hobby.model.vo.MemberHobby;
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

	/** 직접 작성한 관심사 중복 여부 조회용 DAO
	 * @param hobbyName
	 * @return
	 */
	public Hobby hobbyDupCheck(String hobbyName) {
		return sqlSession.selectOne("memberMapper.hobbyDupCheck", hobbyName);
	}

	/** 기존 관심사 제거용 DAO
	 * @return result1
	 * @throws Exception
	 */
	public int deleteMemberHobby(int memberNo) throws Exception{
		return sqlSession.delete("memberMapper.deleteMemberHobby",memberNo);
	}

	/** 변경된 관심사 추가용 DAO -> 덮어쓰기 필요
	 * @param myHobby
	 * @return result
	 * @throws Exception
	 */
	public int updateMemberHobby(MemberHobby memberHobby) throws Exception{
		return sqlSession.insert("memberMapper.updateMemberHobby",memberHobby);
	}
	
	/** 해당 관심사 번호 조회용 DAO
	 * @param hobbyName
	 * @return hobbyNo
	 * @throws Exception
	 */
	public int getInsertHobbyNo(String hobbyName) throws Exception{
		return sqlSession.selectOne("memberMapper.getInsertHobbyNo", hobbyName);
	}

	/** 관심사 추가용 DAO
	 * @param hobbyName
	 * @return addResult
	 * @throws Exception
	 */
	public int insertHobby(String hobbyName) throws Exception{
		return sqlSession.insert("memberMapper.insertHobby", hobbyName);
	}
	
	/** 생성된 회원번호 조회용 DAO
	 * @return memberNo
	 * @throws Exception
	 */
	public int selectMemberNo() throws Exception{
		return sqlSession.selectOne("memberMapper.selectMemberNo");
	}
	
/** 가입 골목수 조회용 DAO
	 * @param memberNo
	 * @return result
	 * @throws Exception
	 */
	public int selectJoinStreetList(int memberNo) throws Exception{
		return sqlSession.selectOne("memberMapper.selectJoinStreetList", memberNo);
	}

	/** 회원 가입 골목 목록 삭제용 DAO
	 * @param memberNo
	 * @return result
	 * @throws Exception
	 */
	public int deleteJoinStreetList(int memberNo) throws Exception{
		return sqlSession.delete("memberMapper.deleteJoinStreet", memberNo);
	}

	/** 회원 알람 목록수 조회용 DAO
	 * @param memberNo
	 * @return result
	 * @throws Exception
	 */
	public int selectAlarmList(int memberNo) throws Exception{
		return sqlSession.selectOne("memberMapper.selectAlarmList", memberNo);
	}

	/** 회원 알람 목록 삭제용 DAO
	 * @param memberNo
	 * @return result
	 * @throws Exception
	 */
	public int deleteAlarmList(int memberNo) throws Exception{
		return sqlSession.delete("memberMapper.deleteAlarmList", memberNo);
	}

	/** 회원 친구 목록수 조회용 DAO
	 * @param memberNo
	 * @return result
	 * @throws Exception
	 */
	public int selectFriendList(int memberNo) throws Exception{
		return sqlSession.selectOne("memberMapper.selectFriendList", memberNo);
	}

	/** 회원 친구 목록 삭제용 DAO
	 * @param memberNo
	 * @return result
	 * @throws Exception
	 */
	public int deleteFriendList(int memberNo) throws Exception{
		return sqlSession.delete("memberMapper.deleteFriendList", memberNo);
	}

	/** 회원 탈퇴용 DAO
	 * @param memberNo
	 * @return result
	 * @throws Exception
	 */
	public int deleteMember(int memberNo) throws Exception{
		return sqlSession.delete("memberMapper.deleteMember",memberNo);
	}

	
	
	
	
	
	
	
	
	
	
	
} // DAO 종료
