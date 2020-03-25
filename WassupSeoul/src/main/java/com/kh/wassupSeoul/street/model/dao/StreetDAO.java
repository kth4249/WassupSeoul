
package com.kh.wassupSeoul.street.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.kh.wassupSeoul.friends.model.vo.Relationship;
import com.kh.wassupSeoul.hobby.model.vo.Hobby;
import com.kh.wassupSeoul.member.model.vo.Member;
import com.kh.wassupSeoul.square.model.vo.Alarm;
import com.kh.wassupSeoul.street.model.vo.Board;
import com.kh.wassupSeoul.street.model.vo.Calendar;
import com.kh.wassupSeoul.street.model.vo.Keyword;
import com.kh.wassupSeoul.street.model.vo.Reply;
import com.kh.wassupSeoul.street.model.vo.Street;
import com.kh.wassupSeoul.street.model.vo.StreetJoin;

/**
 * @author user1
 *
 */
/**
 * @author user1
 *
 */
@Repository
public class StreetDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// -------------------------------------------- 중하
	// ---------------------------------------------

	/**
	 * 골목 조회용 DAO
	 * 
	 * @param streetNo
	 * @return street
	 * @throws Exception
	 */
	public Street selectStreet(Integer streetNo) throws Exception {
		return sqlSession.selectOne("streetMapper.selectStreet", streetNo);
	}

	/**
	 * 회원 골목 등급 조회
	 * 
	 * @param checkStreet
	 * @return memGradeInSt
	 * @throws Exception
	 */
	public StreetJoin memGradeInSt(Reply checkStreet) throws Exception {
		return sqlSession.selectOne("streetMapper.memGradeInSt", checkStreet);
	}

	/**
	 * 게시글 조회용 DAO
	 * 
	 * @param checkStreet
	 * @return list
	 * @throws Exception
	 */
	public List<Board> selectBoard(Reply checkStreet) throws Exception {
		return sqlSession.selectList("streetMapper.selectBoardList", checkStreet);
	}

	/**
	 * 게시글 등록용 DAO
	 * 
	 * @param board
	 * @return result
	 * @throws Exception
	 */
	public int insertBoard(Board board) throws Exception {
		return sqlSession.insert("streetMapper.insertBoard", board);
	}

	/**
	 * 좋아요 체크용 DAO
	 * 
	 * @param reply
	 * @return result
	 * @throws Exception
	 */
	public String likeCheck(Reply reply) throws Exception {
		return sqlSession.selectOne("streetMapper.likeCheck", reply);
	}

	/**
	 * 좋아요 기록용 DAO
	 * 
	 * @param reply
	 * @return result
	 * @throws Exception
	 */
	public int recordLike(Reply reply) throws Exception {

		return sqlSession.insert("streetMapper.recordLike", reply);
	}

	/**
	 * 좋아요 업데이트용 DAO
	 * 
	 * @param reply
	 * @return result
	 * @throws Exception
	 */
	public int updateLike(Reply reply) throws Exception {
		return sqlSession.update("streetMapper.updateLike", reply);
	}

	/**
	 * 댓글 좋아요 체크용 DAO
	 * 
	 * @param reply
	 * @return result
	 * @throws Exception
	 */
	public String replyLikeFunction(Reply reply) throws Exception {
		return sqlSession.selectOne("streetMapper.replyLikeCheck", reply);
	}

	/**
	 * 댓글 좋아요 기록용 DAO
	 * 
	 * @param reply
	 * @return result
	 * @throws Exception
	 */
	public int recordReplyLike(Reply reply) throws Exception {
		return sqlSession.insert("streetMapper.recordReplyLike", reply);
	}

	/**
	 * 댓글 좋아요 업데이트용 DAO
	 * 
	 * @param reply
	 * @return result
	 * @throws Exception
	 */
	public int updateReplyLike(Reply reply) throws Exception {
		return sqlSession.update("streetMapper.updateReplyLike", reply);
	}

	/**
	 * 대댓글 좋아요 체크용 DAO
	 * 
	 * @param reply
	 * @return result
	 * @throws Exception
	 */
	public String reReplyLikeFunction(Reply reply) throws Exception {
		return sqlSession.selectOne("streetMapper.reReplyLikeFunction", reply);
	}

	/**
	 * 대댓글 좋아요 기록용 DAO
	 * 
	 * @param reply
	 * @return result
	 * @throws Exception
	 */
	public int recordReReplyLike(Reply reply) throws Exception {
		return sqlSession.insert("streetMapper.recordReReplyLike", reply);
	}

	/**
	 * 대댓글 좋아요 없데이트용 DAO
	 * 
	 * @param reply
	 * @return result
	 * @throws Exception
	 */
	public int updateReReplyLike(Reply reply) throws Exception {
		return sqlSession.update("streetMapper.updateReReplyLike", reply);
	}

	/**
	 * 게시글 삭제용 DAO
	 * 
	 * @param postNo
	 * @return result
	 * @throws Exception
	 */
	public int deletePost(int postNo) throws Exception {
		return sqlSession.update("streetMapper.deletePost", postNo);
	}

	/**
	 * 댓글 입력용 DAO
	 * 
	 * @param reply
	 * @return result
	 * @throws Exception
	 */
	public int writeComment(Reply reply) throws Exception {
		return sqlSession.insert("streetMapper.writeComment", reply);
	}

	/**
	 * 대댓글 입력용 DAO
	 * 
	 * @param reply
	 * @return result
	 * @throws Exception
	 */
	public int writeReComment(Reply reply) throws Exception {
		return sqlSession.insert("streetMapper.writeReComment", reply);
	}

	/**
	 * 댓글 조회용
	 * 
	 * @param checkStreet
	 * @return list
	 */
	public List<Reply> selectReply(Reply checkStreet) {
		return sqlSession.selectList("streetMapper.selectReply", checkStreet);
	}

	/**
	 * 작성자 프로필 조회용 DAO (memberMapper 이용)
	 * 
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public Member checkProfile(int memberNo) throws Exception {
		return sqlSession.selectOne("memberMapper.selectProfileMember", memberNo);
	}

	/**
	 * 지도 게시글 등록용 DAO
	 * 
	 * @param board
	 * @return result
	 * @throws Exception
	 */
	public int mapPost(Board board) throws Exception {
		return sqlSession.insert("streetMapper.mapPost", board);
	}

	// -------------------------------------------- 중하 끝
	// ---------------------------------------------

	/**
	 * 골목 가입용 DAO
	 * 
	 * @param map
	 * @return result
	 */
	public int streetJoin(Map<String, Object> map) {
		return sqlSession.insert("streetMapper.streetJoin", map);
	}

	/**
	 * 회원 관심사 조회용 DAO
	 * 
	 * @param memberNo
	 * @return myHobby
	 * @throws Exception
	 */
	public List<Hobby> selectHobby(int memberNo) throws Exception {
		return sqlSession.selectList("memberMapper.selectHobby", memberNo);
	}

	/**
	 * 추천 친구 목록 조회용 DAO
	 * 
	 * @param map
	 * @return mList
	 * @throws Exception
	 */
	public List<Member> selectJuminList(Map<String, Object> map) throws Exception {
		return sqlSession.selectList("streetMapper.selectJuminList", map);
	}

	/**
	 * 가입한 골목 수 조회용 Service
	 * 
	 * @param memberNo
	 * @return myStreetCount
	 */
	public int myStreetCount(int memberNo) {
		return sqlSession.selectOne("streetMapper.myStreetCount", memberNo);
	}

	/**
	 * @param mList
	 * @return
	 * @throws Exception
	 */
	public List<Hobby> selectHobbyList(List<Member> mList) throws Exception {
		return sqlSession.selectList("streetMapper.selectHobbyList", mList);
	}

	/**
	 * 골목커버 다음 번호 조회용 DAO
	 * 
	 * @return imgNo
	 * @throws Exception
	 */
	public int selectCoverNextNo() throws Exception {

		return sqlSession.selectOne("streetMapper.selectCoverNextNo");
	}

	/**
	 * 골목커버 등록용 DAO
	 * 
	 * @param changeCoverName
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	public int insertStreetCover(Map<String, Object> map) throws Exception {

		return sqlSession.insert("streetMapper.insertStreetCover", map);

	}

	/**
	 * 골목 개설 화면 이동 조건1 조회용 DAO
	 * 
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public int selectMyStreet(int memberNo) throws Exception {

		return sqlSession.selectOne("streetMapper.selectMyStreet", memberNo);
	}

	/**
	 * 골목 개설 화면 이동 조건2 조회용 DAO
	 * 
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public int selectStreetMaster(int memberNo) throws Exception {

		return sqlSession.selectOne("streetMapper.selectStreetMaster", memberNo);
	}

	/**
	 * 골목 다음 번호 조회용 DAO
	 * 
	 * @return streetNo
	 * @throws Exception
	 */
	public int selectStreetNextNo() throws Exception {

		return sqlSession.selectOne("streetMapper.selectStreetNextNo");
	}

	/**
	 * 골목 정보 삽입용 DAO
	 * 
	 * @param street
	 * @return result
	 * @throws Exception
	 */
	public int insertStreet(Street street) throws Exception {

		return sqlSession.insert("streetMapper.insertStreet", street);
	}

	/**
	 * 골목대장 정보 삽입용 DAO
	 * 
	 * @param map
	 * @return result
	 * @throws Exception
	 */
	public int insertStreetMaster(Map<String, Object> map) throws Exception {

		return sqlSession.insert("streetMapper.insertStreetMaster", map);
	}

	/**
	 * 골목 키워드 삽입용 DAO
	 * 
	 * @param map
	 * @return result
	 * @throws Exception
	 */
	public int insertStreetKeyword(Map<String, Object> map2) throws Exception {

		return sqlSession.insert("streetMapper.insertStreetKeyword", map2);
	}

	/**
	 * 관계(친구신청, 친구, 숨김, 차단) 추가용 Service
	 * 
	 * @param addRelation
	 * @return result
	 */
	public int addRelation(Relationship addRelation) {
		return sqlSession.insert("friendsMapper.addRelation", addRelation);
	}

	/*-------------------------------태훈 시작 (03/22) -----------------------------*/
	/**
	 * 골목 가입신청 허가용 DAO
	 * 
	 * @param map
	 */
	public void joinCheck(Map<String, Object> map) {
		sqlSession.update("streetMapper.joinCheck", map);
	}

	/**
	 * 골목 가입신청 거절용 DAO
	 * 
	 * @param map
	 */
	public void joinDelete(Map<String, Object> map) {
		sqlSession.delete("streetMapper.joinDelete", map);
	}

	/**
	 * 골목대장 번호 조외용 DAO
	 * 
	 * @param streetNo
	 * @return
	 */
	public int selectMasterNo(int streetNo) {
		return sqlSession.selectOne("streetMapper.selectMasterNo", streetNo);
	}

	/**
	 * 가입신청 알람 삽입용 DAO
	 * 
	 * @param alarm
	 * @return
	 */
	public int insertAlarm(Alarm alarm) {
		return sqlSession.insert("memberMapper.insertAlarm", alarm);
	}

	/**
	 * 가입신청 골목 이름 조회용 DAO
	 * 
	 * @param streetNo
	 * @return streetNo
	 */
	public String selectStreetNm(int streetNo) {
		return sqlSession.selectOne("streetMapper.selectStreetNm", streetNo);
	}

	/*--------------------------------태훈 끝-------------------------------------*/

	/* 지원 골목 수정 시작 */
	/**
	 * 골목 수정 이미지 조회용 DAO
	 * 
	 * @param imgNo
	 * @return imgUrl
	 * @throws Exception
	 */
	public String selectImageUrl(int imgNo) throws Exception {

		return sqlSession.selectOne("streetMapper.selectImageUrl", imgNo);
	}

	/**
	 * 골목 수정 키워드 조회용 DAO
	 * 
	 * @param no
	 * @return kList
	 * @throws Exception
	 */
	public List<Keyword> selectKeywords(Integer no) throws Exception {

		return sqlSession.selectList("streetMapper.selectKeywords", no);
	}

	/**
	 * 골목 수정용 DAO
	 * 
	 * @param street
	 * @return result
	 * @throws Exception
	 */
	public int updateStreet(Street street) throws Exception {

		return sqlSession.update("streetMapper.updateStreet", street);
	}

	/**
	 * 기존 키워드 삭제용 DAO
	 * 
	 * @param streetNo
	 * @return result
	 * @throws Exception
	 */
	public int deleteStreetKeyword(int streetNo) throws Exception {

		return sqlSession.delete("streetMapper.deleteStreetKeyword", streetNo);
	}

	/* 지원 골목 수정 끝 */
	/*----------------------미현 시작 (3/23)----------------------------------------*/

	/**
	 * 썸머노트 이미지도 DB삽입용 DAO
	 * 
	 * @param filepath
	 * @return result
	 */
	public int fileUpload(String filepath) throws Exception {
		return sqlSession.insert("streetMapper.fileUpload", filepath);
	}

	/*-----------------------미현 끝-------------------------------------------*/

	/*------------------------ 정승환 추가코드 시작-----------------------------------*/

	/**
	 * 현재 골목 주민 수 조회용 DAO
	 * 
	 * @param streetNo
	 * @return citizenCount
	 * @throws Exception
	 */
	public int selectCitizenCount(int streetNo) throws Exception {
		return sqlSession.selectOne("streetMapper.selectCitizenCount", streetNo);
	}

	/**
	 * 현재 골목대장 닉네임 조회용 DAO
	 * 
	 * @param streetNo
	 * @return
	 * @throws Exception
	 */
	public String selectStreetMasterNm(int streetNo) throws Exception {
		return sqlSession.selectOne("streetMapper.selectStreetMasterNm", streetNo);
	}

	/**
	 * 골목 키워드 조회용 DAO
	 * 
	 * @param streetNo
	 * @return keyword
	 * @throws Exception
	 */
	public List<Keyword> selecyMyKeyword(int streetNo) throws Exception {
		return sqlSession.selectList("streetMapper.selectMyKeyword", streetNo);
	}

	/**
	 * 현재 골목 등급 조회용 DAO
	 * 
	 * @param streetPoint
	 * @return badgeUrl
	 * @throws Exception
	 */
	public String selectBadgeUrl(int streetNo, int streetPoint) throws Exception {
		Street temp = new Street();
		temp.setStreetNo(streetNo);
		temp.setStreetPoint(streetPoint);
		return sqlSession.selectOne("streetMapper.selectBadgeUrl", temp);
	}

	/**
	 * 로그인 회원 골목 등급 조회용 DAO
	 * 
	 * @param memberNo
	 * @param streetNo
	 * @return citizenGrade
	 * @throws Exception
	 */
	public String selectCitizenGrade(int memberNo, int streetNo) throws Exception {
		HashMap<String, Integer> temp = new HashMap<String, Integer>();
		temp.put("memberNo", memberNo);
		temp.put("streetNo", streetNo);
		return sqlSession.selectOne("streetMapper.selectCitizenGrade", temp);
	}

	/**
	 * 골목 썸네일 조회용 DAO
	 * 
	 * @param imgNo
	 * @return imgUrl
	 * @throws Exception
	 */
	public String selectImgUrl(int imgNo) throws Exception {
		return sqlSession.selectOne("streetMapper.selectImgUrl", imgNo);
	}

	/**
	 * 게시판 번호 조회용 DAO
	 * 
	 * @return boardNo
	 * @throws Exception
	 */
	public int selectBoardNo() throws Exception {
		return sqlSession.selectOne("streetMapper.selectBoardNo");
	}

	/**
	 * 일정 등록용 DAO
	 * 
	 * @param sendCalendar
	 * @return result
	 * @throws Exception
	 */
	public int addSchedule(Calendar sendCalendar) throws Exception {
		return sqlSession.insert("streetMapper.addSchedule", sendCalendar);
	}

	/**
	 * 일정 관련 게시글 등록용 DAO
	 * 
	 * @param board
	 * @return result
	 * @throws Exception
	 */
	public int insertCalendarBoard(Board board) throws Exception {
		return sqlSession.insert("streetMapper.insertCalendarBoard", board);
	}

	/* ==========================3/25 미현 시작 ========================== */
	/*	*//**
			 * 기존 게시글 괜히한번 불러와보기 DAO
			 * 
			 * @param boardNo
			 * @return
			 *//*
				 * public String selectFiles(int boardNo) throws Exception{ return
				 * sqlSession.selectOne("streetMapper.selectSummer",boardNo); }
				 */

	/**
	 * @param board
	 * @return
	 */
	public int updateSummer(Board board) throws Exception {
		return sqlSession.update("streetMapper.updateSummmer", board);
	}

	/* ==========================3/25 미현 끝 ========================== */

	/*------------------------ 정승환 추가코드 -----------------------------------*/
}
