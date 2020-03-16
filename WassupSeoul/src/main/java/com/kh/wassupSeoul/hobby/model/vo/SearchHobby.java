package com.kh.wassupSeoul.hobby.model.vo;

public class SearchHobby {
	private int hobbyNo;
	private String hobbyNm;
	private int hobbyCount;
	
	public SearchHobby() {
		// TODO Auto-generated constructor stub
	}

	public SearchHobby(int hobbyNo, String hobbyNm, int hobbyCount) {
		super();
		this.hobbyNo = hobbyNo;
		this.hobbyNm = hobbyNm;
		this.hobbyCount = hobbyCount;
	}

	public int getHobbyNo() {
		return hobbyNo;
	}

	public void setHobbyNo(int hobbyNo) {
		this.hobbyNo = hobbyNo;
	}

	public String getHobbyNm() {
		return hobbyNm;
	}

	public void setHobbyNm(String hobbyNm) {
		this.hobbyNm = hobbyNm;
	}

	public int getHobbyCount() {
		return hobbyCount;
	}

	public void setHobbyCount(int hobbyCount) {
		this.hobbyCount = hobbyCount;
	}

	@Override
	public String toString() {
		return "SearchHobbys [hobbyNo=" + hobbyNo + ", hobbyNm=" + hobbyNm + ", hobbyCount=" + hobbyCount + "]";
	}
	
	
}
