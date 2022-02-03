package com.ezen.develocket.rocketInfo.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.ezen.develocket.rocketInfo.vo.RocketInfoVO;

public interface RocketInfoService {

	public int joinRocketInfo(RocketInfoVO rocketInfoVO) throws DataAccessException;

	public RocketInfoVO loginRocket(RocketInfoVO rocketInfoVO) throws DataAccessException;

	public List<String> selectAllStarFieldCD(String rocket_cd) throws DataAccessException;
}
