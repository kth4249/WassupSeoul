
package com.kh.wassupSeoul.street.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.kh.wassupSeoul.friends.model.vo.Relationship;
import com.kh.wassupSeoul.hobby.model.vo.Hobby;
import com.kh.wassupSeoul.member.model.vo.Member;
import com.kh.wassupSeoul.street.model.vo.Board;
import com.kh.wassupSeoul.street.model.vo.Reply;
import com.kh.wassupSeoul.street.model.vo.Street;
import com.kh.wassupSeoul.street.model.vo.StreetJoin;

@Repository
public class StreetDAO {

	@Autowired	
	private SqlSessionTemplate sqlSession;

	// -------------------------------------------- 중하   ---------------------------------------------
	
	/** 골목 조회용 DAO
	 * @param streetNo
	 * @return street
	 * @throws Exception
	 */
	public Street selectStreet(Integer streetNo) throws Exception{
		return sqlSession.selectOne("streetMapper.selectStreet", streetNo );
	}

	/** 회원 골목 등급 조회
	 * @param checkStreet
	 * @return memGradeInSt
	 * @throws Exception
	 */
	public StreetJoin memGradeInSt(Reply checkStreet) throws Exception {
		return sqlSession.selectOne("streetMapper.memGradeInSt", checkStreet );
	}
	
	/** 게시글 조회용 DAO
	 * @param checkStreet
	 * @return list
	 * @throws Exception
	 */
	public List<Board> selectBoard(Reply checkStreet) throws Exception{
		return sqlSession.selectList("streetMapper.selectBoardList", checkStreet );
	}

	/** 게시글 등록용 DAO
	 * @param board
	 * @return result
	 * @throws Exception
	 */
	public int insertBoard(Board board) throws Exception {
		return sqlSession.insert("streetMapper.insertBoard", board );
	}

	/** 좋아요 체크용 DAO
	 * @param reply
	 * @return result
	 * @throws Exception
	 */
	public String likeCheck(Reply reply) throws Exception {
		return sqlSession.selectOne("streetMapper.likeCheck", reply );
	}

	/** 좋아요 기록용 DAO
	 * @param reply
	 * @return result
	 * @throws Exception
	 */
	public int recordLike(Reply reply) throws Exception {
		
		return sqlSession.insert("streetMapper.recordLike", reply );
	}

	/** 좋아요 업데이트용 DAO
	 * @param reply
	 * @return result
	 * @throws Exception
	 */
	public int updateLike(Reply reply) throws Exception {
		return sqlSession.update("streetMapper.updateLike", reply );
	}
	
	/** 댓글 좋아요 체크용 DAO 
	 * @param reply
	 * @return result
	 * @throws Exception
	 */
	public String replyLikeFunction(Reply reply) throws Exception {
		return sqlSession.selectOne("streetMapper.replyLikeCheck", reply );
	}
	
	/** 댓글 좋아요 기록용 DAO
	 * @param reply
	 * @return result
	 * @throws Exception
	 */
	public int recordReplyLike(Reply reply) throws Exception{
		return sqlSession.insert("streetMapper.recordReplyLike", reply );
	}
	
	/** 댓글 좋아요 업데이트용  DAO
	 * @param reply
	 * @return result
	 * @throws Exception
	 */
	public int updateReplyLike(Reply reply) throws Exception{
		return sqlSession.update("streetMapper.updateReplyLike", reply );
	}
	
	/** 대댓글 좋아요 체크용 DAO
	 * @param reply
	 * @return result
	 * @throws Exception
	 */
	public String reReplyLikeFunction(Reply reply) throws Exception{
		return sqlSession.selectOne("streetMapper.reReplyLikeFunction", reply );
	}
	
	/** 대댓글 좋아요 기록용 DAO
	 * @param reply
	 * @return result
	 * @throws Exception
	 */
	public int recordReReplyLike(Reply reply) throws Exception{
		return sqlSession.insert("streetMapper.recordReReplyLike", reply );
	}
	
	/** 대댓글 좋아요 없데이트용 DAO
	 * @param reply
	 * @return result
	 * @throws Exception
	 */
	public int updateReReplyLike(Reply reply) throws Exception{
		return  sqlSession.update("streetMapper.updateReReplyLike", reply );
	}


	/** 게시글 삭제용 DAO
	 * @param postNo
	 * @return result
	 * @throws Exception
	 */
	public int deletePost(int postNo) throws Exception{
		return sqlSession.update("streetMapper.deletePost", postNo );
	}
	
	/** 댓글 입력용 DAO
	 * @param reply
	 * @return result
	 * @throws Exception
	 */
	public int writeComment(Reply reply) throws Exception{
		return sqlSession.insert("streetMapper.writeComment", reply);
	}
	
