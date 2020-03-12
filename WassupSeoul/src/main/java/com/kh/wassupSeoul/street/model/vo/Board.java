package com.kh.wassupSeoul.street.model.vo;

import java.sql.Date;

public class Board {

	private int boardNo;
	private String boardContent;
	private Date boardWriteDt;
	private String boardStatus;
	private String boardLevel;
	private int streetNo;
	private int memberNo;
	private int typeNo;
	
	public Board() {
	}

	public Board(int boardNo, String boardContent, Date boardWriteDt, String boardStatus, String boardLevel,
			int streetNo, int memberNo, int typeNo) {
		super();
		this.boardNo = boardNo;
		this.boardContent = boardContent;
		this.boardWriteDt = boardWriteDt;
		this.boardStatus = boardStatus;
		this.boardLevel = boardLevel;
		this.streetNo = streetNo;
		this.memberNo = memberNo;
		this.typeNo = typeNo;
	}

	
	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public Date getBoardWriteDt() {
		return boardWriteDt;
	}

	public void setBoardWriteDt(Date boardWriteDt) {
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
	

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardContent=" + boardContent + ", boardWriteDt=" + boardWriteDt
				+ ", boardStatus=" + boardStatus + ", boardLevel=" + boardLevel + ", streetNo=" + streetNo
				+ ", memberNo=" + memberNo + ", typeNo=" + typeNo + "]";
	}

	
	
}
