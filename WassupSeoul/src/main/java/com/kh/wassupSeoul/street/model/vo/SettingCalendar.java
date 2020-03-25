package com.kh.wassupSeoul.street.model.vo;

public class SettingCalendar {
	private int boardNo;
	private String calTitle;
	private String calContent;
	private String calLocation;
	private String calStartDate;
	private String calStartDay;
	private String calStartDayOfWeek;
	private String calStartHour;
	private String calEndDate;
	private char calendarJoin;
	private int calJoinLimit;
	private int streetNo;
	
	public SettingCalendar() {
		// TODO Auto-generated constructor stub
	}

	public SettingCalendar(int boardNo, String calTitle, String calContent, String calLocation, String calStartDate,
			String calStartDay, String calStartDayOfWeek, String calStartHour, String calEndDate, char calendarJoin,
			int calJoinLimit, int streetNo) {
		super();
		this.boardNo = boardNo;
		this.calTitle = calTitle;
		this.calContent = calContent;
		this.calLocation = calLocation;
		this.calStartDate = calStartDate;
		this.calStartDay = calStartDay;
		this.calStartDayOfWeek = calStartDayOfWeek;
		this.calStartHour = calStartHour;
		this.calEndDate = calEndDate;
		this.calendarJoin = calendarJoin;
		this.calJoinLimit = calJoinLimit;
		this.streetNo = streetNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getCalTitle() {
		return calTitle;
	}

	public void setCalTitle(String calTitle) {
		this.calTitle = calTitle;
	}

	public String getCalContent() {
		return calContent;
	}

	public void setCalContent(String calContent) {
		this.calContent = calContent;
	}

	public String getCalLocation() {
		return calLocation;
	}

	public void setCalLocation(String calLocation) {
		this.calLocation = calLocation;
	}

	public String getCalStartDate() {
		return calStartDate;
	}

	public void setCalStartDate(String calStartDate) {
		this.calStartDate = calStartDate;
	}

	public String getCalStartDay() {
		return calStartDay;
	}

	public void setCalStartDay(String calStartDay) {
		this.calStartDay = calStartDay;
	}

	public String getCalStartDayOfWeek() {
		return calStartDayOfWeek;
	}

	public void setCalStartDayOfWeek(String calStartDayOfWeek) {
		this.calStartDayOfWeek = calStartDayOfWeek;
	}

	public String getCalStartHour() {
		return calStartHour;
	}

	public void setCalStartHour(String calStartHour) {
		this.calStartHour = calStartHour;
	}

	public String getCalEndDate() {
		return calEndDate;
	}

	public void setCalEndDate(String calEndDate) {
		this.calEndDate = calEndDate;
	}

	public char getCalendarJoin() {
		return calendarJoin;
	}

	public void setCalendarJoin(char calendarJoin) {
		this.calendarJoin = calendarJoin;
	}

	public int getCalJoinLimit() {
		return calJoinLimit;
	}

	public void setCalJoinLimit(int calJoinLimit) {
		this.calJoinLimit = calJoinLimit;
	}

	public int getStreetNo() {
		return streetNo;
	}

	public void setStreetNo(int streetNo) {
		this.streetNo = streetNo;
	}

	@Override
	public String toString() {
		return "SettingCalendar [boardNo=" + boardNo + ", calTitle=" + calTitle + ", calContent=" + calContent
				+ ", calLocation=" + calLocation + ", calStartDate=" + calStartDate + ", calStartDay=" + calStartDay
				+ ", calStartDayOfWeek=" + calStartDayOfWeek + ", calStartHour=" + calStartHour + ", calEndDate="
				+ calEndDate + ", calendarJoin=" + calendarJoin + ", calJoinLimit=" + calJoinLimit + ", streetNo="
				+ streetNo + "]";
	}
	
	
	
	
	

	
	
	
}
