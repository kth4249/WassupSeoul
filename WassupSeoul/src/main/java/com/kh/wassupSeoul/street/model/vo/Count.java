package com.kh.wassupSeoul.street.model.vo;

public class Count {
	
	private int streetNo;
	private int boardNo;
	private int replyNo;
	private int commentCount;
	private int likeCount;
	private int replyCount;
	private int replyLikeCount;
	private int reReplyLikeCount;
	
	public Count() {
	}

	public Count(int streetNo, int boardNo, int replyNo, int commentCount, int likeCount, int replyCount,
			int replyLikeCount, int reReplyLikeCount) {
		super();
		this.streetNo = streetNo;
		this.boardNo = boardNo;
		this.replyNo = replyNo;
		this.commentCount = commentCount;
		this.likeCount = likeCount;
		this.replyCount = replyCount;
		this.replyLikeCount = replyLikeCount;
		this.reReplyLikeCount = reReplyLikeCount;
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

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
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

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

	public int getReplyLikeCount() {
		return replyLikeCount;
	}

	public void setReplyLikeCount(int replyLikeCount) {
		this.replyLikeCount = replyLikeCount;
	}

	public int getReReplyLikeCount() {
		return reReplyLikeCount;
	}

	public void setReReplyLikeCount(int reReplyLikeCount) {
		this.reReplyLikeCount = reReplyLikeCount;
	}

	@Override
	public String toString() {
		return "Count [streetNo=" + streetNo + ", boardNo=" + boardNo + ", replyNo=" + replyNo + ", commentCount="
				+ commentCount + ", likeCount=" + likeCount + ", replyCount=" + replyCount
				+ ", replyLikeCount=" + replyLikeCount + ", reReplyLikeCount=" + reReplyLikeCount + "]";
	}
	
	
}
