package com.kh.wassupSeoul.friends.model.vo;

import java.sql.Date;

public class MSG {

	private int msgNo;
	private String msgContent;
	private String msgStatus;
	private Date msgTime;
	private int memberNo;
	private int roomNo;
	private String memberNickname;
	private String memberProfileUrl;
	
	public MSG() {
		// TODO Auto-generated constructor stub
	}

	public MSG(int msgNo, String msgContent, String msgStatus, Date msgTime, int memberNo, int roomNo,
			String memberNickname, String memberProfileUrl) {
		super();
		this.msgNo = msgNo;
		this.msgContent = msgContent;
		this.msgStatus = msgStatus;
		this.msgTime = msgTime;
		this.memberNo = memberNo;
		this.roomNo = roomNo;
		this.memberNickname = memberNickname;
		this.memberProfileUrl = memberProfileUrl;
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

	public Date getMsgTime() {
		return msgTime;
	}

	public void setMsgTime(Date msgTime) {
		this.msgTime = msgTime;
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

	@Override
	public String toString() {
		return "MSG [msgNo=" + msgNo + ", msgContent=" + msgContent + ", msgStatus=" + msgStatus + ", msgTime="
				+ msgTime + ", memberNo=" + memberNo + ", roomNo=" + roomNo + ", memberNickname=" + memberNickname
				+ ", memberProfileUrl=" + memberProfileUrl + "]";
	}

	
	
	
	
}
