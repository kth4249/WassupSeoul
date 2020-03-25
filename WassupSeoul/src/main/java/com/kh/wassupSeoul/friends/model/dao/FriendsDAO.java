package com.kh.wassupSeoul.friends.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.wassupSeoul.friends.model.vo.ChatRoom;
import com.kh.wassupSeoul.friends.model.vo.Relationship;
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
	public List<Relationship> friendRequest(int myNum) throws Exception{
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


	/** 친구 목록 조회용 DAO 1
	 * @param myNum
	 * @return fList
	 * @throws Exception
	 */
	public List<Relationship> friendsList(int myNum) throws Exception{
		return sqlSession.selectList("friendsMapper.friendsList", myNum);
	}


	/** 친구 목록 조회용 DAO 2
	 * @param fMap
	 * @return ffList
	 * @throws Exception
	 */
	public List<Member> justFriendsList(Map<String, Object> fMap) throws Exception {
		return sqlSession.selectList("friendsMapper.justFriendsList", fMap);
	}


	/** 친구목록에서의 친구차단
	 * @param nMap
	 * @return result
	 * @throws Exception
	 */
	public int blockFriendInList(Map<String, Object> nMap) throws Exception{
		return sqlSession.update("friendsMapper.blockFriendInList", nMap);
	}


	/** 차단당해서 친구 목록 삭제
	 * @param nMap
	 * @return result
	 * @throws Exception
	 */
	public int blockFriendInList2(Map<String, Object> nMap) throws Exception{
		return sqlSession.delete("friendsMapper.blockFriendInList2", nMap);
	}


	/** 대화방 존재 확인 DAO
	 * @param nMap
	 * @return chatRoom
	 * @throws Exception
	 */
	public ChatRoom selectChatRoom(Map<String, Object> nMap) throws Exception{
		return sqlSession.selectOne("friendsMapper.selectChatRoom", nMap);
	}


	/** 대화방 번호 얻기
	 * @return nextRoomNo
	 * @throws Exception
	 */
	public int getChatRoom() throws Exception{
		return sqlSession.selectOne("friendsMapper.getChatRoom");
	}
	
	
	
	/** 대화방 신설 1
	 * @param nMap
	 * @return result
	 * @throws Exception
	 */
	public int insertChatRoom1(Map<String, Object> nMap) throws Exception {
		return sqlSession.insert("friendsMapper.insertChatRoom1", nMap);
	}
	
	/** 대화방 신설2
	 * @param nMap
	 * @return result
	 * @throws Exception
	 */
	public int insertChatRoom2(Map<String, Object> nMap) throws Exception {
		return sqlSession.insert("friendsMapper.insertChatRoom2", nMap);
	}


	/** 대화방 열기 1
	 * @param nMap
	 * @return result
	 * @throws Exception
	 */
	public int updateChatRoom1(Map<String, Object> nMap) throws Exception{
		return sqlSession.update("friendsMapper.updateChatRoom1", nMap);
	}


	/** 대화방 열기 2
	 * @param nMap
	 * @return result
	 * @throws Exception
	 */
	public int updateChatRoom2(Map<String, Object> nMap) throws Exception {
		return sqlSession.update("friendsMapper.updateChatRoom2", nMap);
	}


	/** 친구 목록에서 친구 삭제 1
	 * @param nMap
	 * @return result
	 * @throws Exception
	 */
	public int friendsBye1(Map<String, Object> nMap) throws Exception {
		return sqlSession.delete("friendsMapper.friendsBye1", nMap);
	}
	
	/** 친구 목록에서 친구 삭제 2
	 * @param nMap
	 * @return result
	 * @throws Exception
	 */
	public int friendsBye2(Map<String, Object> nMap) throws Exception {
		return sqlSession.delete("friendsMapper.friendsBye2", nMap);
	}


	




	

}
