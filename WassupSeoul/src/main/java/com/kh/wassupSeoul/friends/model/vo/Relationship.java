package com.kh.wassupSeoul.friends.model.vo;

public class Relationship {

	int myNum;
	int yourNum;
	char requestStatus;
	int memberNo;
	String memberNickname;
	String memberProfileUrl;
	
	
	
	public Relationship() {
		// TODO Auto-generated constructor stub
	}
	
	
	



	public Relationship(int myNum, int yourNum, char requestStatus) {
		super();
		this.myNum = myNum;
		this.yourNum = yourNum;
		this.requestStatus = requestStatus;
	}






	public Relationship(int myNum, int yourNum, char requestStatus, int memberNo, String memberNickname,
			String memberProfileUrl) {
		super();
		this.myNum = myNum;
		this.yourNum = yourNum;
		this.requestStatus = requestStatus;
		this.memberNo = memberNo;
		this.memberNickname = memberNickname;
		this.memberProfileUrl = memberProfileUrl;
	}



	public int getMyNum() {
		return myNum;
	}



	public void setMyNum(int myNum) {
		this.myNum = myNum;
	}



	public int getYourNum() {
		return yourNum;
	}



	public void setYourNum(int yourNum) {
		this.yourNum = yourNum;
	}



	public char getRequestStatus() {
		return requestStatus;
	}



	public void setRequestStatus(char requestStatus) {
		this.requestStatus = requestStatus;
	}



	public int getMemberNo() {
		return memberNo;
	}



	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
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
		return "Relationship [myNum=" + myNum + ", yourNum=" + yourNum + ", requestStatus=" + requestStatus
				+ ", memberNo=" + memberNo + ", memberNickname=" + memberNickname + ", memberProfileUrl="
				+ memberProfileUrl + "]";
	}

	
	
}
