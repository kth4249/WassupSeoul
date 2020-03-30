
package com.kh.wassupSeoul.street.model.service;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.wassupSeoul.common.vo.PageInfo;
import com.kh.wassupSeoul.friends.model.vo.Relationship;
import com.kh.wassupSeoul.hobby.model.vo.Hobby;
import com.kh.wassupSeoul.member.model.vo.Member;
import com.kh.wassupSeoul.square.model.vo.Alarm;
import com.kh.wassupSeoul.street.model.vo.Bfile;
import com.kh.wassupSeoul.street.model.vo.Board;
import com.kh.wassupSeoul.street.model.vo.Calendar;
import com.kh.wassupSeoul.street.model.vo.Keyword;
import com.kh.wassupSeoul.street.model.vo.Reply;
import com.kh.wassupSeoul.street.model.vo.Report;
import com.kh.wassupSeoul.street.model.vo.Street;
import com.kh.wassupSeoul.street.model.vo.StreetJoin;
import com.kh.wassupSeoul.street.model.vo.Vote;

/**
 * @author user1
 *
 */
@Service
public interface StreetService {

	
	// -------------------------------------------- 중하  ---------------------------------------------
	
	/** 골목 조회용 service
	 * @param streetNo 
	 * @return street
	 * @throws Exception
	 */
	public abstract Street selectStreet(Integer streetNo) throws Exception;
	
	/**  작성자명으로 게시글 검색
	 * @param checkStreet
	 * @return List<Board>
	 * @throws Exception
	 */
	public abstract List<Board> searchBoardwithWriter(Reply checkStreet) throws Exception;

	/** 키워드로 골목 게시글 검색
	 * @param checkStreet
	 * @return List<Board>
	 * @throws Exception
	 */
	public abstract List<Board> searchBoardwithKeyword(Reply checkStreet) throws Exception;
	
	/** 회원 골목 등급 조회
	 * @param checkStreet
	 * @return memGradeInSt
	 * @throws Exception
	 */
	public abstract StreetJoin memGradeInSt(Reply checkStreet) throws Exception;
	
	/** 골목 게시글 조회용 service
	 * @param checkStreet
	 * @return list
	 * @throws Exception
	 */
	public abstract List<Board> selectBoard(Reply checkStreet) throws Exception;


	/** 게시글 등록용 Service
	 * @param board
	 * @return result
	 * @throws Exception
	 */
	public abstract int insertBoard(Board board) throws Exception ;


	/** 좋아요 기록용 Service
	 * @param reply
	 * @return result
	 * @throws Exception
	 */
	public abstract int likeCheck(Reply reply) throws Exception;
	
	/** 댓글 좋아요 기록용 
	 * @param reply
	 * @return result
	 * @throws Exception
	 */
	public abstract int replyLikeFunction(Reply reply) throws Exception;
	
	/** 대댓글 좋아요 등록용 Service
	 * @param reply
	 * @return result
	 * @throws Exception
	 */
	public abstract int reReplyLikeFunction(Reply reply) throws Exception;


	/** 게시글 삭제용 Service
	 * @param postNo
	 * @return result
	 * @throws Exception
	 */
	public abstract int deletePost(int postNo) throws Exception;
	
	/**	댓글 입력용 Service
	 * @param reply
	 * @return result
	 * @throws Exception
	 */
	public abstract int writeComment(Reply reply) throws Exception;
	
	/** 대댓글 입력용 Service
	 * @param reply
	 * @return result
	 * @throws Exception
	 */
	public abstract int writeReComment(Reply reply) throws Exception;
	
	/** 댓글 조회용 
	 * @param checkStreet
	 * @return list
	 */
	public abstract List<Reply> selectReply(Reply checkStreet);
	
	/** 회원 프로필 조회용
	 * @param memberNo
	 * @return member
	 * @throws Exception
	 */
	public abstract Member checkProfile(int memberNo) throws Exception;
	
	/** 지도 게시글 업로드 Service
	 * @param board
	 * @return result
	 * @throws Exception
	 */
	public abstract int mapPost(Board board)throws Exception;
	
	/** 스케치 업로드 Service
	 * @param board
	 * @return result
	 * @throws Exception
	 */
	public abstract int sketchUpload(Board board) throws Exception;
	
	/** 투표 게시글 업로드용 Service
	 * @param board
	 * @param vote 
	 * @param voteOption 
	 * @return result
	 * @throws Exception
	 */
	public abstract int votePost(Board board, Vote vote, String[] voteOption) throws Exception;
	
