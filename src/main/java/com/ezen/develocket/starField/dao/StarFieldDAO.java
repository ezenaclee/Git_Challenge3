package com.ezen.develocket.starField.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.ezen.develocket.starField.vo.CareerImgVO;
import com.ezen.develocket.starField.vo.StarFieldVO;

public interface StarFieldDAO {

	public String insertStarField(Map<String, String> starFieldMap) throws DataAccessException;

	public StarFieldVO selectStarField(String star_field_cd) throws DataAccessException;

	public List<CareerImgVO> selectImageFileList(String star_field_cd) throws DataAccessException;

	public void updateStarField(Map<String, Object> starFieldMap) throws DataAccessException;

	public void updateImageFile(Map<String, Object> starFieldMap) throws DataAccessException;

	public void insertModNewImage(Map<String, Object> starFieldMap) throws DataAccessException;

	public void deleteModImage(CareerImgVO careerImgVO) throws DataAccessException;

}
