package com.ezen.develocket.starInfo.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

public interface StarInfoDAO {

	public void insertStarInfo(Map<String, String> starInfoMap) throws DataAccessException;

	public String selectMaxStarCD() throws DataAccessException;
	
	public String selectCateCD(String small_category) throws DataAccessException;

	public String selectStarCD(String rocket_cd) throws DataAccessException;
}
