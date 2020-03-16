package com.kh.wassupSeoul.street.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

}
