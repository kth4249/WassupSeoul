package com.kh.wassupSeoul.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.wassupSeoul.member.model.vo.Member;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Member> selectMemberList() throws Exception {
		
		return sqlSession.selectList("adminMapper.selectMemberList");
	}

}
