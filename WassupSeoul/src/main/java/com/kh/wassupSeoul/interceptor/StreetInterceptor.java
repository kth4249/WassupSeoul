package com.kh.wassupSeoul.interceptor;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.wassupSeoul.member.model.vo.Member;
import com.kh.wassupSeoul.street.model.service.StreetService;
import com.kh.wassupSeoul.street.model.vo.Calendar;
import com.kh.wassupSeoul.street.model.vo.Keyword;
import com.kh.wassupSeoul.street.model.vo.Reply;
import com.kh.wassupSeoul.street.model.vo.SettingCalendar;
import com.kh.wassupSeoul.street.model.vo.Street;
import com.kh.wassupSeoul.street.model.vo.StreetJoin;

public class StreetInterceptor extends HandlerInterceptorAdapter{
	
	@Autowired
	private StreetService streetService;
	
	// StreetController 보다 먼저 수행
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		return super.preHandle(request, response, handler);
	}
	
	// StreetController가 수행 되고 이후 화면 출력전 수행
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		HttpSession session = request.getSession();
		int streetNo = (int) session.getAttribute("streetNo");
		Member loginMember = (Member)session.getAttribute("loginMember");

		try {
			// 사이드바 정보 시작
			// 1. 골목정보
			Street street = streetService.selectStreet(streetNo);
			// 1_1. 골목 썸네일 
			String imgUrl = streetService.selectImgUrl(street.getImgNo());
			//street.setImgUrl(imgUrl);
			request.setAttribute("imgUrl", imgUrl);
			// 2. 현재 골목 주민수 
			int citizenCount = streetService.selectCitizenCount(streetNo);
			request.setAttribute("citizenCount",citizenCount);
			// 3. 현재 골목 골목대장 닉네임
			String streetMasterNm = streetService.selectStreetMasterNm(streetNo);
			request.setAttribute("streetMasterNm",streetMasterNm);
			// 4. 현재 골목 키워드
			List<Keyword> streetKeyword = streetService.selectMyKeyword(streetNo);
			request.setAttribute("streetKeyword",streetKeyword);
			// 5. 현재 골목 등급
			String badgeUrl = streetService.selectBadgeUrl(streetNo, street.getStreetPoint());
			request.setAttribute("badgeUrl",badgeUrl);
			// 6. 로그인 회원 골목 등급 
			String citizenGrade = streetService.selectCitizenGrade(loginMember.getMemberNo(),streetNo);
			request.setAttribute("citizenGrade",citizenGrade);
			// 7. 로그인 회원 골목 가입 여부
			Reply checkStreet = new Reply();
			checkStreet.setStreetNo(streetNo);
			checkStreet.setMemberNo(loginMember.getMemberNo());
			StreetJoin tempStreetJoin = streetService.memGradeInSt(checkStreet);
			String citizenStatus; // 로그인 회원의 골목 가입여부 파악
			if(tempStreetJoin == null) { // 골목 미가입
				citizenStatus = "N";
			} else { // 골목 가입
				citizenStatus = tempStreetJoin.getCitizenStatus();
			}
			// 8. 해당 골목 일정 조회
			List<Calendar> storeCalendar = streetService.selectStoreCalendar(streetNo); // DB저장된 일정
			ArrayList<SettingCalendar> setCalList = new ArrayList<SettingCalendar>(); // 화면 세팅용 리스트
			SettingCalendar temp = null; // 값 전달용 객체
			for(int e=0;e<storeCalendar.size();e++) {
				// timestamp를  원하는 형태로  변경해주는 메소드
				// E->요일 a->오전,오후
				
				// 년-월-일(시작일)
				String calStartDate = new SimpleDateFormat("yyyy-MM-dd").format(storeCalendar.get(e).getCalendarStartDate());
				// 년-월-일(마감일)
				String calEndDate = new SimpleDateFormat("yyyy-MM-dd").format(storeCalendar.get(e).getCalendarEndDate());
				
				// DB저장된 시작일 연도
				String startYear = new SimpleDateFormat("yyyy").format(storeCalendar.get(e).getCalendarStartDate());
				// DB저장된 마감일 연도
				String endYear = new SimpleDateFormat("yyyy").format(storeCalendar.get(e).getCalendarEndDate());
				
				if(!calStartDate.equals(calEndDate) && startYear.equals(endYear)) {
					// 시작일과 마감일이 다를 경우 + 현재 년도가 같은경우 -> 마감일 1일 : fullCalendar에서 마감일 미만까지 일정을 추가하므로 마감일도 포함하기 위해 마감일에 +1을 해준다
					// 1. timestamp -> LocalDateTime으로 변경
					LocalDateTime calEndDatePlus = storeCalendar.get(e).getCalendarEndDate().toLocalDateTime();
					// 마감일에 1일을 더해준다
					calEndDatePlus = calEndDatePlus.plusDays(1);
					// 1일이 더해진 마감일을 문자열로 변형
					calEndDate = calEndDatePlus.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
				}
				
				// 요일(시작일)
				String calStartDayOfWeek = new SimpleDateFormat("E요일").format(storeCalendar.get(e).getCalendarStartDate());
				// 일(시작일)
				String calStartDay = new SimpleDateFormat("dd일").format(storeCalendar.get(e).getCalendarStartDate());
				// 오전/오후 시:분 (시작일)
				String calStartHour = new SimpleDateFormat("a hh:mm").format(storeCalendar.get(e).getCalendarStartDate());
				
				// 참가일정 마감일
				String calendarJoinEndDate;
				// 참가일정 마감일이 null인경우 판별 -> 빈문자열 변경
				if(storeCalendar.get(e).getCalendarJoinEndDate() == null) {
					calendarJoinEndDate = "noTime";
				} else {
					// sql.Date 객체를 문자열로 변환, 년-월-일
					calendarJoinEndDate = new SimpleDateFormat("yyyy-MM-dd").format(storeCalendar.get(e).getCalendarJoinEndDate());
				}

				
				// 현재 월에 해당하는 일정만 가져오기 위해 판별
				LocalDateTime tempLDT = LocalDateTime.now(); // 현재 시간 가져오기, 변수 재활용
				String nowMonth = tempLDT.format(DateTimeFormatter.ofPattern("MM")); // 현재 월(예-3월,4월..)
				String tempMonth = new SimpleDateFormat("MM").format(storeCalendar.get(e).getCalendarStartDate()); // DB에 저장된 일정의 월
				if(tempMonth.equals(nowMonth)) { // 현재 월에 해당하는 일정만 저장
					temp = new SettingCalendar(storeCalendar.get(e).getBoardNo(), 
							storeCalendar.get(e).getCalendarTitle(), storeCalendar.get(e).getCalendarContent(), 
							storeCalendar.get(e).getCalendarLocation(), calStartDate, calStartDay, calStartDayOfWeek, calStartHour, calEndDate, 
							storeCalendar.get(e).getCalendarJoin(), calendarJoinEndDate, storeCalendar.get(e).getCalendarJoinLimit(), streetNo);
					setCalList.add(temp);
				}
				
			}
			request.setAttribute("setCalList",setCalList);
			request.setAttribute("citizenStatus", citizenStatus);
			request.setAttribute("street", street);
			// 사이드바 정보 끝
			
			super.postHandle(request, response, handler, modelAndView);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
	}
	
}
