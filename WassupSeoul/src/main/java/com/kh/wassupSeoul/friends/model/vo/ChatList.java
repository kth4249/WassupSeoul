package com.kh.wassupSeoul.friends.model.vo;

public class ChatList {
	
	int roomNo;
	int noReadCount;
	String lastMessage;

	public ChatList() {
		// TODO Auto-generated constructor stub
	}

	public ChatList(int roomNo, int noReadCount, String lastMessage) {
		super();
		this.roomNo = roomNo;
		this.noReadCount = noReadCount;
		this.lastMessage = lastMessage;
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

	@Override
	public String toString() {
		return "ChatList [roomNo=" + roomNo + ", noReadCount=" + noReadCount + ", lastMessage=" + lastMessage + "]";
	}
	
	
	
}
