package com.kh.wassupSeoul.street.model.vo;

public class Bfile {
	
	private int bFileNo;
	private String bFileUrl;
	private int streetBfile;
	

	public Bfile(int bFileNo, String bFileUrl, int streetBfile) {
		super();
		this.bFileNo = bFileNo;
		this.bFileUrl = bFileUrl;
		this.streetBfile = streetBfile;
	}


	

	public int getbFileNo() {
		return bFileNo;
	}




	public void setbFileNo(int bFileNo) {
		this.bFileNo = bFileNo;
	}




	public String getbFileUrl() {
		return bFileUrl;
	}




	public void setbFileUrl(String bFileUrl) {
		this.bFileUrl = bFileUrl;
	}




	public int getStreetBfile() {
		return streetBfile;
	}




	public void setStreetBfile(int streetBfile) {
		this.streetBfile = streetBfile;
	}




	@Override
	public String toString() {
		return "Bfile [bFileNo=" + bFileNo + ", bFileUrl=" + bFileUrl + ", street_bFile=" + streetBfile + "]";
	}


	
	
	
	
}

