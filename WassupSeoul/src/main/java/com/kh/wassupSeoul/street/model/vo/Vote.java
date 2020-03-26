package com.kh.wassupSeoul.street.model.vo;

import java.sql.Timestamp;
import java.util.Date;

public class Vote {
	
	private int boardNo;
	private String voteTitle;
	private String voteResult;
	private Timestamp voteEnrollDt;
	private Date voteEndDt;
	private String voteDup;
	private String voteOtion;
	
	public Vote() {
	}

	public Vote(int boardNo, String voteTitle, String voteResult, Timestamp voteEnrollDt, Date voteEndDt,
			String voteDup, String voteOtion) {
		super();
		this.boardNo = boardNo;
		this.voteTitle = voteTitle;
		this.voteResult = voteResult;
		this.voteEnrollDt = voteEnrollDt;
		this.voteEndDt = voteEndDt;
		this.voteDup = voteDup;
		this.voteOtion = voteOtion;
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

	@Override
	public String toString() {
		return "Vote [boardNo=" + boardNo + ", voteTitle=" + voteTitle + ", voteResult=" + voteResult
				+ ", voteEnrollDt=" + voteEnrollDt + ", voteEndDt=" + voteEndDt + ", voteDup=" + voteDup
				+ ", voteOtion=" + voteOtion + "]";
	}

}
