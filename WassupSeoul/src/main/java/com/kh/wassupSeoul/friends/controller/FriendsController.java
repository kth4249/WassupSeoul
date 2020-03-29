package com.kh.wassupSeoul.friends.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.kh.wassupSeoul.friends.model.service.FriendsService;
import com.kh.wassupSeoul.friends.model.vo.ChatList;
import com.kh.wassupSeoul.friends.model.vo.MSG;
import com.kh.wassupSeoul.member.model.vo.Member;
import com.kh.wassupSeoul.square.model.vo.Alarm;

@SessionAttributes({"loginMember","msg"})
@RequestMapping("/friends/*")
@Controller
public class FriendsController {

	@Autowired
	private FriendsService friendsService;
	
	// 친구요청 목록 조회용 Controller
	@ResponseBody
	@RequestMapping(value = "friendRequest", method = RequestMethod.POST,
			produces = "application/json; charset=utf-8")
	public String friendRequest(Model model, HttpServletResponse response) {
		int myNum = ((Member)model.getAttribute("loginMember")).getMemberNo();
		try {
			List<Member> fList = friendsService.friendRequest(myNum);
			return new Gson().toJson(fList);
		} catch (Exception e){
			e.printStackTrace();
		}
		return null;
	}// 목록 조회 끝
	
	
	// 친구 추가 Controller
	@ResponseBody
	@RequestMapping(value = "addFriend", method = RequestMethod.POST)
	public String friendGo(Model model, int yourNo) {
		int myNo = ((Member)model.getAttribute("loginMember")).getMemberNo();
		 
		try {
			Map<String, Object> nMap = new HashMap<String, Object>();
			nMap.put("myNo", myNo);
			nMap.put("yourNo", yourNo);
			
			int result = friendsService.addFriend(nMap);
			
			if (result>0) {
				//System.out.println("친구추가 성공");
				/*-----------------태훈 알람 관련 추가-------------------*/
				Alarm alarm = new Alarm("친구 요청을 승낙하였습니다!", '4', "메신저창 오픈", myNo+"", yourNo);
				friendsService.insertAlarm(alarm);
				/*-----------------태훈 알람 관련 추가-------------------*/
			} else {
				//System.out.println("친구등록 실패");
			}
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	} // 친구 추가 끝 
	
	
	// 친구 거절 Controller
	@ResponseBody
	@RequestMapping(value = "rejectFriend", method = RequestMethod.POST)
	public String friendNo(Model model, int yourNo) {
		int myNo = ((Member)model.getAttribute("loginMember")).getMemberNo();
		 
		try {
			Map<String, Object> nMap = new HashMap<String, Object>();
			nMap.put("myNo", myNo);
			nMap.put("yourNo", yourNo);
			
			int result = friendsService.friendNo(nMap);
			
			if (result>0) {
				//System.out.println("친구거절 성공");
			} else {
				//System.out.println("친구거절 실패");
			}
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		
	} // 친구 거절 끝 
	 
	
	// 친구 차단 Controller
	@ResponseBody
	@RequestMapping(value="blockFriend", method = RequestMethod.POST)
	public String blockFriends(Model model, int yourNo) {
		int myNo = ((Member)model.getAttribute("loginMember")).getMemberNo();
		 //System.out.println("yourNo : " + yourNo);
		try {
			Map<String, Object> nMap = new HashMap<String, Object>();
			nMap.put("myNo", myNo);
			nMap.put("yourNo", yourNo);
			
			int result = friendsService.blockFriend(nMap);
			
			if (result>0) {
				//System.out.println("친구 차단 성공");
			} else {
				//System.out.println("친구 차단 실패");
			}
			return null;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		}
	
	
	
	// 친구 목록 조회 Controller
	@ResponseBody
	@RequestMapping(value="friendsList", method = RequestMethod.POST,
			produces = "application/json; charset=utf-8")
		public String friendList(Model model) {
		int myNum = ((Member)model.getAttribute("loginMember")).getMemberNo();
		try {
			List<Member> fList = friendsService.friendsList(myNum);
			return new Gson().toJson(fList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	} // 친구목록 조회 끝
	
	
	
	
	// 친구목록에서 대화방 개설하는 Controller
	@ResponseBody
	@RequestMapping(value="friendTalk", method = RequestMethod.POST)
	public String friendTalk(Model model, int yourNo) {
		int myNo = ((Member)model.getAttribute("loginMember")).getMemberNo();
		 //System.out.println("myNo : "+ myNo + " yourNo : " + yourNo);
		try {
			Map<String, Object> nMap = new HashMap<String, Object>();
			nMap.put("myNo", myNo);
			nMap.put("yourNo", yourNo);
			
			int result = friendsService.friendTalk(nMap);
			
			if (result>0) {
				//System.out.println("대화방 진입 성공");
			} else {
				//System.out.println("대화방 진입 실패");
			}
			return null;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		}
	
	
	// 친구 목록에서의 친구 제거 Controller
	@ResponseBody
	@RequestMapping(value="friendBye", method = RequestMethod.POST)
	public String friendBye(Model model, int yourNo) {
		int myNo = ((Member)model.getAttribute("loginMember")).getMemberNo();
		//System.out.println("myNo : "+ myNo + " yourNo : " + yourNo);

		try {
			Map<String, Object> nMap = new HashMap<String, Object>();
			nMap.put("myNo", myNo);
			nMap.put("yourNo", yourNo);
			
			int result = friendsService.friendBye(nMap);
			
			if (result>0) {
				//System.out.println("친구목록에서 제거 성공");
			} else {
				//System.out.println("친구목록에서 제거 실패");
			}
			return null;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		}
	
	
	// 친구 목록에서의 친구 차단 Controller
		@ResponseBody
		@RequestMapping(value="blockFriendInList", method = RequestMethod.POST)
		public String blockFriendsInList(Model model, int yourNo) {
			int myNo = ((Member)model.getAttribute("loginMember")).getMemberNo();
			try {
				Map<String, Object> nMap = new HashMap<String, Object>();
				nMap.put("myNo", myNo);
				nMap.put("yourNo", yourNo);
				
				int result = friendsService.blockFriendsInList(nMap);
				
				if (result>0) {
					//System.out.println("친구목록에서 차단 성공");
				} else {
					//System.out.println("친구목록에서 차단 실패");
				}
				return null;
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
			}
		
		
		
		// 친구차단 목록 조회용 Controller
		@ResponseBody
		@RequestMapping(value="blockFriendsList", method = RequestMethod.POST,
				produces = "application/json; charset=utf-8")
			public String blockFriendsList(Model model) {
			int myNo = ((Member)model.getAttribute("loginMember")).getMemberNo();
			//System.out.println("myNo" + myNo);
			try {
				List<Object> bList = friendsService.blockFriendsList(myNo);
				//System.out.println("컨트롤러 bList : " + bList);
				return new Gson().toJson(bList);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}// 목록 조회 끝
		
		
		
		// 친구 차단 해제 Controller
		@ResponseBody
		@RequestMapping(value="noBlock", method = RequestMethod.POST)
		public String noBlock(Model model, String yourNick) {
			int myNo = ((Member)model.getAttribute("loginMember")).getMemberNo();
			Map<String,Object> bMap = new HashMap<String, Object>();
			bMap.put("myNo",myNo);
			bMap.put("yourNick", yourNick);
			try {
				int result = friendsService.noBlock(bMap);
				
				if (result>0) {
					//System.out.println("친구차단에서 제거 성공");
				} else {
					//System.out.println("친구차단에서 제거 실패");
				}
				return null;
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
			}
		
		
		
		// 대화 목록 조회 Controller
		@ResponseBody
		@RequestMapping(value="friendtalk", method = RequestMethod.POST,
				produces = "application/json; charset=utf-8")
			public String friendtalk(Model model) {
			int myNo = ((Member)model.getAttribute("loginMember")).getMemberNo();
			try {
				List<ChatList> cList = friendsService.selectRoomList(myNo);
				return new Gson().toJson(cList);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		} // 대화목록 조회 끝
		
		
		
		// 대화방 들어가기 Controller
		@ResponseBody
		@RequestMapping(value="inToRoom", method = RequestMethod.POST,
				produces = "application/json; charset=utf-8")
		public String inToRoom(int roomNo) {
			
			try {
				List<MSG> mList = friendsService.inToRoom(roomNo);
				return new Gson().toJson(mList);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
			}
		
		
		// 대화방 나가기 Controller
		@ResponseBody
		@RequestMapping(value="outRoom", method = RequestMethod.POST)
		public String outRoom(Model model, String memberNickname) {
			return null;
			}
		
	
	
		// 프로필 가져오기 1
		@ResponseBody
		@RequestMapping(value="detect1", method = RequestMethod.POST,
				produces = "application/json; charset=utf-8")
			public String detect1(Model model, int yourNo) {
			try {
				Member member = friendsService.selectMember(yourNo);
				System.out.println(member);
				if (member.getMemberGender().equals("M")) {
					member.setMemberGender("남성");
				} else {
					member.setMemberGender("여성");
				}
				return new Gson().toJson(member);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		} // 프로필 가져오기 1 끝	
		
		// 프로필 가져오기 2
		@ResponseBody
		@RequestMapping(value="detect2", method = RequestMethod.POST,
				produces = "application/json; charset=utf-8")
			public String detect2(Model model, String yourNick) {
			try {
				Member member = friendsService.selectMember(yourNick);
				System.out.println(member);
				
				if (!member.getMemberGender().equals("M")) {
					member.setMemberGender("여성");
				} else {
					member.setMemberGender("남성");
				}
				
				
				return new Gson().toJson(member);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		} // 프로필 가져오기 2 끝	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
