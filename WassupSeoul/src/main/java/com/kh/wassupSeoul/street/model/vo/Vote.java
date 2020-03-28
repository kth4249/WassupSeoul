package com.kh.wassupSeoul.street.model.vo;

import java.sql.Timestamp;
import java.util.Date;

public class Vote {
	
	private int streetNo;
	private int boardNo;
	private String voteTitle;
	private String voteResult;
	private Timestamp voteEnrollDt;
	private Date voteEndDt;
	private String voteDup;
	private String voteOtion;
	private String anonymity;
	private int voteNo;
	private int memberNo;
	private String voteStatus;
	
	public Vote() {
	}
	
	public Vote(int boardNo, String voteOtion) {
		super();
		this.boardNo = boardNo;
		this.voteOtion = voteOtion;
	}

	public Vote(int streetNo, int boardNo, String voteTitle, String voteResult, Timestamp voteEnrollDt, Date voteEndDt,
			String voteDup, String voteOtion, String anonymity, int voteNo, int memberNo, String voteStatus) {
		super();
		this.streetNo = streetNo;
		this.boardNo = boardNo;
		this.voteTitle = voteTitle;
		this.voteResult = voteResult;
		this.voteEnrollDt = voteEnrollDt;
		this.voteEndDt = voteEndDt;
		this.voteDup = voteDup;
		this.voteOtion = voteOtion;
		this.anonymity = anonymity;
		this.voteNo = voteNo;
		this.memberNo = memberNo;
		this.voteStatus = voteStatus;
	}

	public int getStreetNo() {
		return streetNo;
	}

	public void setStreetNo(int streetNo) {
		this.streetNo = streetNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getVoteTitle() {
		return voteTitle;
	}

	public void setVoteTitle(String voteTitle) {
		this.voteTitle = voteTitle;
	}

	public String getVoteResult() {
		return voteResult;
	}

	public void setVoteResult(String voteResult) {
		this.voteResult = voteResult;
	}

	public Timestamp getVoteEnrollDt() {
		return voteEnrollDt;
	}

	public void setVoteEnrollDt(Timestamp voteEnrollDt) {
		this.voteEnrollDt = voteEnrollDt;
	}

	public Date getVoteEndDt() {
		return voteEndDt;
	}

	public void setVoteEndDt(Date voteEndDt) {
		this.voteEndDt = voteEndDt;
	}

	public String getVoteDup() {
		return voteDup;
	}

	public void setVoteDup(String voteDup) {
		this.voteDup = voteDup;
	}

	public String getVoteOtion() {
		return voteOtion;
	}

	public void setVoteOtion(String voteOtion) {
		this.voteOtion = voteOtion;
	}

	public String getAnonymity() {
		return anonymity;
	}

	public void setAnonymity(String anonymity) {
		this.anonymity = anonymity;
	}

	public int getVoteNo() {
		return voteNo;
	}

	public void setVoteNo(int voteNo) {
		this.voteNo = voteNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getVoteStatus() {
		return voteStatus;
	}

	public void setVoteStatus(String voteStatus) {
		this.voteStatus = voteStatus;
	}

	@Override
	public String toString() {
		return "Vote [streetNo=" + streetNo + ", boardNo=" + boardNo + ", voteTitle=" + voteTitle + ", voteResult="
				+ voteResult + ", voteEnrollDt=" + voteEnrollDt + ", voteEndDt=" + voteEndDt + ", voteDup=" + voteDup
				+ ", voteOtion=" + voteOtion + ", anonymity=" + anonymity + ", voteNo=" + voteNo + ", memberNo="
				+ memberNo + ", voteStatus=" + voteStatus + "]";
	}

}
