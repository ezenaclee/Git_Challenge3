package com.ezen.develocket.rocketInfo.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.ezen.develocket.rocketInfo.vo.RocketInfoVO;

public interface RocketInfoDAO {

	public int insertRocketInfo(RocketInfoVO rocketInfoVO) throws DataAccessException;

	public RocketInfoVO loginByID(RocketInfoVO rocketInfoVO) throws DataAccessException;

	public List<String> selectAllStarFieldCD(String rocket_cd) throws DataAccessException;

}
