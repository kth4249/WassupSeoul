package com.kh.wassupSeoul.street.model.vo;

public class StreetJoin {

	
	private int memberNo;
	private int streetNo;
	private String citizenGrade;
	private String citizenStatus;
	
	public StreetJoin() {
		// TODO Auto-generated constructor stub
	}

	public StreetJoin(int memberNo, int streetNo, String citizenGrade, String citizenStatus) {
		super();
		this.memberNo = memberNo;
		this.streetNo = streetNo;
		this.citizenGrade = citizenGrade;
		this.citizenStatus = citizenStatus;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getStreetNo() {
		return streetNo;
	}

	public void setStreetNo(int streetNo) {
		this.streetNo = streetNo;
	}

	public String getCitizenGrade() {
		return citizenGrade;
	}

	public void setCitizenGrade(String citizenGrade) {
		this.citizenGrade = citizenGrade;
	}

	public String getCitizenStatus() {
		return citizenStatus;
	}

	public void setCitizenStatus(String citizenStatus) {
		this.citizenStatus = citizenStatus;
	}

	@Override
	public String toString() {
		return "streetJoin [memberNo=" + memberNo + ", streetNo=" + streetNo + ", citizenGrade=" + citizenGrade
				+ ", citizenStatus=" + citizenStatus + "]";
	}
	
	
}
