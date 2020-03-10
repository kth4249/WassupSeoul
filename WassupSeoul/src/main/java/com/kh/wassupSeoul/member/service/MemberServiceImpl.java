package com.kh.wassupSeoul.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.wassupSeoul.member.dao.MemberDAO;
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
	
	
	
	
	
	
	
}