	/** 투표 선택지 조회용 
	 * @param checkStreet
	 * @return voteList
	 * @throws Exception
	 */
	public abstract List<Vote> selectVoteOption(Reply checkStreet) throws Exception;
	
	/** 투표 기록용 Service
	 * @param vote
	 * @return result
	 * @throws Exception
	 */
	public abstract int recordVote(Vote vote) throws Exception;
	
	
	
	/* 1/N 회원 선택 목록 가져오기 
	 * @param streetNo
	 * @return List<Member>
	 * @throws Exception
	 */
	public abstract List<Member> selectDevideMember(int streetNo) throws Exception;

	// -------------------------------------------- 중하 끝  ---------------------------------------------
	

	/** 골목 가입용 Service
	 * @param map
	 * @return result
	 */
	public abstract int streetJoin(Map<String, Object> map);

	
	
	
	/** 골목 개설 화면 이동용 Service
	 * @param memberNo
	 * @return result
	 * @throws Excepction
	 */
	public abstract int selectMyStreet(int memberNo) throws Exception;

	
	/** 골목 개설용 Service
	 * @param changeCoverName
	 * @param street
	 * @param memberNo
	 * @param streetKeywords
	 * @return result
	 * @throws Exception
	 */
	//public abstract int insertStreet(String changeCoverName, Street street, int memberNo, String[] streetKeywords) throws Exception;


	/** 회원 관심사 조회용 Service (memberMapper에서)
	 * @param memberNo
	 * @return myHobby
	 * @throws Exception
	 */
	public abstract List<Hobby> selectHobby(int memberNo) throws Exception;


	
	/** 추천 친구 리스트 조회용 Service
	 * @param map
	 * @return mList
	 * @throws Exception
	 */
	public abstract List<Member> selectJuminList(Map<String, Object> map) throws Exception;


	/** 회원 가입한 골목 수 조회용 Service
	 * @param memberNo
	 * @return myStreetCount
	 */
	public abstract int myStreetCount(int memberNo);


	/** 추천 친구 주민별 관심사 조회용 Service
	 * @param mList
	 * @return hList
	 * @throws Exception
	 */
	public abstract List<Hobby> selectHobbyList(List<Member> mList) throws Exception;


	/** 관계(친구신청, 친구, 숨김, 차단) 추가용 Service
	 * @param addRelation
	 * @return result
	 */
	public abstract int addRelation(Relationship addRelation);

  
  /** 골목 개설용 Service2
	 * @param changeCoverName
	 * @param street
	 * @param memberNo
	 * @param streetKeywords
	 * @return result
	 * @throws Exception
	 */
	public abstract int insertStreet2(String changeCoverName, Street street, int memberNo, String[] streetKeywords) throws Exception;




	/** 골목 개설용 Service1
	 * @param street
	 * @param memberNo
	 * @param streetKeywords
	 * @return result
	 * @throws Exception
	 */
	public abstract int insertStreet1(Street street, int memberNo, String[] streetKeywords) throws Exception;
  

	
	/** 썸머노트 업로드,DB삽입용
	 * @param board
	 * @param file
	 * @param request
	 * @param response
	 * @return result
	 * @throws Exception
	 */
	public abstract String fileUpload(Board board, MultipartFile file, HttpServletRequest request, int streetNo) throws Exception;

	/*-----------------------------태훈 시작 (03/22) -------------------------------*/
	/** 골목 가입신청 허가용 Service
	 * @param map
	 */
	public abstract void joinCheck(Map<String, Object> map);




	
	/** 골목 가입신청 거절용 Service
	 * @param map
	 */
	public abstract void joinDelete(Map<String, Object> map);


	/** 골목 대장 번호 조회용 Service(알림)
	 * @param streetNo
	 * @return masterNo
	 */
	public abstract int selectMasterNo(int streetNo);


	/** 알람 삽입용 Service(알림)
	 * @param alarm
	 * @return result
	 */
	public abstract int insertAlarm(Alarm alarm);

  
	/** 가입신청 골목 이름 조회용 Service(알림)
	 * @param streetNo
	 * @return streetNm
	 */
	public abstract String selectStreetNm(int streetNo);
	
	

