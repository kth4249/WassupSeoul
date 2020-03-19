package com.kh.wassupSeoul.street.model.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

public interface WebMvcConfigurer {

	void fileUpload(String email, MultipartFile file, HttpServletRequest request, 
			HttpServletResponse response)throws Exception;



}
