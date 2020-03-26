package com.kh.wassupSeoul.street.model.vo;

import java.sql.Timestamp;

public class Vote {
	
	private int boardNo;
	private String voteTitle;
	private String voteResult;
	private Timestamp voteEnrollDt;
	private Timestamp voteEndDt;
	private String voteDup;
	
	public Vote() {
		// TODO Auto-generated constructor stub
	}

	public Vote(int boardNo, String voteTitle, String voteResult, Timestamp voteEnrollDt, Timestamp voteEndDt,
			String voteDup) {
		super();
		this.boardNo = boardNo;
		this.voteTitle = voteTitle;
		this.voteResult = voteResult;
		this.voteEnrollDt = voteEnrollDt;
		this.voteEndDt = voteEndDt;
		this.voteDup = voteDup;
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

	public Timestamp getVoteEndDt() {
		return voteEndDt;
	}

	public void setVoteEndDt(Timestamp voteEndDt) {
		this.voteEndDt = voteEndDt;
	}

	public String getVoteDup() {
		return voteDup;
	}

	public void setVoteDup(String voteDup) {
		this.voteDup = voteDup;
	}

	@Override
	public String toString() {
		return "Vote [boardNo=" + boardNo + ", voteTitle=" + voteTitle + ", voteResult=" + voteResult
				+ ", voteEnrollDt=" + voteEnrollDt + ", voteEndDt=" + voteEndDt + ", voteDup=" + voteDup + "]";
	}
	
	
}
