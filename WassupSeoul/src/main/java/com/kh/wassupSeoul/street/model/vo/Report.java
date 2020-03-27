package com.kh.wassupSeoul.street.model.vo;

import java.sql.Date;

public class Report {
	
	private int reportNo;
	private Date meetingStartDate;
	private Date meetingEndDate;
	private String meetingPlace;
	private int meetingMember;
	private String reportContent;
	private int streetNo;
	private String meetingImgUrl;
	
	
	public Report() {
		// TODO Auto-generated constructor stub
	}


	


	public Report(int reportNo, Date meetingStartDate, Date meetingEndDate, String meetingPlace, int meetingMember,
			String reportContent, int streetNo, String meetingImgUrl) {
		super();
		this.reportNo = reportNo;
		this.meetingStartDate = meetingStartDate;
		this.meetingEndDate = meetingEndDate;
		this.meetingPlace = meetingPlace;
		this.meetingMember = meetingMember;
		this.reportContent = reportContent;
		this.streetNo = streetNo;
		this.meetingImgUrl = meetingImgUrl;
	}



	public int getReportNo() {
		return reportNo;
	}


	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}


	public Date getMeetingStartDate() {
		return meetingStartDate;
	}


	public void setMeetingStartDate(Date meetingStartDate) {
		this.meetingStartDate = meetingStartDate;
	}


	public Date getMeetingEndDate() {
		return meetingEndDate;
	}


	public void setMeetingEndDate(Date meetingEndDate) {
		this.meetingEndDate = meetingEndDate;
	}


	public String getMeetingPlace() {
		return meetingPlace;
	}


	public void setMeetingPlace(String meetingPlace) {
		this.meetingPlace = meetingPlace;
	}


	public int getMeetingMember() {
		return meetingMember;
	}


	public void setMeetingMember(int meetingMember) {
		this.meetingMember = meetingMember;
	}


	public String getReportContent() {
		return reportContent;
	}


	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}


	public int getStreetNo() {
		return streetNo;
	}


	public void setStreetNo(int streetNo) {
		this.streetNo = streetNo;
	}


	public String getMeetingImgUrl() {
		return meetingImgUrl;
	}


	public void setMeetingImgUrl(String meetingImgUrl) {
		this.meetingImgUrl = meetingImgUrl;
	}





	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", meetingStartDate=" + meetingStartDate + ", meetingEndDate="
				+ meetingEndDate + ", meetingPlace=" + meetingPlace + ", meetingMember=" + meetingMember
				+ ", reportContent=" + reportContent + ", streetNo=" + streetNo + ", meetingImgUrl=" + meetingImgUrl
				+ "]";
	}




	
	
	
	

}
