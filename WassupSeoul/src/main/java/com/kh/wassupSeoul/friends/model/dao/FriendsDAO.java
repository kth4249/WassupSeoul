package com.kh.wassupSeoul.friends.model.dao;

import java.util.List;

import javax.management.relation.Relation;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.wassupSeoul.member.model.vo.Member;

@Repository
public class FriendsDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	
	/** 친구목록 조회용 DAO 1
	 * @param myNum
	 * @return fList
	 * @throws Exception
	 */
	public List<Relation> friendRequest(int myNum) throws Exception{
		return sqlSession.selectList("friendsMapper.friendsRequest", myNum);
	}


	/** 친구목록 조회용 DAO 2
	 * @param yourNo
	 * @return ffList
	 * @throws Exception
	 */

	public List<Member> justFriendReq(List<Relation> fList) throws Exception{
		return sqlSession.selectList("friendsMapper.justFriendsReq", fList);
	}

}
