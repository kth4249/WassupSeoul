package com.kh.wassupSeoul.friends.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.wassupSeoul.friends.model.dao.FriendsDAO;
import com.kh.wassupSeoul.friends.model.vo.Relationship;
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
	      List<Relationship> fList = friendsDAO.friendRequest(myNum);
	      List<Member> ffList = null;
	      if (!fList.isEmpty()) {
	    	 Map<String, Object> fMap = new HashMap<String, Object>();
	    	 fMap.put("fList", fList);
	    	 fMap.put("myNum", myNum); 
	    	 //System.out.println(fList); 
	         ffList = friendsDAO.justFriendReq(fMap);
	         //System.out.println(ffList);
	      }
	      return ffList;
	   }

	/** 친구 요청 수락 Service
	 * @param memberNo
	 * @return result
	 * @throws Exception
	 */
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int addFriend(Map<String, Object> nMap) throws Exception {
		int result = friendsDAO.addFriend(nMap);
		//System.out.println("result1 :" + result);
		if (result>0) {
			result = friendsDAO.addFriend2(nMap);
			//System.out.println("result2 :" + result);
		} 
		
		return result;
	}

	/** 친구 요청 거절 Service
	 * @param nMap
	 * @return result
	 * @throws Exception
	 */
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int friendNo(Map<String, Object> nMap) throws Exception {
		return friendsDAO.friendNo(nMap);
	}

	/** 친구 차단 Service
	 * @param nMap
	 * @return result
	 * @throws Exception
	 */
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int blockFriend(Map<String, Object> nMap) throws Exception {
		return friendsDAO.blockFriend(nMap);
	}

	/** 친구 목록 조회용 Service
	 * @param myNum
	 * @return fList
	 * @throws Exception
	 */
	@Override
	public List<Member> friendsList(int myNum) throws Exception {
		System.out.println("임플 상륙");
		List<Relationship> fList = friendsDAO.friendsList(myNum);
		List<Integer> ffList = new ArrayList<Integer>();
		List<Member> fffList = new ArrayList<Member>();
		
		if (!fList.isEmpty()) {

			for (int i = 0 ; i<fList.size() ; i++) {
				ffList.add(fList.get(i).getYourNum());
			}
			System.out.println("ffList 확인 : " + ffList); 
			
			Map<String, Object> fMap = new HashMap<String, Object>();
			fMap.put("ffList", ffList);
			fMap.put("myNum", myNum); 
			fffList = friendsDAO.justFriendsList(fMap);
			System.out.println(fffList);
		}
		
	      return fffList;
	}


	
	
	

}
