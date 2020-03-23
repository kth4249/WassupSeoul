package com.kh.wassupSeoul.friends.model.dao;

import java.util.List;
import java.util.Map;

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

	public List<Member> justFriendReq(Map<String, Object> fMap) {
		return sqlSession.selectList("friendsMapper.justFriendsReq", fMap);
	}


	/** 친구 추가용 DAO
	 * @param memberNo
	 * @return result
	 * @throws Exception
	 */
	public int addFriend(Map<String, Object> nMap) throws Exception{
		return sqlSession.update("friendsMapper.addFriend", nMap);
	}


	/** 친구 추가용 DAO2
	 * @param nMap
	 * @return result
	 * @throws Exception
	 */
	public int addFriend2(Map<String, Object> nMap) throws Exception{
		return sqlSession.insert("friendsMapper.addFriend2", nMap);
	}


	/** 친구 거절용 DAO
	 * @param nMap
	 * @return result
	 * @throws Exception
	 */
	public int friendNo(Map<String, Object> nMap) throws Exception{
		return sqlSession.delete("friendsMapper.friendNo", nMap);
	}


	/** 친구 차단용 DAO
	 * @param nMap
	 * @return result
	 * @throws Exception
	 */
	public int blockFriend(Map<String, Object> nMap) throws Exception{
		return sqlSession.insert("friendsMapper.blockFriend", nMap); 
	}


	

}
