package com.kh.wassupSeoul.friends.model.vo;

public class ChatRoom {

	int chatNo;
	String chatStatus;
	int myNo;
	int yourNo;
	int roomNo;
	
	public ChatRoom() {}
	
	

	public ChatRoom(int chatNo, String chatStatus, int myNo, int yourNo, int roomNo) {
		super();
		this.chatNo = chatNo;
		this.chatStatus = chatStatus;
		this.myNo = myNo;
		this.yourNo = yourNo;
		this.roomNo = roomNo;
	}



	public int getChatNo() {
		return chatNo;
	}

	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}

	public String getChatStatus() {
		return chatStatus;
	}

	public void setChatStatus(String chatStatus) {
		this.chatStatus = chatStatus;
	}

	public int getMyNo() {
		return myNo;
	}

	public void setMyNo(int myNo) {
		this.myNo = myNo;
	}

	public int getYourNo() {
		return yourNo;
	}

	public void setYourNo(int yourNo) {
		this.yourNo = yourNo;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	@Override
	public String toString() {
		return "ChatRoom [chatNo=" + chatNo + ", chatStatus=" + chatStatus + ", myNo=" + myNo + ", yourNo=" + yourNo
				+ ", roomNo=" + roomNo + "]";
	}

	
	
	
	
	
}
