package com.ezen.develocket.starInfo.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ezen.develocket.starInfo.dao.StarInfoDAO;

@Service("starInfoService")
@Transactional(propagation = Propagation.REQUIRED)
public class StarInfoServiceImpl implements StarInfoService {

	@Autowired
	StarInfoDAO starInfoDAO;
	
	@Override
	public Map<String, String> joinStarInfo(Map<String, String> starInfoMap) throws DataAccessException {

		String small_category = starInfoMap.get("small_category");
		starInfoMap.remove("small_category");
		
		String cate_cd = starInfoDAO.selectCateCD(small_category);
		String star_cd = starInfoDAO.selectMaxStarCD();
		starInfoMap.put("star_cd", star_cd);
		
		starInfoDAO.insertStarInfo(starInfoMap);
		
		Map<String, String> codeMap = new HashMap<>();
		codeMap.put("star_cd", star_cd);
		codeMap.put("cate_cd", cate_cd);
		
		return codeMap;
	}

	@Override
	public String matchStarCD(String rocket_cd) throws DataAccessException {

		String star_cd = starInfoDAO.selectStarCD(rocket_cd);

		return star_cd;
	}

	@Override
	public String selectCateCD(String cate_s) throws DataAccessException {

		String cate_cd = starInfoDAO.selectCateCD(cate_s);

		return cate_cd;
	}

}
