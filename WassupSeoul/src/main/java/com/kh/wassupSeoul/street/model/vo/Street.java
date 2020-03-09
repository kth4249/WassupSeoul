package com.kh.wassupSeoul.street.model.vo;

public class Street {
	private int streetNo;
	private String streetNm;
	private String streetIntro;
	private char streetStatus;
	private int streetMaxMember;
	private int streetPoint;
	private int imgNo;
	private int districtNo;
	
	public Street() {
		// TODO Auto-generated constructor stub
	}

	public Street(int streetNo, String streetNm, String streetIntro, char streetStatus, int streetMaxMember,
			int streetPoint, int imgNo, int districtNo) {
		super();
		this.streetNo = streetNo;
		this.streetNm = streetNm;
		this.streetIntro = streetIntro;
		this.streetStatus = streetStatus;
		this.streetMaxMember = streetMaxMember;
		this.streetPoint = streetPoint;
		this.imgNo = imgNo;
		this.districtNo = districtNo;
	}

	public int getStreetNo() {
		return streetNo;
	}

	public void setStreetNo(int streetNo) {
		this.streetNo = streetNo;
	}

	public String getStreetNm() {
		return streetNm;
	}

	public void setStreetNm(String streetNm) {
		this.streetNm = streetNm;
	}

	public String getStreetIntro() {
		return streetIntro;
	}

	public void setStreetIntro(String streetIntro) {
		this.streetIntro = streetIntro;
	}

	public char getStreetStatus() {
		return streetStatus;
	}

	public void setStreetStatus(char streetStatus) {
		this.streetStatus = streetStatus;
	}

	public int getStreetMaxMember() {
		return streetMaxMember;
	}

	public void setStreetMaxMember(int streetMaxMember) {
		this.streetMaxMember = streetMaxMember;
	}

	public int getStreetPoint() {
		return streetPoint;
	}

	public void setStreetPoint(int streetPoint) {
		this.streetPoint = streetPoint;
	}

	public int getImgNo() {
		return imgNo;
	}

	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}

	public int getDistrictNo() {
		return districtNo;
	}

	public void setDistrictNo(int districtNo) {
		this.districtNo = districtNo;
	}

	
	@Override
	public String toString() {
		return "Street [streetNo=" + streetNo + ", streetNm=" + streetNm + ", streetIntro=" + streetIntro
				+ ", streetStatus=" + streetStatus + ", streetMaxMember=" + streetMaxMember + ", streetPoint="
				+ streetPoint + ", imgNo=" + imgNo + ", districtNo=" + districtNo + "]";
	}
	
	
}
