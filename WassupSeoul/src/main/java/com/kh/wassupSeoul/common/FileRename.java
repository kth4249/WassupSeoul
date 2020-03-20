package com.kh.wassupSeoul.common;

import java.text.SimpleDateFormat;

public class FileRename {
	public static String rename(String originFileName) {
		
		// 국화.jpg
		// 200309124515 _ 랜덤 여섯 숫자 .jpg
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		String date = sdf.format(new java.util.Date(System.currentTimeMillis()));
		
		StringBuffer sb = new StringBuffer();
		for(int i=0 ; i<6 ; i++) {
			sb.append((int)(Math.random()*10));
		}
		
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		
		return date + "_" + sb.toString() + ext;
	}
	
public static String renameProfile(String defaultImg) {
		
		// 국화.jpg
		// 200309124515 _ 랜덤 여섯 숫자 .jpg
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		String date = sdf.format(new java.util.Date(System.currentTimeMillis()));
		
		StringBuffer sb = new StringBuffer();
		for(int i=0 ; i<4 ; i++) {
			sb.append((int)(Math.random()*10));
		}
		
		String ext = defaultImg.substring(defaultImg.lastIndexOf("."));
		
		return date + "_" + sb.toString() + ext;
	}
	
	
	
}