	/** 조회된 주민들과 로그인된 멤버와의 관계 조회용 Service
	 * @param rList
	 * @return rList
	 * @throws Exception
	 */
	public abstract List<Relationship> selectRelationList(Map<String, Object> relationMap) throws Exception;
	
	
	public abstract void removeAlarm(Map<String, Object> map);
	
	
	/** 골목대장 변경 시 골목 가입 신청/수락에 대한 알람 변경
	 * @param masterNo
	 * @param newNo
	 * @return result
	 */
	public abstract int updateAlarm(int masterNo, Integer newNo);
	
	
	/** 골목 주민 추방용
	 * @param map
	 */
	public abstract void exileJumin(Map<String, Integer> map) throws Exception;

	/*--------------------------------태훈 끝-------------------------------------*/
	
	
	
	/* 지원 골목 수정 시작 */
	
	/** 골목 수정 이미지 조회용 Service
	 * @param imgNo
	 * @return imgUrl
	 * @throws Exception
	 */
	public abstract String selectImageUrl(int imgNo) throws Exception;


	/** 골목 수정 키워드 조회용 Service
	 * @param no
	 * @return kList
	 * @throws Exception
	 */
	public abstract List<Keyword> selectKeywords(Integer no) throws Exception;


	/** 골목 수정용 Service1
	 * @param street
	 * @param streetKeywords
	 * @return result
	 * @throws Exception
	 */
	public abstract int updateStreet1(Street street, String[] streetKeywords) throws Exception;


	/** 골목 수정용 Service2
	 * @param street
	 * @param streetKeywords
	 * @param changeCoverName
	 * @return result
	 * @throws Exception
	 */
	public abstract int updateStreet2(Street street, String[] streetKeywords, String changeCoverName) throws Exception;
	
	
	
	
	
	
	
	
	/* 지원 골목 수정 끝 */
/*------------------------ 정승환 추가코드 시작-----------------------------------*/
	
	/** 현재 골목 주민수 조회용 Service
	 * @param streetNo
	 * @return citizenCount
	 * @throws Exception
	 */
	public abstract int selectCitizenCount(int streetNo) throws Exception;

	
	/** 현재 골목 골목대장 닉네임 조회용 Service
	 * @param streetNo
	 * @return streetMasterNm
	 * @throws Exception
	 */
	public abstract String selectStreetMasterNm(int streetNo) throws Exception;
	
	/** 골목 키워드 조회용 Service
	 * @param streetNo
	 * @return keyword
	 * @throws Exception
	 */
	public abstract List<Keyword> selectMyKeyword(int streetNo) throws Exception;


	/** 현재 골목 등급 조회용 Service
	 * @param streetPoint
	 * @return badgeUrl
	 * @throws Exception
	 */
	public abstract String selectBadgeUrl(int streetNo, int streetPoint) throws Exception;


	/** 로그인 회원 골목 등급 조회용 Service
	 * @param memberNo
	 * @param streetNo
	 * @return citizenGrade
	 * @throws Exception
	 */
	public abstract String selectCitizenGrade(int memberNo, int streetNo) throws Exception;


	/** 골목 썸네일 조회용 Service
	 * @param imgNo
	 * @return imgUrl
	 * @throws Exception
	 */
	public abstract String selectImgUrl(int imgNo) throws Exception;

	
	/** 게시판 번호 조회용 Serivce
	 * @return boardNo
	 * @throws Exception
	 */
	public abstract int selectBoardNo() throws Exception;
		
	/** 일정 등록용 Serivce
	 * @param sendCalendar
	 * @return result
	 * @throws Exception
	 */
	public abstract int addSchedule(Calendar sendCalendar) throws Exception;

	/** 일정 관련 게시글 등록용 Service
	 * @param board
	 * @return result
	 * @throws Exception
	 */
	public abstract int insertCalendarBoard(Board board) throws Exception;

	
/*------------------------ 정승환 추가코드 끝-----------------------------------*/
	
	/******************** 지원 골목 삭제 시작 ********************************/
	/** 골목 삭제용 Service
	 * @param no
	 * @return result
	 * @throws Exception
	 */
	public abstract int deleteStreet(int streetNo) throws Exception;

	/** 주민 검색용 Service
	 * @param juminNickName
	 * @return jumin
	 * @throws Exception
	 */
	public abstract Member searchJumin(String juminNickName, int streetNo) throws Exception;
	
	
	/** 골목대장 존재 여부 확인용 Service
	 * @param memberNo
	 * @return result
	 * @throws Exception
	 */
	public abstract int selectStreetMaster(int memberNo) throws Exception;
	
	/** 골목 대장 위임용 Service
	 * @param newNo
	 * @param no
	 * @param original
	 * @return result
	 * @throws Exception
	 */
	public abstract int yesMaster(Integer newNo, int streetNo, int original) throws Exception;
	
