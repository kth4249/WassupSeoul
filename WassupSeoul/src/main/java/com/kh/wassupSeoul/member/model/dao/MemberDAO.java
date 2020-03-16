package com.kh.wassupSeoul.member.model.dao;

import org.springframework.stereotype.Repository;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import com.kh.wassupSeoul.member.model.vo.Member;

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


	/** 이메일 찾기용 DAO (미현아 이거 빼먹지말고 써줘, 알겠지? 응 나도 사랑해)
	 * @param member
	 * @return memberEmail
	 * @throws Exception
	 */
	public String findEmail(Member member) throws Exception{
		return sqlSession.selectOne("memberMapper.findEmail", member);
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

	
	
	
	
	
	
	
	
	
	
} // DAO 종료
