package com.kh.wassupSeoul.friends.model.vo;

public class NoReadCount {

	int count;
	int roomNo;
	
	public NoReadCount() {
		// TODO Auto-generated constructor stub
	}

	public NoReadCount(int count, int roomNo) {
		super();
		this.count = count;
		this.roomNo = roomNo;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	@Override
	public String toString() {
		return "NoReadCount [count=" + count + ", roomNo=" + roomNo + "]";
	}
	
	
	
}
