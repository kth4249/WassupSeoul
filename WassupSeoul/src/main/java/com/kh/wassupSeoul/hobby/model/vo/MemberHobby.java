package com.kh.wassupSeoul.hobby.model.vo;

public class MemberHobby {
	int memberNo;
	int hobbyNo;
	
	public MemberHobby() {
		// TODO Auto-generated constructor stub
	}
	
	public MemberHobby(int memberNo, int hobbyNo) {
		super();
		this.memberNo = memberNo;
		this.hobbyNo = hobbyNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getHobbyNo() {
		return hobbyNo;
	}

	public void setHobbyNo(int hobbyNo) {
		this.hobbyNo = hobbyNo;
	}

	@Override
	public String toString() {
		return "MemberHobby [memberNo=" + memberNo + ", hobbyNo=" + hobbyNo + "]";
	}
	
	
	

}
