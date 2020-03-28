package com.kh.wassupSeoul.friends.model.service;

import java.util.List;
import java.util.Map;

import com.kh.wassupSeoul.friends.model.vo.ChatRoom;
import com.kh.wassupSeoul.member.model.vo.Member;
import com.kh.wassupSeoul.square.model.vo.Alarm;

public interface FriendsService {

	/** 친구요청 조회용1 Service
	 * @param myNum
	 * @return fList
	 * @throws Exception
	 */
	List<Member> friendRequest(int myNum) throws Exception;

	/** 친구 요청 수락 Service
	 * @param memberNo
	 * @return result
	 * @throws Exception
	 */
	int addFriend(Map<String, Object> nMap) throws Exception;

	/** 친구 요청 거절 Service
	 * @param nMap
	 * @return result
	 * @throws Exception
	 */
	int friendNo(Map<String, Object> nMap)throws Exception;

	/** 친구 차단 Service
	 * @param nMap
	 * @return result
	 * @throws Exception
	 */
	int blockFriend(Map<String, Object> nMap)throws Exception;

	/** 친구 목록 조회용 Service
	 * @param myNum
	 * @return fList
	 * @throws Exception
	 */
	List<Member> friendsList(int myNum) throws Exception;

	/** 친구목록에서의 친구 차단 Service
	 * @param nMap
	 * @return result
	 * @throws Exception
	 */
	int blockFriendsInList(Map<String, Object> nMap) throws Exception;

	/** 친구 목록에서 대화방 진입하는 Service
	 * @param nMap
	 * @return result
	 * @throws Exception
	 */
	int friendTalk(Map<String, Object> nMap) throws Exception;

	/** 친구목록에서 친구 삭제
	 * @param nMap
	 * @return result
	 * @throws Exception
	 */
	int friendBye(Map<String, Object> nMap) throws Exception;

	/** 차단친구 목록 조회용
	 * @param myNo
	 * @return bList
	 * @throws Exception
	 */
	List<Object> blockFriendsList(int myNo) throws Exception;

	/** 차단 해제용
	 * @param yourNick
	 * @return result
	 * @throws Exception
	 */
	int noBlock(Map<String,Object> bMap) throws Exception;

	/** 대화방 목록 확인용
	 * @param myNo
	 * @return cList
	 * @throws Exception
	 */
	List<ChatRoom> selectRoomList(int myNo) throws Exception;
	
	
	/*-----------------태훈 알람 관련 추가-------------------*/
	int insertAlarm(Alarm alarm);
	
	
}
