package com.ezen.develocket.starInfo.service;

import java.util.Map;

import org.springframework.dao.DataAccessException;

public interface StarInfoService {

	public Map<String, String> joinStarInfo(Map<String, String> starInfoMap) throws DataAccessException;

	public String matchStarCD(String rocket_cd) throws DataAccessException;

	public String selectCateCD(String cate_s) throws DataAccessException;

}
