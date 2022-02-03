package com.ezen.develocket.starField.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.ezen.develocket.starField.vo.CareerImgVO;
import com.ezen.develocket.starField.vo.StarFieldVO;

@Repository("StarFieldDAO")
public class StarFieldDAOImpl implements StarFieldDAO {

	@Autowired
	private SqlSession sqlSession;

	
	@Override
	public String insertStarField(Map<String, String> starFieldMap) throws DataAccessException {
		
		String star_field_cd = selectMaxStarFieldCD();
		starFieldMap.put("star_field_cd", star_field_cd);
		
		sqlSession.insert("mapper.starField.insertStarField", starFieldMap);
		
		return star_field_cd;
	}
	
	public String selectMaxStarFieldCD() throws DataAccessException {
		
		String star_field_cd = sqlSession.selectOne("mapper.starField.selectMaxStarFieldCD");
		
		return star_field_cd;
	}

	@Override
	public StarFieldVO selectStarField(String star_field_cd) {

		StarFieldVO starFieldVO = sqlSession.selectOne("mapper.starField.selectStarField", star_field_cd);
		
		return starFieldVO;
	}

	@Override
	public List<CareerImgVO> selectImageFileList(String star_field_cd) {

		List<CareerImgVO> imageFileList = sqlSession.selectList("mapper.starField.selectImageFileList", star_field_cd); 
		
		return imageFileList;
	}

	@Override
	public void updateStarField(Map<String, Object> starFieldMap) throws DataAccessException {

		sqlSession.update("mapper.starField.updateStarField", starFieldMap);
		
	}

	@Override
	public void updateImageFile(Map<String, Object> starFieldMap) throws DataAccessException {

		List<CareerImgVO> imageFileList = (List<CareerImgVO>) starFieldMap.get("imageFileList");
		String star_field_cd = (String) starFieldMap.get("star_field_cd");
		
		for (int i = imageFileList.size() - 1; i >= 0; i--) {	// 수정을 하지 않은 이미지의 이름은 null
			CareerImgVO careerImgVO = imageFileList.get(i);
			String imageFileName = careerImgVO.getImageFileName();
			
			if (imageFileName == null) {	// 기존의 이미지를 수정하지 않는 경우 파일명이 null이므로 수정필요없음
				imageFileList.remove(i);
			}
			else {
				careerImgVO.setStar_field_cd(star_field_cd);
			}
		}
		
		if (imageFileList != null && imageFileList.size() != 0) {
			// 수정한 이미지만 갱신을 요청함
			sqlSession.update("mapper.starField.updateImageFile", imageFileList);
		}
	}

	@Override
	public void insertModNewImage(Map<String, Object> starFieldMap) throws DataAccessException {

		List<CareerImgVO> modAddImageFileList = (ArrayList) starFieldMap.get("modAddImageFileList");
		String star_field_cd = (String) starFieldMap.get("star_field_cd");
		
		int career_img_cd  = Integer.parseInt(selectNewCareerImgCD());
		
		if (modAddImageFileList != null && modAddImageFileList.size() != 0) {
			for (CareerImgVO careerImgVO : modAddImageFileList) {
				careerImgVO.setCareer_img_cd(++career_img_cd + "");
				careerImgVO.setStar_field_cd(star_field_cd);
			}
			
			sqlSession.insert("mapper.starField.insertModNewImage", modAddImageFileList);
		}
		
	}

	private String selectNewCareerImgCD() {

		return sqlSession.selectOne("mapper.starField.selectNewCareerImgCD");
	}

	@Override
	public void deleteModImage(CareerImgVO careerImgVO) throws DataAccessException {

		sqlSession.delete("mapper.starField.deleteModImage", careerImgVO);
	}
}
