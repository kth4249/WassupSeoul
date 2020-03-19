package com.kh.wassupSeoul.friends.model.vo;

public class Relationship {

	int myNum;
	int yourNum;
	char requestStatus;
	
	public Relationship() {
		// TODO Auto-generated constructor stub
	}

	public Relationship(int myNum, int yourNum, char requestStatus) {
		super();
		this.myNum = myNum;
		this.yourNum = yourNum;
		this.requestStatus = requestStatus;
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

	@Override
	public String toString() {
		return "Relationship [myNum=" + myNum + ", yourNum=" + yourNum + ", requestStatus=" + requestStatus + "]";
	}
	
	
	
}
