package com.kh.wassupSeoul.friends.model.service;

import java.util.List;

import com.kh.wassupSeoul.member.model.vo.Member;

public interface FriendsService {

	/** 친구요청 조회용1 Service
	 * @param myNum
	 * @return fList
	 * @throws Exception
	 */
	List<Member> friendRequest(int myNum) throws Exception;


}
