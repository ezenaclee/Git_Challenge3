package com.ezen.develocket.rocketInfo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.ezen.develocket.rocketInfo.vo.RocketInfoVO;

@Repository("rocketInfoDAO")
public class RocketInfoDAOImpl implements RocketInfoDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertRocketInfo(RocketInfoVO rocketInfoVO) throws DataAccessException {

		int result = sqlSession.insert("mapper.rocketInfo.insertRocketInfo", rocketInfoVO);
		
		return result;
	}

	@Override
	public RocketInfoVO loginByID(RocketInfoVO rocketInfoVO) {

		RocketInfoVO vo = sqlSession.selectOne("mapper.rocketInfo.loginByID", rocketInfoVO);

		return vo;
	}

	@Override
	public List<String> selectAllStarFieldCD(String rocket_cd) throws DataAccessException {

		List<String> starFieldCDList = sqlSession.selectList("mapper.rocketInfo.selectAllStarFieldCD", rocket_cd);
		
		return starFieldCDList;
	}

}
