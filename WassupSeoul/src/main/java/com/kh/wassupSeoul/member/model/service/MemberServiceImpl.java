package com.kh.wassupSeoul.member.model.service;

<<<<<<< HEAD
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.wassupSeoul.member.model.dao.MemberDAO;
import com.kh.wassupSeoul.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired 
	private MemberDAO memberDAO;

	// 암호화를 위한 객체를 DI(의존성 주입)
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	
	/** 회원가입용 Service
	 * @param signUpMember
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int signUp(Member signUpMember) throws Exception {
		String encPwd = bcryptPasswordEncoder.encode(signUpMember.getMemberPwd());
		signUpMember.setMemberPwd(encPwd);
		int result = memberDAO.signUp(signUpMember);
		return result;
	}
	
	
	/** 로그인용 Service
	 * @param member
	 * @return Member
	 * @throws Exception
	 */
	@Override
	public Member loginMember(Member member) throws Exception {
		
		Member loginMember = memberDAO.selectMember(member);
		
		if (loginMember != null) { 
			if(!bcryptPasswordEncoder.matches(member.getMemberPwd(), loginMember.getMemberPwd())) {
				loginMember = null;
			}
		}
		return loginMember;
	}
	

	/** 이메일 찾기용 Service
	 * @param member
	 * @return memberEmail
	 * @throws Exception
	 */
	@Override
	public String findEmail(Member member) throws Exception {
		return memberDAO.findEmail(member);

	}


	/** 이메일 중복 체크
	 * @param memberEmail
	 * @return result
	 * @throws Exception
	 */
	@Override
	public int emailDupCheck(String memberEmail) throws Exception {
		return memberDAO.emailDupcheck(memberEmail);
	}


	/** 닉네임 중복 체크
	 * @param memberNickname
	 * @return result
	 * @throws Exception
	 */
	@Override
	public int nickNameDupCheck(String memberNickname) throws Exception {
		return memberDAO.nickNameDupcheck(memberNickname);
	}
	
	
	
=======
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.wassupSeoul.member.model.dao.MemberDAO;
import com.kh.wassupSeoul.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired 
	private MemberDAO memberDAO;

	// 암호화를 위한 객체를 DI(의존성 주입)
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	
	/** 회원가입용 Service
	 * @param signUpMember
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int signUp(Member signUpMember) throws Exception {
		String encPwd = bcryptPasswordEncoder.encode(signUpMember.getMemberPwd());
		signUpMember.setMemberPwd(encPwd);
		return memberDAO.signUp(signUpMember);
	}
	
	
	/** 로그인용 Service
	 * @param member
	 * @return Member
	 * @throws Exception
	 */
	@Override
	public Member loginMember(Member member) throws Exception {
		
		Member loginMember = memberDAO.selectMember(member);
		
		if (loginMember != null) { 
			if(!bcryptPasswordEncoder.matches(member.getMemberPwd(), loginMember.getMemberPwd())) {
				loginMember = null;
			}
		}
		return loginMember;
	}
	

	/** 이메일 찾기용 Service
	 * @param member
	 * @return memberEmail
	 * @throws Exception
	 */
	@Override
	public String findEmail(Member member) throws Exception {
		return memberDAO.findEmail(member);

	}


	/** 비밀번호 찾기용 Service
	 * @param member
	 * @return memberPassword
	 * @throws Exception
	 */
	@Override
	public String findPassword(Member member) throws Exception {
		return memberDAO.findPassword(member);
	}
	
	


	/** 이메일 중복 체크
	 * @param memberEmail
	 * @return result
	 * @throws Exception
	 */
	@Override
	public int emailDupCheck(String memberEmail) throws Exception {
		return memberDAO.emailDupcheck(memberEmail);
	}


	/** 닉네임 중복 체크
	 * @param memberNickname
	 * @return result
	 * @throws Exception
	 */
	@Override
	public int nickNameDupCheck(String memberNickname) throws Exception {
		return memberDAO.nickNameDupcheck(memberNickname);
	}


	/** 랜덤 비밀번호 발생 Service
	 * @param buf
	 * @return result
	 * @throws Exception
	 */
	@Override
	public int makeRandomPwd(Map <String,String> randomMap) throws Exception {
		String meme = randomMap.get("randomPwd");
		String newPwd = bcryptPasswordEncoder.encode(meme);
		randomMap.put("newPwd", newPwd);
		return memberDAO.makeRandomPwd(randomMap);
	}




>>>>>>> branch 'master' of https://github.com/kth4249/WassupSeoul.git
	
	
	
	
	
	
	
	
} // ServiceImpl 종료
