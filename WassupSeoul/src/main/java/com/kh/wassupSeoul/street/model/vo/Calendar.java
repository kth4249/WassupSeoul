package com.kh.wassupSeoul.street.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class Calendar {
	private int  boardNo;
	private String calendarTitle;
	private String calendarContent;
	private String calendarLocation;
	private Timestamp calendarStartDate;
	private Timestamp calendarEndDate;
	private char calendarJoin;
	private int calendarJoinLimit;
	private Date calendarJoinEndDate;
	private int streetNo;
	public Calendar(int boardNo, String calendarTitle, String calendarContent, String calendarLocation,
			Timestamp calendarStartDate, Timestamp calendarEndDate, char calendarJoin, int calendarJoinLimit,
			Date calendarJoinEndDate, int streetNo) {
		super();
		this.boardNo = boardNo;
		this.calendarTitle = calendarTitle;
		this.calendarContent = calendarContent;
		this.calendarLocation = calendarLocation;
		this.calendarStartDate = calendarStartDate;
		this.calendarEndDate = calendarEndDate;
		this.calendarJoin = calendarJoin;
		this.calendarJoinLimit = calendarJoinLimit;
		this.calendarJoinEndDate = calendarJoinEndDate;
		this.streetNo = streetNo;
	}
	
	public Calendar() {
		// TODO Auto-generated constructor stub
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getCalendarTitle() {
		return calendarTitle;
	}

	public void setCalendarTitle(String calendarTitle) {
		this.calendarTitle = calendarTitle;
	}

	public String getCalendarContent() {
		return calendarContent;
	}

	public void setCalendarContent(String calendarContent) {
		this.calendarContent = calendarContent;
	}

	public String getCalendarLocation() {
		return calendarLocation;
	}

	public void setCalendarLocation(String calendarLocation) {
		this.calendarLocation = calendarLocation;
	}

	public Timestamp getCalendarStartDate() {
		return calendarStartDate;
	}

	public void setCalendarStartDate(Timestamp calendarStartDate) {
		this.calendarStartDate = calendarStartDate;
	}

	public Timestamp getCalendarEndDate() {
		return calendarEndDate;
	}

	public void setCalendarEndDate(Timestamp calendarEndDate) {
		this.calendarEndDate = calendarEndDate;
	}

	public char getCalendarJoin() {
		return calendarJoin;
	}

	public void setCalendarJoin(char calendarJoin) {
		this.calendarJoin = calendarJoin;
	}

	public int getCalendarJoinLimit() {
		return calendarJoinLimit;
	}

	public void setCalendarJoinLimit(int calendarJoinLimit) {
		this.calendarJoinLimit = calendarJoinLimit;
	}

	public Date getCalendarJoinEndDate() {
		return calendarJoinEndDate;
	}

	public void setCalendarJoinEndDate(Date calendarJoinEndDate) {
		this.calendarJoinEndDate = calendarJoinEndDate;
	}

	public int getStreetNo() {
		return streetNo;
	}

	public void setStreetNo(int streetNo) {
		this.streetNo = streetNo;
	}

	@Override
	public String toString() {
		return "Calendar [boardNo=" + boardNo + ", calendarTitle=" + calendarTitle + ", calendarContent="
				+ calendarContent + ", calendarLocation=" + calendarLocation + ", calendarStartDate="
				+ calendarStartDate + ", calendarEndDate=" + calendarEndDate + ", calendarJoin=" + calendarJoin
				+ ", calendarJoinLimit=" + calendarJoinLimit + ", calendarJoinEndDate=" + calendarJoinEndDate
				+ ", streetNo=" + streetNo + "]";
	}
	
	
	
	
	

}
