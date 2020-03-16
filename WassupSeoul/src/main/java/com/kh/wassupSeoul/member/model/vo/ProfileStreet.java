package com.kh.wassupSeoul.member.model.vo;

public class ProfileStreet {
	private int streetNo;
	private String streetNm;
	private String streetIntro;
	private int streetMaxMember;
	private int streetPoint;
	private int imgNo;
	private int districtNo;
	private String imgUrl;
	private String memberNm;
	private String districtNm;
	private char citizenGrade;
	
	public ProfileStreet() {
		// TODO Auto-generated constructor stub
	}
	

	public ProfileStreet(int streetNo, String streetNm, String streetIntro, int streetMaxMember, int streetPoint,
			int imgNo, int districtNo, String imgUrl, String memberNm, String districtNm, char citizenGrade) {
		super();
		this.streetNo = streetNo;
		this.streetNm = streetNm;
		this.streetIntro = streetIntro;
		this.streetMaxMember = streetMaxMember;
		this.streetPoint = streetPoint;
		this.imgNo = imgNo;
		this.districtNo = districtNo;
		this.imgUrl = imgUrl;
		this.memberNm = memberNm;
		this.districtNm = districtNm;
		this.citizenGrade = citizenGrade;
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

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getMemberNm() {
		return memberNm;
	}

	public void setMemberNm(String memberNm) {
		this.memberNm = memberNm;
	}

	public String getDistrictNm() {
		return districtNm;
	}

	public void setDistrictNm(String districtNm) {
		this.districtNm = districtNm;
	}
	
	

	public char getCitizenGrade() {
		return citizenGrade;
	}


	public void setCitizenGrade(char citizenGrade) {
		this.citizenGrade = citizenGrade;
	}


	@Override
	public String toString() {
		return "ProfileStreet [streetNo=" + streetNo + ", streetNm=" + streetNm + ", streetIntro=" + streetIntro
				+ ", streetMaxMember=" + streetMaxMember + ", streetPoint=" + streetPoint + ", imgNo=" + imgNo
				+ ", districtNo=" + districtNo + ", imgUrl=" + imgUrl + ", memberNm=" + memberNm + ", districtNm="
				+ districtNm + ", citizenGrade=" + citizenGrade + "]";
	}

	
	
}


