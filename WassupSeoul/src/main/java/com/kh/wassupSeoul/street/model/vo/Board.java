package com.kh.wassupSeoul.street.model.vo;

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
	private int typeNo; // 게시글 타입
	private int thumbCount;
	private int replyCount;
	private String memberProfile;
	private String thumbStatus;
	
	public Board() {
	}

	public Board(int boardNo, String boardWriter, String boardContent, Timestamp boardWriteDt, String boardStatus,
			String boardLevel, int streetNo, int memberNo, int typeNo, int thumbCount, int replyCount,
			String memberProfile, String thumbStatus) {
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
		this.memberProfile = memberProfile;
		this.thumbStatus = thumbStatus;
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

	public String getMemberProfile() {
		return memberProfile;
	}

	public void setMemberProfile(String memberProfile) {
		this.memberProfile = memberProfile;
	}

	public String getThumbStatus() {
		return thumbStatus;
	}

	public void setThumbStatus(String thumbStatus) {
		this.thumbStatus = thumbStatus;
	}


	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardWriter=" + boardWriter + ", boardContent=" + boardContent
				+ ", boardWriteDt=" + boardWriteDt + ", boardStatus=" + boardStatus + ", boardLevel=" + boardLevel
				+ ", streetNo=" + streetNo + ", memberNo=" + memberNo + ", typeNo=" + typeNo + ", thumbCount="
				+ thumbCount + ", replyCount=" + replyCount + ", memberProfile=" + memberProfile + ", thumbStatus="
				+ thumbStatus + "]";
	}

	
}
