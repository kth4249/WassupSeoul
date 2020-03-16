package com.kh.wassupSeoul.street.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.kh.wassupSeoul.member.model.vo.Member;
import com.kh.wassupSeoul.street.model.vo.Board;
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
}
