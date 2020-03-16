package com.kh.wassupSeoul.member.model.service;

import java.util.Map;


import com.kh.wassupSeoul.member.model.vo.Member;

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


	

	
	
	
} // Service 종료