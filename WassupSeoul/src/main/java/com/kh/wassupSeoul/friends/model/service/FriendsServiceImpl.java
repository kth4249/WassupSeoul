package com.kh.wassupSeoul.friends.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.wassupSeoul.friends.model.dao.FriendsDAO;
import com.kh.wassupSeoul.friends.model.vo.ChatList;
import com.kh.wassupSeoul.friends.model.vo.ChatRoom;
import com.kh.wassupSeoul.friends.model.vo.MSG;
import com.kh.wassupSeoul.friends.model.vo.Relationship;
import com.kh.wassupSeoul.member.model.vo.Member;
import com.kh.wassupSeoul.square.model.vo.Alarm;

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
		} else {
			return null;
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
			nMap.put("RoomNo", nextRoomNo1);
			//System.out.println(nMap.get("chatNo"));
			
			// 2.2) 방 개설 하기  (2행 추가)
			result = friendsDAO.insertChatRoom1(nMap);
			if (result > 0) {
				int nextRoomNo2 = friendsDAO.getChatRoom();
				nMap.put("RoomNo", nextRoomNo2);
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

	/** 친구목록에서 친구 삭제
	 * @param nMap
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int friendBye(Map<String, Object> nMap) throws Exception {
		
		int result = friendsDAO.friendsBye1(nMap);
		
		if (result > 0) {
			result = friendsDAO.friendsBye2(nMap);
		}
		
		
		return result;
	}

	/** 차단친구 목록 조회용
	 * @param myNo
	 * @return bList
	 * @throws Exception
	 */
	@Override
	public List<Object> blockFriendsList(int myNum) throws Exception {
		List<Relationship> bList = friendsDAO.blockFriendsList1(myNum);
		List<Integer> bbList = new ArrayList<Integer>();
		List<Object> bbbList = new ArrayList<Object>();
		//System.out.println("bList : " + bList );
		if (!bList.isEmpty()) {
			
			for (int i = 0 ; i<bList.size() ; i++) {
				bbList.add(bList.get(i).getYourNum());
			}
			//System.out.println("bbList : " + bbList ); // 여기까지 성공
			
			bbbList = friendsDAO.blockFriendsList2(bbList);
			//System.out.println("bbbList : " + bbbList);
		}  
		return bbbList;
	}

	/** 차단 해제용
	 * @param yourNick
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int noBlock(Map<String,Object> bMap) throws Exception {
		
		Member freeMan = friendsDAO.noBlock1(bMap);
		
		int freeNo = freeMan.getMemberNo();
		bMap.put("yourNo", freeNo);
		System.out.println(bMap.get("filepath2"));;
		int result = friendsDAO.noBlock2(bMap);
		
		return result;
	}

	
	
	/** 대화방 목록 확인용
	 * @param myNo
	 * @return cList
	 * @throws Exception
	 */
	@Override
	public List<ChatList> selectRoomList(int myNo) throws Exception {

		// 내꺼 방 번호 목록
		List <Integer> RoomNoList = friendsDAO.selectRoomNo(myNo);
		
		if (RoomNoList == null || RoomNoList.isEmpty()) { // 대화방 없으면 익셉션 떠서 수정(태훈)
			return null;
		}
		System.out.println("RoomNoList : "+ RoomNoList);
		
		// 방 번호에 따른 안읽은 메시지 수
		List <Integer> noReadMsgCount = friendsDAO.selectnoReadCount(RoomNoList);
		System.out.println("noReadMsgCount : " + noReadMsgCount);
		
		List <String> lastMessage = new ArrayList<String>();
		
		// 방 별로 마지막 메시지
		for (int i = 0 ; i < RoomNoList.size() ; i++) {
			String what = friendsDAO.lastMessage(RoomNoList.get(i));
			lastMessage.add(what);
		}
		System.out.println("lastSentence : " + lastMessage);
		
		// 상대방 정보 알아와라
		List <Member> mList = new ArrayList<Member>();
		Map <String, Object> mMap = new HashMap<String, Object>();
		mMap.put("myNo", myNo);
		mMap.put("RoomNoList", RoomNoList);
		mList = friendsDAO.selectChater(mMap);
		
		//System.out.println("mList 정보 가져온나!!!!!!!!!!" + mList);
		

		// 얘네 담을 리스트 객체 선언
		List <ChatList> cList = new ArrayList<ChatList>();
		
		for (int i = 0 ; i < RoomNoList.size() ; i++) {
			 
			
			ChatList chatlist = new ChatList();
			chatlist.setRoomNo(RoomNoList.get(i));
			if( noReadMsgCount != null){
				chatlist.setNoReadCount(noReadMsgCount.get(i));
			} else {
				chatlist.setNoReadCount(0);
			}
			if( lastMessage != null){
				chatlist.setLastMessage((lastMessage.get(i)));
			} else {
				chatlist.setLastMessage("");
			}
			chatlist.setMemberNickname(mList.get(i).getMemberNickname());
			chatlist.setMemberProfileUrl(mList.get(i).getMemberProfileUrl());
			chatlist.setOtherNo(mList.get(i).getMemberNo());
			
			cList.add(chatlist);
			
		}
		
		//System.out.println("cList : " + cList);
		return cList;
	}

	
	/** 대화방 진입
	 * @param roomNo
	 * @return msg
	 * @throws Exception
	 */
	@Override
	public List<MSG> inToRoom(int roomNo) throws Exception {
		
		List<MSG> msg = friendsDAO.inToRoom(roomNo);
		
		//System.out.println(msg);
		
		return msg;
	}
	
	

	/** 프로필 불러오기 1
	 * @param memberNo
	 * @return member
	 * @throws Exception
	 */
	@Override
	public Member selectMember(int memberNo) throws Exception {
		return friendsDAO.selectMember(memberNo);
	}
	
	/** 프로필 불러오기 2
	 * @param memberNo
	 * @return member
	 * @throws Exception
	 */
	@Override
	public Member selectMember(String memberNickname) throws Exception {
		return friendsDAO.selectMember(memberNickname);
	}
	// 아마 대화방에서 닫으면 status N 으로 바꾸는 동작도 해야할듯

	/*-----------------태훈 알람 관련 추가-------------------*/
	@Override
	public int insertAlarm(Alarm alarm) {
		return friendsDAO.insertAlarm(alarm);
	}
	/*-----------------태훈 알람 관련 추가-------------------*/

	/** 메세지 저장용 Service
	 * @param msg
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int saveMessage(MSG msg) throws Exception {
		return friendsDAO.saveMessage(msg);
	}
	

}
