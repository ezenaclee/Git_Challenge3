package com.ezen.develocket.starInfo.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository("starInfoDAO")
public class StarInfoDAOImpl implements StarInfoDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertStarInfo(Map<String, String> starInfoMap) throws DataAccessException {

		sqlSession.insert("mapper.starInfo.insertStarInfo", starInfoMap);
	}

	@Override
	public String selectMaxStarCD() throws DataAccessException {

		String star_cd = sqlSession.selectOne("mapper.starInfo.selectMaxStarCD");

		return star_cd;
	}

	@Override
	public String selectCateCD(String cate_s) throws DataAccessException {

		String cate_cd = sqlSession.selectOne("mapper.starInfo.selectCateCD", cate_s);
		
		System.out.println("11cate_s: " + cate_s);
		System.out.println("cate_cd: " + cate_cd);
		
		return cate_cd;
	}

	@Override
	public String selectStarCD(String rocket_cd) throws DataAccessException {

		String star_cd = sqlSession.selectOne("mapper.starInfo.selectStarCD", rocket_cd);
		
		return star_cd;
	}

}