	/** 대댓글 입력용   DAO
	 * @param reply
	 * @return result
	 * @throws Exception
	 */
	public int writeReComment(Reply reply) throws Exception{
		return sqlSession.insert("streetMapper.writeReComment", reply);
	}
	
	/** 댓글 조회용 
	 * @param checkStreet
	 * @return list 
	 */
	public List<Reply> selectReply(Reply checkStreet) {
		return sqlSession.selectList("streetMapper.selectReply", checkStreet);
	}

	/** 작성자 프로필 조회용 DAO   (memberMapper 이용)
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public Member checkProfile(int memberNo) throws Exception{
		return sqlSession.selectOne("memberMapper.selectProfileMember", memberNo);
	}


	// -------------------------------------------- 중하 끝  ---------------------------------------------


	/** 골목 가입용 DAO
	 * @param map
	 * @return result
	 */
	public int streetJoin(Map<String, Object> map) {
		return sqlSession.insert("streetMapper.streetJoin", map);
	}
  

	/** 회원 관심사 조회용 DAO
	 * @param memberNo
	 * @return myHobby
	 * @throws Exception
	 */
	public List<Hobby> selectHobby(int memberNo) throws Exception{
		return sqlSession.selectList("memberMapper.selectHobby", memberNo);
	}

	
	/** 추천 친구 목록 조회용 DAO
	 * @param map
	 * @return mList
	 * @throws Exception
	 */
	public List<Member> selectJuminList(Map<String, Object> map) throws Exception{
		return sqlSession.selectList("streetMapper.selectJuminList", map);
	}

	/** 가입한 골목 수 조회용 Service
	 * @param memberNo
	 * @return myStreetCount
	 */
	public int myStreetCount(int memberNo){
		return sqlSession.selectOne("streetMapper.myStreetCount", memberNo);
	}

	/**
	 * @param mList
	 * @return
	 * @throws Exception
	 */
	public List<Hobby> selectHobbyList(List<Member> mList) throws Exception{
		return sqlSession.selectList("streetMapper.selectHobbyList", mList);
	}


	/** 골목커버 다음 번호 조회용 DAO
	 * @return imgNo
	 * @throws Exception
	 */
	public int selectCoverNextNo() throws Exception {
		
		return sqlSession.selectOne("streetMapper.selectCoverNextNo");
	}

	/** 골목커버 등록용 DAO
	 * @param changeCoverName
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	public int insertStreetCover(Map<String, Object> map) throws Exception {
		
		return sqlSession.insert("streetMapper.insertStreetCover", map);
		
	}

	/** 골목 개설 화면 이동 조건1 조회용 DAO
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public int selectMyStreet(int memberNo) throws Exception {
		
		return sqlSession.selectOne("streetMapper.selectMyStreet", memberNo);
	}
	
	/** 골목 개설 화면 이동 조건2 조회용 DAO
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	public int selectStreetMaster(int memberNo) throws Exception {
		
		return sqlSession.selectOne("streetMapper.selectStreetMaster", memberNo);
	}
	
	
	/** 골목 다음 번호 조회용 DAO
	 * @return streetNo
	 * @throws Exception
	 */
	public int selectStreetNextNo() throws Exception {
		
		return sqlSession.selectOne("streetMapper.selectStreetNextNo");
	}
	
	
	/** 골목 정보 삽입용 DAO
	 * @param street
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	public int insertStreet(Street street) throws Exception {
		
		return sqlSession.insert("streetMapper.insertStreet", street);
	}

	/** 골목대장 정보 삽입용 DAO
	 * @param map
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	public int insertStreetMaster(Map<String, Object> map) throws Exception {
		
		return sqlSession.insert("streetMapper.insertStreetMaster", map);
	}

	/** 골목 키워드 삽입용 DAO
	 * @param map
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	public int insertStreetKeyword(Map<String, Object> map2) throws Exception {
		
		return sqlSession.insert("streetMapper.insertStreetKeyword", map2);
	}


	/** 관계(친구신청, 친구, 숨김, 차단) 추가용 Service
	 * @param addRelation
	 * @return result
	 */
	public int addRelation(Relationship addRelation) {
		return sqlSession.insert("friendsMapper.addRelation", addRelation);
  }


	/*-------------------------------태훈 시작 (03/22) -----------------------------*/
	/** 골목 가입신청 허가용 Service
	 * @param map
	 */
	public void joinCheck(Map<String, Object> map) {
		sqlSession.update("streetMapper.joinCheck", map);
	}
	
	/** 골목 가입신청 거절용 Service
	 * @param map
	 */
	public void joinDelete(Map<String, Object> map) {
		sqlSession.delete("streetMapper.joinDelete", map);
	}

	
	
	/*--------------------------------태훈 끝-------------------------------------*/
}
