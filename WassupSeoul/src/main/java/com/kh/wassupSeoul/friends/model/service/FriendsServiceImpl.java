package com.kh.wassupSeoul.friends.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.wassupSeoul.friends.model.dao.FriendsDAO;
import com.kh.wassupSeoul.friends.model.vo.ChatRoom;
import com.kh.wassupSeoul.friends.model.vo.Relationship;
import com.kh.wassupSeoul.member.model.vo.Member;

/**
 * @author for
 *
 */
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
		List<Relationship> fList = friendsDAO.friendsList(myNum);
		List<Integer> ffList = new ArrayList<Integer>();
		List<Member> fffList = new ArrayList<Member>();
		
		if (!fList.isEmpty()) {

			for (int i = 0 ; i<fList.size() ; i++) {
				ffList.add(fList.get(i).getYourNum());
			}
			
			Map<String, Object> fMap = new HashMap<String, Object>();
			fMap.put("ffList", ffList);
			fMap.put("myNum", myNum); 
			fffList = friendsDAO.justFriendsList(fMap);
		}
		
	      return fffList;
	}

	/** 친구목록에서의 친구 차단 Service
	 * @param nMap
	 * @return result
	 * @throws Exception
	 */
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int blockFriendsInList(Map<String, Object> nMap) throws Exception {
		
		// 내가 상대방 차단하는 과정
		int result = friendsDAO.blockFriendInList(nMap);
		
		if (result>0) {
			result = 0;
			// 상대방의 친구목록에서 날 지우는 과정
			result = friendsDAO.blockFriendInList2(nMap);
		}
		
		return result;
	}

	/** 친구 목록에서 대화방 진입하는 Service
	 * @param nMap
	 * @return result
	 * @throws Exception
	 */
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int friendTalk(Map<String, Object> nMap) throws Exception {

		int result = 0;
		
		// 1) 대화방 존재 확인 (select)
		ChatRoom chatRoom = friendsDAO.selectChatRoom(nMap);
		//System.out.println(chatRoom);
		
		
		// 2) 없다면 개설하기 
		if (chatRoom == null) {
			//System.out.println("방 없음");
			// 2.1) 방 번호 얻기
			int nextRoomNo1 = friendsDAO.getChatRoom();
			//System.out.println("nextRoomNo1 :" + nextRoomNo1);
			nMap.put("chatNo", nextRoomNo1);
			//System.out.println(nMap.get("chatNo"));
			
			// 2.2) 방 개설 하기  (2행 추가)
			result = friendsDAO.insertChatRoom1(nMap);
			if (result > 0) {
				int nextRoomNo2 = friendsDAO.getChatRoom();
				nMap.put("chatNo", nextRoomNo2);
				result = friendsDAO.insertChatRoom2(nMap);
				//System.out.println("2개의 방 생성 완료");
			} else {
				return result;
			}
			
		// 3) 있다면 status (update)
		} else {
			//System.out.println("방 있음");
			result = friendsDAO.updateChatRoom1(nMap);
			if (result > 0) {
				result = friendsDAO.updateChatRoom2(nMap);
				//System.out.println("2개의 방 존재 확인 완료");
			} else {
				return result;
			}
			
		}
		
		return result;
	}

	
	// 아마 대화방에서 닫으면 status N 으로 바꾸는 동작도 해야할듯
	
	

	
	
	

}
