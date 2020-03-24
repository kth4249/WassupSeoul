package com.kh.wassupSeoul.friends.model.service;

import java.util.List;
import java.util.Map;

import com.kh.wassupSeoul.member.model.vo.Member;

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


}
