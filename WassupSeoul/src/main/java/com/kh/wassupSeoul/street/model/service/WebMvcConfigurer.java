package com.kh.wassupSeoul.street.model.service;

import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;

public interface WebMvcConfigurer {

	public abstract void addResourceHandlers(ResourceHandlerRegistry registry);

}
