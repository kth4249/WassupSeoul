package com.kh.wassupSeoul.street.model.vo;

import java.sql.Timestamp;

public class Divide {

	private int memberNo;
	private String memberNickName;
	private String memberProfileUrl;
	private String memberStatus;
	private Timestamp divideDt;
	private int boardNo;
	private int dividePrice;
	
	public Divide() {
	}

	public Divide(int memberNo, String memberNickName, String memberProfileUrl, String memberStatus,
			Timestamp divideDt) {
		super();
		this.memberNo = memberNo;
		this.memberNickName = memberNickName;
		this.memberProfileUrl = memberProfileUrl;
		this.memberStatus = memberStatus;
		this.divideDt = divideDt;
	}
	

	public Divide(int memberNo, String memberNickName, String memberProfileUrl, String memberStatus, Timestamp divideDt,
			int boardNo, int dividePrice) {
		super();
		this.memberNo = memberNo;
		this.memberNickName = memberNickName;
		this.memberProfileUrl = memberProfileUrl;
		this.memberStatus = memberStatus;
		this.divideDt = divideDt;
		this.boardNo = boardNo;
		this.dividePrice = dividePrice;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberNickName() {
		return memberNickName;
	}

	public void setMemberNickName(String memberNickName) {
		this.memberNickName = memberNickName;
	}

	public String getMemberProfileUrl() {
		return memberProfileUrl;
	}

	public void setMemberProfileUrl(String memberProfileUrl) {
		this.memberProfileUrl = memberProfileUrl;
	}

	public String getMemberStatus() {
		return memberStatus;
	}

	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}

	public Timestamp getDivideDt() {
		return divideDt;
	}

	public void setDivideDt(Timestamp divideDt) {
		this.divideDt = divideDt;
	}
	
	

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getDividePrice() {
		return dividePrice;
	}

	public void setDividePrice(int dividePrice) {
		this.dividePrice = dividePrice;
	}

	@Override
	public String toString() {
		return "Divide [memberNo=" + memberNo + ", memberNickName=" + memberNickName + ", memberProfileUrl="
				+ memberProfileUrl + ", memberStatus=" + memberStatus + ", divideDt=" + divideDt + ", boardNo="
				+ boardNo + ", dividePrice=" + dividePrice + "]";
	}

	
}
