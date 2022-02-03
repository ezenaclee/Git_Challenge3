package com.ezen.develocket.starField.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.ezen.develocket.starField.vo.CareerImgVO;

public interface StarFieldService {

	public String joinStarField(Map<String, String> starFieldMap) throws DataAccessException;

	public Map<String, Object> viewStarField(String star_field_cd) throws DataAccessException;

	public List<CareerImgVO> selectImageFileList(String star_field_cd) throws DataAccessException;

	public void modifyStarField(Map<String, Object> starFieldMap) throws DataAccessException;

	public void removeModImage(CareerImgVO careerImgVO) throws DataAccessException;

}
