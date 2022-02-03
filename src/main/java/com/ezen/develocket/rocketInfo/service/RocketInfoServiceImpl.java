package com.ezen.develocket.rocketInfo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ezen.develocket.rocketInfo.dao.RocketInfoDAO;
import com.ezen.develocket.rocketInfo.vo.RocketInfoVO;

@Service("rocketInfoService")
@Transactional(propagation = Propagation.REQUIRED)
public class RocketInfoServiceImpl implements RocketInfoService {

	@Autowired
	private RocketInfoDAO rocketInfoDAO;
	
	@Override
	public int joinRocketInfo(RocketInfoVO rocketInfoVO) throws DataAccessException {

		return rocketInfoDAO.insertRocketInfo(rocketInfoVO);
	}

	@Override
	public RocketInfoVO loginRocket(RocketInfoVO rocketInfoVO) throws DataAccessException {

		return rocketInfoDAO.loginByID(rocketInfoVO);
	}

	@Override
	public List<String> selectAllStarFieldCD(String rocket_cd) throws DataAccessException {

		return rocketInfoDAO.selectAllStarFieldCD(rocket_cd);
	}

}