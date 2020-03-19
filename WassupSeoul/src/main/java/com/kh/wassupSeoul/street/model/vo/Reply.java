package com.kh.wassupSeoul.street.model.vo;

import java.sql.Timestamp;

public class Reply {
	
	private int replyNo;
	private String replyContent ;
	private Timestamp replyDt;
	private String replyStatus;
	private String replyLevel;
	private int memberNo;
	private int boardNo;
	private int reReplyNo;
	
	public Reply() {
		// TODO Auto-generated constructor stub
	}
	
	public Reply(int replyNo, String replyContent, Timestamp replyDt, String replyStatus, String replyLevel,
			int memberNo, int boardNo, int reReplyNo) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.replyDt = replyDt;
		this.replyStatus = replyStatus;
		this.replyLevel = replyLevel;
		this.memberNo = memberNo;
		this.boardNo = boardNo;
		this.reReplyNo = reReplyNo;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public Timestamp getReplyDt() {
		return replyDt;
	}

	public void setReplyDt(Timestamp replyDt) {
		this.replyDt = replyDt;
	}

	public String getReplyStatus() {
		return replyStatus;
	}

	public void setReplyStatus(String replyStatus) {
		this.replyStatus = replyStatus;
	}

	public String getReplyLevel() {
		return replyLevel;
	}

	public void setReplyLevel(String replyLevel) {
		this.replyLevel = replyLevel;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getReReplyNo() {
		return reReplyNo;
	}

	public void setReReplyNo(int reReplyNo) {
		this.reReplyNo = reReplyNo;
	}

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", replyContent=" + replyContent + ", replyDt=" + replyDt
				+ ", replyStatus=" + replyStatus + ", replyLevel=" + replyLevel + ", memberNo=" + memberNo
				+ ", boardNo=" + boardNo + ", reReplyNo=" + reReplyNo + "]";
	}
	
}
