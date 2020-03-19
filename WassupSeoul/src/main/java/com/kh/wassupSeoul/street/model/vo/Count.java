package com.kh.wassupSeoul.street.model.vo;

public class Count {
	
	private int boardNo;
	private int commentCount;
	private int likeCount;
	
	public Count() {
	}
	
	public Count(int boardNo, int commentCount, int likeCount) {
		super();
		this.boardNo = boardNo;
		this.commentCount = commentCount;
		this.likeCount = likeCount;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	@Override
	public String toString() {
		return "Count [boardNo=" + boardNo + ", commentCount=" + commentCount + ", likeCount=" + likeCount + "]";
	}
	
}
