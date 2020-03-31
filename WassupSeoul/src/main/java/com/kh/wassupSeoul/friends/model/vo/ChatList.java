package com.kh.wassupSeoul.friends.model.vo;

public class ChatList {
	
	int roomNo;
	int noReadCount;
	String lastMessage;
	String memberNickname;
	String memberProfileUrl;
	int otherNo;
	
	public ChatList() {
		// TODO Auto-generated constructor stub
	}

	public ChatList(int roomNo, int noReadCount, String lastMessage, String memberNickname, String memberProfileUrl,
			int otherNo) {
		super();
		this.roomNo = roomNo;
		this.noReadCount = noReadCount;
		this.lastMessage = lastMessage;
		this.memberNickname = memberNickname;
		this.memberProfileUrl = memberProfileUrl;
		this.otherNo = otherNo;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public int getNoReadCount() {
		return noReadCount;
	}

	public void setNoReadCount(int noReadCount) {
		this.noReadCount = noReadCount;
	}

	public String getLastMessage() {
		return lastMessage;
	}

	public void setLastMessage(String lastMessage) {
		this.lastMessage = lastMessage;
	}

	public String getMemberNickname() {
		return memberNickname;
	}

	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}

	public String getMemberProfileUrl() {
		return memberProfileUrl;
	}

	public void setMemberProfileUrl(String memberProfileUrl) {
		this.memberProfileUrl = memberProfileUrl;
	}

	public int getOtherNo() {
		return otherNo;
	}

	public void setOtherNo(int otherNo) {
		this.otherNo = otherNo;
	}

	@Override
	public String toString() {
		return "ChatList [roomNo=" + roomNo + ", noReadCount=" + noReadCount + ", lastMessage=" + lastMessage
				+ ", memberNickname=" + memberNickname + ", memberProfileUrl=" + memberProfileUrl + ", otherNo="
				+ otherNo + "]";
	}
	
	
	
	
	
}