	/******************** 지원 골목 삭제 끝 ********************************/
	/** 일정 조회용 Service
	 * @param streetNo
	 * @return storeCalendar
	 * @throws Exception
	 */
	public abstract List<Calendar> selectStoreCalendar(int streetNo) throws Exception;
	
	
	/** 일정 삭제용 Service
	 * @param temp 
	 * @return result
	 * @throws Exception
	 */
	public abstract int deleteSchedule(Calendar temp) throws Exception;
	

	/** 일정 게시글 삭제용 Service
	 * @param boardNo
	 * @return result
	 * @throws Exception
	 */
	public abstract int deleteBoardCalendar(int boardNo) throws Exception;
	
	/** 일정 게시글 참여인원수 조회용 Service
	 * @param boardNo
	 * @return count
	 * @throws Exception
	 */
	public abstract int selectJoinCalendar(int boardNo) throws Exception;
	
	
	/** 일정 게시글 참여인원 목록 삭제용 Service
	 * @param boardNo
	 * @return result
	 * @throws Exception
	 */
	public abstract int deleteJoinCalendar(int boardNo) throws Exception;
	
	/** 해당 글번호에 해당하는 참여인원 회원번호 조회용 Service
	 * @param boardNo
	 * @return joinList
	 * @throws Exception
	 */
	public abstract List<Board> selectCalMemNo(int boardNo) throws Exception;
	
	/** 참가일정 참여 인원 회원정보 조회용 Service
	 * @param memberNo
	 * @return member
	 * @throws Exception
	 */
	public abstract Member selectJoinMember(int memberNo) throws Exception;
	
	/** 일정 참여인원 삽입용 Service
	 * @param temp
	 * @return result
	 * @throws Exception
	 */
	public abstract int insertCalendarMember(Board temp) throws Exception;
	
	/** 일정 참여인원 삭제용 Service
	 * @param temp
	 * @return result
	 * @throws Exception
	 */
	public abstract int deleteCalendarMember(Board temp) throws Exception;
	
	/*------------------------ 정승환 추가코드(20.03.27) 시작-----------------------------------*/
	
	/** 골목대장 회원번호 조회용 Service
	 * @param streetNo
	 * @return memberNo
	 * @throws Exception
	 */
	public abstract int selectStreetMasterNo(int streetNo) throws Exception;
	
	/** 일정 수정 모달창 일정 정보 조회용 Service
	 * @param boardNo
	 * @return calendar
	 * @throws Exception
	 */
	public abstract Calendar selectCalendarInfo(int boardNo) throws Exception;
	
	/** 일정 게시글 수정용 Service
	 * @param updateCalendarBoard
	 * @return result
	 * @throws Exception
	 */
	public abstract int updateCalendarBoard(Board updateCalendarBoard) throws Exception;
	
	/** 일정 수정용 Service
	 * @param updateCal
	 * @return result
	 * @throws Exception
	 */
	public abstract int updateSchedule(Calendar updateCal) throws Exception;
	

	/*------------------------ 정승환 추가코드(20.03.27) 시작-----------------------------------*/
	
/*------------------------ 정승환 추가코드 끝-----------------------------------*/
	
	
	/*==========================3/25 미현 코드 추가 시작 =======================*/
	/** 썸머노트 수정용 service
	 * @param board
	 * @param file
	 * @param savePath
	 * @return result
	 * @throws Exception
	 */
	public abstract int updateSummer(Board board, MultipartFile file, String savePath) throws Exception;
	/*==========================3/25 미현 코드 추가 끝=======================*/

	/*==============================3/26 미현 코드 추가 시작=============================*/
	
	/** 사진첩 목록 조회용
	 * @param pInf 
	 * @param streetNo 
	 * @return list
	 * @throws Exception
	 */
	public abstract List<String> selectPtList(int streetNo, PageInfo pInf) throws Exception;


	/*==============================3/26 미현 코드 추가 끝=============================*/
	
	/*============================== 지원 활동 보고서 시작=============================*/
	
	/** 활동보고서 제출용 Service
	 * @param report
	 * @return result
	 * @throws Exception
	 */
	public abstract int sendReport(Report report) throws Exception;

	/** 사진첩 게시글 수 조회용 Service
	 * @param streetNo 
	 * @return listCount
	 */
	public abstract int getListCount(int streetNo);

	

	

	
	
	/*============================== 지원 활동 보고서 시작=============================*/
}
