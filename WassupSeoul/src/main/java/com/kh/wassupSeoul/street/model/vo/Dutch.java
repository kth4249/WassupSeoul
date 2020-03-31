package com.kh.wassupSeoul.street.model.vo;

import java.util.Arrays;

public class Dutch {
	private int boardNo;
	private int dutchTotal;
	private int dutchCount;
	private int dividePrice;
	private int[] memArray;
	
	public Dutch() {
		// TODO Auto-generated constructor stub
	}

	public Dutch(int boardNo, int dutchTotal, int dutchCount, int dividePrice, int[] memArray) {
		super();
		this.boardNo = boardNo;
		this.dutchTotal = dutchTotal;
		this.dutchCount = dutchCount;
		this.dividePrice = dividePrice;
		this.memArray = memArray;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getDutchTotal() {
		return dutchTotal;
	}

	public void setDutchTotal(int dutchTotal) {
		this.dutchTotal = dutchTotal;
	}

	public int getDutchCount() {
		return dutchCount;
	}

	public void setDutchCount(int dutchCount) {
		this.dutchCount = dutchCount;
	}

	public int getDividePrice() {
		return dividePrice;
	}

	public void setDividePrice(int dividePrice) {
		this.dividePrice = dividePrice;
	}

	public int[] getMemArray() {
		return memArray;
	}

	public void setMemArray(int[] memArray) {
		this.memArray = memArray;
	}

	@Override
	public String toString() {
		return "Dutch [boardNo=" + boardNo + ", dutchTotal=" + dutchTotal + ", dutchCount=" + dutchCount
				+ ", dividePrice=" + dividePrice + ", memArray=" + Arrays.toString(memArray) + "]";
	}
	
	
	
}
