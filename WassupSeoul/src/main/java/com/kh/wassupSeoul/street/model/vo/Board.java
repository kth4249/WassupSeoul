package com.kh.wassupSeoul.street.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class Board {

	private int boardNo;
	private String boardWriter;
	private String boardContent;
	private Timestamp boardWriteDt;
	private String boardStatus;
	private String boardLevel;
	private int streetNo;
	private int memberNo;
	private int typeNo;
	private int thumbCount;
	private int replyCount;
	
	public Board() {
	}

	public Board(int boardNo, String boardWriter, String boardContent, Timestamp boardWriteDt, String boardStatus,
			String boardLevel, int streetNo, int memberNo, int typeNo, int thumbCount, int replyCount) {
		super();
		this.boardNo = boardNo;
		this.boardWriter = boardWriter;
		this.boardContent = boardContent;
		this.boardWriteDt = boardWriteDt;
		this.boardStatus = boardStatus;
		this.boardLevel = boardLevel;
		this.streetNo = streetNo;
		this.memberNo = memberNo;
		this.typeNo = typeNo;
		this.thumbCount = thumbCount;
		this.replyCount = replyCount;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardWriter() {
		return boardWriter;
	}

	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public Timestamp getBoardWriteDt() {
		return boardWriteDt;
	}

	public void setBoardWriteDt(Timestamp boardWriteDt) {
		this.boardWriteDt = boardWriteDt;
	}

	public String getBoardStatus() {
		return boardStatus;
	}

	public void setBoardStatus(String boardStatus) {
		this.boardStatus = boardStatus;
	}

	public String getBoardLevel() {
		return boardLevel;
	}

	public void setBoardLevel(String boardLevel) {
		this.boardLevel = boardLevel;
	}

	public int getStreetNo() {
		return streetNo;
	}

	public void setStreetNo(int streetNo) {
		this.streetNo = streetNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getTypeNo() {
		return typeNo;
	}

	public void setTypeNo(int typeNo) {
		this.typeNo = typeNo;
	}

	public int getThumbCount() {
		return thumbCount;
	}

	public void setThumbCount(int thumbCount) {
		this.thumbCount = thumbCount;
	}

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardWriter=" + boardWriter + ", boardContent=" + boardContent
				+ ", boardWriteDt=" + boardWriteDt + ", boardStatus=" + boardStatus + ", boardLevel=" + boardLevel
				+ ", streetNo=" + streetNo + ", memberNo=" + memberNo + ", typeNo=" + typeNo + ", thumbCount="
				+ thumbCount + ", replyCount=" + replyCount + "]";
	}


	
}
