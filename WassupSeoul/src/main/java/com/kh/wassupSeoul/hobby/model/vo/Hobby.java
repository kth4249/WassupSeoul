package com.kh.wassupSeoul.hobby.model.vo;

public class Hobby {
	
	private int hobbyNo;
	private String hobbyName;
	private int memberNo;
	private int hobbyCount;

	public Hobby() {
		// TODO Auto-generated constructor stub
	}
	
	

	public Hobby(int hobbyNo, String hobbyName) {
		super();
		this.hobbyNo = hobbyNo;
		this.hobbyName = hobbyName;
	}
	

	public Hobby(int hobbyNo, String hobbyName, int memberNo) {
		super();
		this.hobbyNo = hobbyNo;
		this.hobbyName = hobbyName;
		this.memberNo = memberNo;
	}
	
	

	public Hobby(int hobbyNo, String hobbyName, int memberNo, int hobbyCount) {
		super();
		this.hobbyNo = hobbyNo;
		this.hobbyName = hobbyName;
		this.memberNo = memberNo;
		this.hobbyCount = hobbyCount;
	}



	public int getHobbyNo() {
		return hobbyNo;
	}

	public void setHobbyNo(int hobbyNo) {
		this.hobbyNo = hobbyNo;
	}

	public String getHobbyName() {
		return hobbyName;
	}

	public void setHobbyName(String hobbyName) {
		this.hobbyName = hobbyName;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}



	public int getHobbyCount() {
		return hobbyCount;
	}



	public void setHobbyCount(int hobbyCount) {
		this.hobbyCount = hobbyCount;
	}



	@Override
	public String toString() {
		return "Hobby [hobbyNo=" + hobbyNo + ", hobbyName=" + hobbyName + ", memberNo=" + memberNo + ", hobbyCount="
				+ hobbyCount + "]";
	}

	
	
	
}
