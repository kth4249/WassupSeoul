package com.kh.wassupSeoul.square.model.vo;

import java.sql.Timestamp;

public class Alarm {
	private int alarmNo;
	private String alarmContent;
	private char alarmType;
	private String alarmAddr;
	private Timestamp alarmDt;
	private Timestamp alarmCheckDt;
	private String eventer;
	private int memberNo;
	
	public Alarm() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public Alarm(String alarmContent, char alarmType, String alarmAddr, String eventer, int memberNo) {
		super();
		this.alarmContent = alarmContent;
		this.alarmType = alarmType;
		this.alarmAddr = alarmAddr;
		this.eventer = eventer;
		this.memberNo = memberNo;
	}



	public Alarm(int alarmNo, String alarmContent, char alarmType, String alarmAddr, Timestamp alarmDt,
			Timestamp alarmCheckDt, String eventer, int memberNo) {
		super();
		this.alarmNo = alarmNo;
		this.alarmContent = alarmContent;
		this.alarmType = alarmType;
		this.alarmAddr = alarmAddr;
		this.alarmDt = alarmDt;
		this.alarmCheckDt = alarmCheckDt;
		this.eventer = eventer;
		this.memberNo = memberNo;
	}



	public int getAlarmNo() {
		return alarmNo;
	}

	public void setAlarmNo(int alarmNo) {
		this.alarmNo = alarmNo;
	}

	public String getAlarmContent() {
		return alarmContent;
	}

	public void setAlarmContent(String alarmContent) {
		this.alarmContent = alarmContent;
	}

	public char getAlarmType() {
		return alarmType;
	}

	public void setAlarmType(char alarmType) {
		this.alarmType = alarmType;
	}

	public String getAlarmAddr() {
		return alarmAddr;
	}

	public void setAlarmAddr(String alarmAddr) {
		this.alarmAddr = alarmAddr;
	}

	public Timestamp getAlarmDt() {
		return alarmDt;
	}

	public void setAlarmDt(Timestamp alarmDt) {
		this.alarmDt = alarmDt;
	}

	public Timestamp getAlarmCheckDt() {
		return alarmCheckDt;
	}

	public void setAlarmCheckDt(Timestamp alarmCheckDt) {
		this.alarmCheckDt = alarmCheckDt;
	}

	public String getEventer() {
		return eventer;
	}

	public void setEventer(String eventer) {
		this.eventer = eventer;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}



	@Override
	public String toString() {
		return "Alarm [alarmNo=" + alarmNo + ", alarmContent=" + alarmContent + ", alarmType=" + alarmType
				+ ", alarmAddr=" + alarmAddr + ", alarmDt=" + alarmDt + ", alarmCheckDt=" + alarmCheckDt + ", eventer="
				+ eventer + ", memberNo=" + memberNo + "]";
	}

	
	
}
