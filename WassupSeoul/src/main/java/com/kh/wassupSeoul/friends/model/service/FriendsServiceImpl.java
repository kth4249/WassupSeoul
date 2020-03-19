package com.kh.wassupSeoul.friends.model.service;

import java.util.List;

import javax.management.relation.Relation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wassupSeoul.friends.model.dao.FriendsDAO;
import com.kh.wassupSeoul.member.model.vo.Member;

@Service
public class FriendsServiceImpl implements FriendsService{
	
	@Autowired
	private FriendsDAO friendsDAO;

	
	/** 친구요청 조회용 Service
	 * @param myNum
	 * @return fList
	 * @throws Exception
	 */
	@Override
	public List<Member> friendRequest(int myNum) throws Exception {
		List<Relation> fList = friendsDAO.friendRequest(myNum);
		List<Member> ffList = friendsDAO.justFriendReq(fList);
		return ffList;
	}


	
	
	

}
