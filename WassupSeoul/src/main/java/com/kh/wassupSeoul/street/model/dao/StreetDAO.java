
package com.kh.wassupSeoul.street.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.wassupSeoul.hobby.model.vo.Hobby;
import com.kh.wassupSeoul.member.model.vo.Member;
import com.kh.wassupSeoul.street.model.vo.Board;
import com.kh.wassupSeoul.street.model.vo.Count;
import com.kh.wassupSeoul.street.model.vo.Reply;
import com.kh.wassupSeoul.street.model.vo.Street;

@Repository
public class StreetDAO {

	@Autowired	
	private SqlSessionTemplate sqlSession;

	/** 골목 조회용 DAO
	 * @param streetNo
	 * @return street
	 * @throws Exception
	 */
	public Street selectStreet(Integer streetNo) throws Exception{
		return sqlSession.selectOne("streetMapper.selectStreet", streetNo );
	}

	/** 게시글 조회용 DAO
	 * @param streetNo
	 * @return list
	 * @throws Exception
	 */
	public List<Board> selectBoard(Integer streetNo) throws Exception{
		return sqlSession.selectList("streetMapper.selectBoardList", streetNo );
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
	 * @param loginMember
	 * @return result
	 * @throws Exception
	 */
	public String likeCheck(Member loginMember) throws Exception {
		return sqlSession.selectOne("streetMapper.likeCheck", loginMember );
	}

	/** 좋아요 기록용 DAO
	 * @param loginMember
	 * @return result
	 * @throws Exception
	 */
	public int recordLike(Member loginMember) throws Exception {
		
		return sqlSession.insert("streetMapper.recordLike", loginMember );
	}

	/** 좋아요 업데이트용 DAO
	 * @param loginMember
	 * @return result
	 * @throws Exception
	 */
	public int updateLike(Member loginMember) throws Exception {
		return sqlSession.update("streetMapper.updateLike", loginMember );
	}

	/** 좋아요, 댓글수 조회용 DAO
	 * @param postNo
	 * @return 
	 * @throws Exception
	 */
	public int[] checkLikeReplyNum(int postNo) throws Exception{
		return sqlSession.selectOne("streetMapper.checkLikeReplyNum", postNo );
	}

	/** 게시글 삭제용 DAO
	 * @param postNo
	 * @return result
	 * @throws Exception
	 */
	public int deletePost(int postNo) throws Exception{
		return sqlSession.update("streetMapper.deletePost", postNo );
	}





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
	public List<Member> selectRecommendList(Map<String, Object> map) throws Exception{
		return sqlSession.selectList("streetMapper.selectRecommendList", map);
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
	public int insertStreetCover(String changeCoverName) throws Exception {
		
		return sqlSession.insert("streetMapper.insertStreetCover", changeCoverName);
		
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
	public int insertStreet(Street street) throws Exception {
		
		return sqlSession.insert("streetMapper.insertStreet", street);
	}

	/** 골목대장 정보 삽입용 DAO
	 * @param map
	 * @return result
	 * @throws Exception
	 */
	public int insertStreetMaster(Map<String, Object> map) throws Exception {
		
		return sqlSession.insert("streetMapper.insertStreetMaster", map);
	}

	/** 골목 키워드 삽입용 DAO
	 * @param map
	 * @return result
	 * @throws Exception
	 */
	public int insertStreetKeyword(Map<String, Object> map) throws Exception {
		
		return sqlSession.insert("streetMapper.insertStreetKeyword", map);
	}


	
	
	/** 댓글 입력용 DAO
	 * @param reply
	 * @return result
	 * @throws Exception
	 */
	public int writeComment(Reply reply) throws Exception{
		return sqlSession.insert("streetMapper.writeComment", reply);
	}

	/** 좋아요 개수 조회용 
	 * @param streetNo
	 * @return result
	 * @throws Exception
	 */
	public List<Count> thumbCount(Integer streetNo) throws Exception{
		return sqlSession.selectOne("streetMapper.thumbCount", streetNo);
	}

	/** 댓글 개수 조회용 
	 * @param streetNo
	 * @return result 
	 * @throws Exception
	 */
	public List<Count> replyCount(Integer streetNo) throws Exception{
		return sqlSession.selectOne("streetMapper.replyCount", streetNo);
	}

	/** 댓글 조회용 
	 * @param postNo
	 * @return list 
	 */
	public List<Reply> selectReply(int postNo) {
		return sqlSession.selectList("streetMapper.selectReply", postNo);
	}


}
