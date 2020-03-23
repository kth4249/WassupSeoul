package com.kh.wassupSeoul.filter;

import java.io.IOException;
import java.util.List;

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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.kh.wassupSeoul.member.model.vo.Member;
import com.kh.wassupSeoul.street.model.service.StreetService;
import com.kh.wassupSeoul.street.model.vo.Keyword;
import com.kh.wassupSeoul.street.model.vo.Street;

@Component("streetFilter")
@WebFilter(filterName="streetFilter",urlPatterns={"/street/streetMain","/street/streetInsert","/street/recommendFriend","/street/calendar"})
public class StreetFilter implements Filter {
	// 골목메인,골목 개설,추천친구,일정 이동시 필터 적용
	
	@Autowired
	private StreetService streetService;

    public StreetFilter() {

    }
    
	public void destroy() {

	}
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest)request; // request에는 HttpServletRequest이 저장되어 있음(다운캐스팅 가능,이렇게 지정안해주면 HttpServletRequest의 메소드 사용 못함,부모 객체라서)
		HttpServletResponse res = (HttpServletResponse)response; // response도  HttpServletResponse가 저장되어 있음
		HttpSession session = req.getSession(); 
		
		int streetNo = Integer.parseInt(req.getParameter("streetNo"));
		System.out.println("필터 streetNo : " + streetNo);
		Member loginMember = (Member)session.getAttribute("loginMember");
		System.out.println("필터 로그인 멤버 : " + loginMember);
		System.out.println("-----------------");
		
		try {
			// 사이드바 정보 시작
			// 1. 골목정보
			Street street = streetService.selectStreet(streetNo);
			System.out.println("필터 골목 정보 : " + street);
			// 1_1. 골목 썸네일 
			String imgUrl = streetService.selectImgUrl(street.getImgNo());
			street.setImgUrl(imgUrl);
			// 2. 현재 골목 주민수 
			int citizenCount = streetService.selectCitizenCount(streetNo);
			req.setAttribute("citizenCount",citizenCount);
			// 3. 현재 골목 골목대장 닉네임
			String streetMasterNm = streetService.selectStreetMasterNm(streetNo);
			req.setAttribute("streetMasterNm",streetMasterNm);
			// 4. 현재 골목 키워드
			List<Keyword> streetKeyword = streetService.selectMyKeyword(streetNo);
			req.setAttribute("streetKeyword",streetKeyword);
			// 5. 현재 골목 등급
			String badgeUrl = streetService.selectBadgeUrl(streetNo, street.getStreetPoint());
			req.setAttribute("badgeUrl",badgeUrl);
			// 6. 로그인 회원 골목 등급 
			String citizenGrade = streetService.selectCitizenGrade(loginMember.getMemberNo(),streetNo);
			req.setAttribute("citizenGrade",citizenGrade);
			
			//req.setAttribute("street", street);
			// 사이드바 정보 끝
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		chain.doFilter(request, response);
		
	}
	

	public void init(FilterConfig fConfig) throws ServletException {

	}

	



}
