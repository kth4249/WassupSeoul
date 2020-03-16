package com.kh.wassupSeoul.member.model.service;

import java.util.List;
import java.util.Map;

import com.kh.wassupSeoul.hobby.model.vo.Hobby;
import com.kh.wassupSeoul.member.model.vo.Member;
import com.kh.wassupSeoul.member.model.vo.ProfileStreet;
import com.kh.wassupSeoul.street.model.vo.Keyword;

public interface MemberService {

	/** 회원가입용 Service
	 * @param signUpMember
	 * @return result
	 * @throws Exception
	 */
	int signUp(Member signUpMember) throws Exception;

	/** 로그인용 Service
	 * @param member
	 * @return Member
	 * @throws Exception
	 */
	Member loginMember(Member member) throws Exception;


	/** 이메일 찾기용 Service
	 * @param member
	 * @return memberEmail
	 * @throws Exception
	 */
	String findEmail(Member member) throws Exception;
	

	/** 비밀번호 찾기용 Service
	 * @param member
	 * @return memberPassword
	 * @throws Exception
	 */
	String findPassword(Member member) throws Exception;
	

	/** 이메일 중복 체크
	 * @param memberEmail
	 * @return result
	 * @throws Exception
	 */
	int emailDupCheck(String memberEmail) throws Exception;

	/** 닉네임 중복 체크
	 * @param memberNickname
	 * @return result
	 * @throws Exception
	 */
	int nickNameDupCheck(String memberNickname) throws Exception;

	/** 랜덤 비밀번호 발생 Service
	 * @param buf
	 * @return result
	 * @throws Exception
	 */
	int makeRandomPwd(Map <String,String> randomMap) throws Exception;
	
	/** 프로필 관심사 조회용 Service
	 * @param memberNo
	 * @return myHobby
	 * @throws Exception
	 */
	List<Hobby> selectHobby(int memberNo) throws Exception;
	
	/** 내골목 조회용 Service
	 * @param memberNo
	 * @return myStreet
	 * @throws Exception
	 */
	List<ProfileStreet> selectProfileStreet(int memberNo) throws Exception;
	
	/** 내골목 골목대장 조회용 Service
	 * @param streetNo
	 * @return streetMaster
	 * @throws Exception
	 */
	String selectStreetMaster(int streetNo) throws Exception;
	
	/** 내골목 키워드 조회용 Service
	 * @param i
	 * @return myKeyword
	 * @throws Exception
	 */
	List<Keyword> selectMyKeyword(int i) throws Exception;
	
	/** 현재 비밀번호 일치여부 조회용 Service
	 * @param beforePwd
	 * @return result
	 * @throws Exception
	 */
	int beforePwdCheck(String beforePwd, int memberNo) throws Exception;
	
	/** 검색된 관심사 조회용 Service
	 * @param searchHobbyContent
	 * @return hobbyList
	 * @throws Exception
	 */
	List<Hobby> searchHobby(String searchHobbyContent) throws Exception;
	
	/** 검색된 관심사 지정 회원수 조회용 Service
	 * @param hobbyNm
	 * @return count
	 * @throws Exception
	 */
	int selectHobbyCount(String hobbyName) throws Exception;
	
	/** 현재 비밀번호 조회용 Service
	 * @param memberNo
	 * @return memberPwd
	 * @throws Exception
	 */
	String selectMemberPwd(int memberNo) throws Exception;
	
	/** 회원 정보 수정용 Service
	 * @param member
	 * @param flag
	 * @return result
	 * @throws Exception
	 */
	int updateMember(Member member, int flag) throws Exception;
	
	

	

	
	
	
} // Service 종료