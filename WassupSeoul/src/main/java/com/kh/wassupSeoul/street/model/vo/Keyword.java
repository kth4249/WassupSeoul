package com.kh.wassupSeoul.street.model.vo;

public class Keyword {
	private int keywordNo;
	private String keywordContent;
	private int streetNo;
	
	public Keyword() {
		// TODO Auto-generated constructor stub
	}

	public Keyword(int keywordNo, String keywordContent, int streetNo) {
		super();
		this.keywordNo = keywordNo;
		this.keywordContent = keywordContent;
		this.streetNo = streetNo;
	}

	public int getKeywordNo() {
		return keywordNo;
	}

	public void setKeywordNo(int keywordNo) {
		this.keywordNo = keywordNo;
	}

	public String getKeywordContent() {
		return keywordContent;
	}

	public void setKeywordContent(String keywordContent) {
		this.keywordContent = keywordContent;
	}

	public int getStreetNo() {
		return streetNo;
	}

	public void setStreetNo(int streetNo) {
		this.streetNo = streetNo;
	}

	@Override
	public String toString() {
		return "Keyword [keywordNo=" + keywordNo + ", keywordContent=" + keywordContent + ", streetNo=" + streetNo
				+ "]";
	}
	
	
}
