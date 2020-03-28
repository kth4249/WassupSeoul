package com.kh.wassupSeoul.friends.model.vo;

import java.sql.Date;

public class MSG {

	int msgNo;
	String msgContent;
	String msgStatus;
	int memberNo;
	int roomNo;
	
	public MSG() {
		// TODO Auto-generated constructor stub
	}

	public MSG(int msgNo, String msgContent, String msgStatus, int memberNo, int roomNo) {
		super();
		this.msgNo = msgNo;
		this.msgContent = msgContent;
		this.msgStatus = msgStatus;
		this.memberNo = memberNo;
		this.roomNo = roomNo;
	}

	public int getMsgNo() {
		return msgNo;
	}

	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
	}

	public String getMsgContent() {
		return msgContent;
	}

	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}

	public String getMsgStatus() {
		return msgStatus;
	}

	public void setMsgStatus(String msgStatus) {
		this.msgStatus = msgStatus;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	@Override
	public String toString() {
		return "MSG [msgNo=" + msgNo + ", msgContent=" + msgContent + ", msgStatus=" + msgStatus 
				+ ", memberNo=" + memberNo + ", roomNo=" + roomNo + "]";
	}
	
	
	
}
