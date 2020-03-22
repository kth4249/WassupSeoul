package com.kh.wassupSeoul.member.model.vo;

import java.sql.Date;

public class Member {
	
	private int memberNo;
	private String memberEmail;
	private String memberPwd;
	private String memberNm;
	private String memberNickname;
	private String memberPhone;
	private String memberGender;
	private int memberAge;
	private String memberProfileUrl;
	private String memberGrade;
	private Date memberEnrollDt;
	private String memberStatus;
	private String citizenStatus; // 03/22 태훈 추가
	
	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(String memberEmail, String memberPwd, String memberNm, String memberNickname, String memberPhone,
			String memberGender, int memberAge, String memberProfileUrl) {
		super();
		this.memberEmail = memberEmail;
		this.memberPwd = memberPwd;
		this.memberNm = memberNm;
		this.memberNickname = memberNickname;
		this.memberPhone = memberPhone;
		this.memberGender = memberGender;
		this.memberAge = memberAge;
		this.memberProfileUrl = memberProfileUrl;
	}

	public Member(int memberNo, String memberEmail, String memberPwd, String memberNm, String memberNickname,
			String memberPhone, String memberGender, int memberAge, String memberProfileUrl, String memberGrade,
			Date memberEnrollDt, String memberStatus) {
		super();
		this.memberNo = memberNo;
		this.memberEmail = memberEmail;
		this.memberPwd = memberPwd;
		this.memberNm = memberNm;
		this.memberNickname = memberNickname;
		this.memberPhone = memberPhone;
		this.memberGender = memberGender;
		this.memberAge = memberAge;
		this.memberProfileUrl = memberProfileUrl;
		this.memberGrade = memberGrade;
		this.memberEnrollDt = memberEnrollDt;
		this.memberStatus = memberStatus;
	}
	
	

	public Member(int memberNo, String memberEmail, String memberPwd, String memberNm, String memberNickname,
			String memberPhone, String memberGender, int memberAge, String memberProfileUrl, String memberGrade,
			Date memberEnrollDt, String memberStatus, String citizenStatus) {
		super();
		this.memberNo = memberNo;
		this.memberEmail = memberEmail;
		this.memberPwd = memberPwd;
		this.memberNm = memberNm;
		this.memberNickname = memberNickname;
		this.memberPhone = memberPhone;
		this.memberGender = memberGender;
		this.memberAge = memberAge;
		this.memberProfileUrl = memberProfileUrl;
		this.memberGrade = memberGrade;
		this.memberEnrollDt = memberEnrollDt;
		this.memberStatus = memberStatus;
		this.citizenStatus = citizenStatus;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberNm() {
		return memberNm;
	}

	public void setMemberNm(String memberNm) {
		this.memberNm = memberNm;
	}

	public String getMemberNickname() {
		return memberNickname;
	}

	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberGender() {
		return memberGender;
	}

	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}

	public int getMemberAge() {
		return memberAge;
	}

	public void setMemberAge(int memberAge) {
		this.memberAge = memberAge;
	}

	public String getMemberProfileUrl() {
		return memberProfileUrl;
	}

	public void setMemberProfileUrl(String memberProfileUrl) {
		this.memberProfileUrl = memberProfileUrl;
	}

	public String getMemberGrade() {
		return memberGrade;
	}

	public void setMemberGrade(String memberGrade) {
		this.memberGrade = memberGrade;
	}

	public Date getMemberEnrollDt() {
		return memberEnrollDt;
	}

	public void setMemberEnrollDt(Date memberEnrollDt) {
		this.memberEnrollDt = memberEnrollDt;
	}

	public String getMemberStatus() {
		return memberStatus;
	}

	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}
	
	

	public String getCitizenStatus() {
		return citizenStatus;
	}

	public void setCitizenStatus(String citizenStatus) {
		this.citizenStatus = citizenStatus;
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberEmail=" + memberEmail + ", memberPwd=" + memberPwd
				+ ", memberNm=" + memberNm + ", memberNickname=" + memberNickname + ", memberPhone=" + memberPhone
				+ ", memberGender=" + memberGender + ", memberAge=" + memberAge + ", memberProfileUrl="
				+ memberProfileUrl + ", memberGrade=" + memberGrade + ", memberEnrollDt=" + memberEnrollDt
				+ ", memberStatus=" + memberStatus + ", citizenStatus=" + citizenStatus + "]";
	}

	

}
