package com.kh.wassupSeoul.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.wassupSeoul.street.model.vo.StreetJoin;



@WebFilter(urlPatterns = {"/street/juminList",
						"/street/photoAlbum",
						"/street/calendar",
						"/street/recommendFriend"})
public class streetMenuFilter implements Filter {

   
    public streetMenuFilter() {
     
    }


	public void destroy() {
	
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		// 로그인 확인 -> Session -> request
		// sendRedirect() -> response
		
		// getSession 은 http 프로토콜 통신에서만 사용가능하다
		// -> 부모인 ServletRequest/HttpServletResponse을 자식인 HttpServletRequest/HttpServletResponse로 다운캐스팅 해준다.
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		HttpSession session = req.getSession();
		
		StreetJoin memGradeInSt = (StreetJoin)session.getAttribute("memGradeInSt");
		System.out.println(memGradeInSt);
		
		if(memGradeInSt == null) {
			// 골목에 가입되어있지 않은 경우
			session.setAttribute("msg", "권한이 없습니다.");
			res.sendRedirect(req.getContextPath()+"/square"); // 광장으로 이동
		}else {
			chain.doFilter(request, response);
			// 다음 필터 또는 요청된 servlet/jsp로 이동 
		}
		
	}

	
	public void init(FilterConfig fConfig) throws ServletException {
	
	}

}
