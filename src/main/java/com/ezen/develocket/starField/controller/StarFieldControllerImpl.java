package com.ezen.develocket.starField.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.develocket.rocketInfo.service.RocketInfoService;
import com.ezen.develocket.rocketInfo.vo.RocketInfoVO;
import com.ezen.develocket.starField.service.StarFieldService;
import com.ezen.develocket.starField.vo.CareerImgVO;
import com.ezen.develocket.starField.vo.StarFieldVO;

@Controller("starFieldControllerr")
public class StarFieldControllerImpl implements StarFieldController {

	@Autowired
	private StarFieldService starFieldService;
	@Autowired
	private RocketInfoService rocketInfoService;
	@Autowired
	private StarFieldVO starFieldVO;
	
	private static String STAR_FIELD_IMAGE_REPO = "C:\\develocket_repo\\starField";
	
	
	@Override
	@RequestMapping(value = "/starField/starFieldView.do", method = RequestMethod.GET)
	public ModelAndView starFieldVeiw(@RequestParam("star_field_cd") String star_field_cd,
									  @RequestParam(value = "removeCompleted", required = false) String removeCompleted,
									  HttpServletRequest request,
									  HttpServletResponse response) throws Exception {
		
		String viewName = (String) request.getAttribute("viewName");
		
		
		
		Map<String, Object> starFieldMap = starFieldService.viewStarField(star_field_cd);
		starFieldMap.put("removeCompleted", removeCompleted);
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("starFieldMap", starFieldMap);
		
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/starField/starFieldModify.do", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView starFieldModify(@RequestParam("star_field_cd") String star_field_cd,
										HttpServletRequest request, 
										HttpServletResponse response) throws Exception {
		
		String viewName = (String) request.getAttribute("viewName");
		
		Map<String, Object> starFieldMap = starFieldService.viewStarField(star_field_cd);
		// List<CareerImgVO> imageFileList = starFieldService.selectImageFileList(star_field_cd);
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("starFieldMap", starFieldMap);
		
		return mav;
	}

	
	@Override
	@RequestMapping(value = "/starField/joinStarField.do", method = RequestMethod.GET)
	public ResponseEntity joinStarField(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		RocketInfoVO rocketInfoVO = (RocketInfoVO) session.getAttribute("rocketInfoVO");
		String rocket_cd = rocketInfoVO.getRocket_cd();
		
		String star_cd = request.getParameter("star_cd");
		String cate_cd = request.getParameter("cate_cd");
		
		Map<String, String> starFieldMap = new HashMap<>();
		starFieldMap.put("star_cd", star_cd);
		starFieldMap.put("cate_cd", cate_cd);
		
		String message = "";
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-type", "text/html; charset=utf-8");
		
		try {
			String star_field_cd = starFieldService.joinStarField(starFieldMap);
			
			List<String> starFieldCDList = rocketInfoService.selectAllStarFieldCD(rocket_cd);
			session.setAttribute("starFieldCDList", starFieldCDList);
			
			message += "<script>";
			message += "location.href = '"+ request.getContextPath() + "/starField/starFieldView.do?star_field_cd=" + star_field_cd + "';";
			message += "</script>"; 
			
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			
		} catch (Exception e) {
			message = "<script>";
			message += "alert('오류가 발생했습니다. 다시 입력해주세요.');";
			message += "location.href = '"+ request.getContextPath() + "/starInfo/joinStarForm.do';";
			message += "</script>";
			
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			
			e.printStackTrace();
		}
		
		return resEnt;
	}

	
	// TODO 여기부터!!!
	@Override
	@RequestMapping(value = "/starField/modifyStarField.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity modifyStarField(MultipartHttpServletRequest multipartRequest,
										  HttpServletResponse response) throws Exception {

		multipartRequest.setCharacterEncoding("UTF-8");
		
		Map<String, Object> starFieldMap = new HashMap<>();
		
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			
			if (name.equals("career_img_cd")) {
				String[] values = multipartRequest.getParameterValues(name);
				
				System.out.println("!!컨트롤러 career_img_cd:" + values[0] );
				
				starFieldMap.put(name, values);
			}
			else if (name.equals("oldFileName")) {
				String[] values = multipartRequest.getParameterValues(name);
				
				System.out.println("!!컨트롤러 oldFileName:" + values[0] );
				
				starFieldMap.put(name, values);
			}
			else {	// 새로 추가된 부분과 남은 부분
				String value = multipartRequest.getParameter(name);
				starFieldMap.put(name, value);
			}
		}
		
		// 수정한 이미지 파일을 업로드함
		Map<String, Object> imageFileMap = uploadModImageFile(multipartRequest);
		String profile_img = (String) imageFileMap.get("profile_img");
		String old_profile_img = (String) starFieldMap.get("old_profile_img");
		if (profile_img.equals("")) {		// 수정할 이미지 없는 경우
			if (old_profile_img != null) {	// 기존 이미지가 있는 상태
				starFieldMap.put("profile_img", old_profile_img);
			}
			else {							// 기존 이미지가 없는 상태
				starFieldMap.put("profile_img", profile_img);
			}
		}
		else {								// 수정할 이미지 있는 경우
			starFieldMap.put("profile_img", profile_img);
		}
	
		String business_img = (String) imageFileMap.get("business_img");
		String old_business_img = (String) starFieldMap.get("old_business_img");
		if (business_img.equals("")) {
			if (old_business_img != null) {
				starFieldMap.put("business_img", old_business_img);
			}
			else {
				starFieldMap.put("business_img", business_img);
			}
		}
		else {
			starFieldMap.put("business_img", business_img);
		}
		
		
		List<String> fileList = (List<String>) imageFileMap.get("fileList");
		
		// 수정시 새로 추가된 이미지 수
		int added_img_num = Integer.parseInt((String) starFieldMap.get("added_img_num"));
		// 기존 이미지 수
		int pre_img_num = Integer.parseInt((String) starFieldMap.get("pre_img_num"));
		
		List<CareerImgVO> imageFileList = new ArrayList<>();
		List<CareerImgVO> modAddImageFileList = new ArrayList<>();
		
		if (fileList != null && fileList.size() != 0) {
			String[] career_img_cd = (String[]) starFieldMap.get("career_img_cd");
			
			
			for (int i = 0; i < added_img_num; i++) {
				String fileName = fileList.get(i);
				CareerImgVO careerImgVO = new CareerImgVO();
				if (i < pre_img_num) {	// 기존의 이미지를 수정해서 첨부한 이미지는 imageFileList에 추가됨
					careerImgVO.setImageFileName(fileName);
					careerImgVO.setCareer_img_cd(career_img_cd[i]);
					
					imageFileList.add(careerImgVO);
					starFieldMap.put("imageFileList", imageFileList);
				}
				else {	// 새로 추가한 이미지는 modAddImageFileList에 추가됨
					careerImgVO.setImageFileName(fileName);
					modAddImageFileList.add(careerImgVO);
					starFieldMap.put("modAddImageFileList", modAddImageFileList);
					
				}
			}
		}
		
		String star_field_cd = (String) starFieldMap.get("star_field_cd");
		String message = "";
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-type", "text/html; charset=utf-8");
		
		try {
			starFieldService.modifyStarField(starFieldMap);
			
			if (profile_img != "") {
				// 이동시킬 파일 선택
				File srcFile = new File(STAR_FIELD_IMAGE_REPO + "\\temp\\" + profile_img);
				// 이동시킬 위치
				File destDir = new File(STAR_FIELD_IMAGE_REPO + "\\" + star_field_cd);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
				
				if (old_profile_img != null) {
					File oldFile = new File(STAR_FIELD_IMAGE_REPO + "\\" + star_field_cd + "\\" + old_profile_img);
					oldFile.delete();
				}
			}
			
			if (business_img != "") {
				// 이동시킬 파일 선택
				File srcFile = new File(STAR_FIELD_IMAGE_REPO + "\\temp\\" + business_img);
				// 이동시킬 위치
				File destDir = new File(STAR_FIELD_IMAGE_REPO + "\\" + star_field_cd);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
				
				if (old_business_img != null) {
					File oldFile = new File(STAR_FIELD_IMAGE_REPO + "\\" + star_field_cd + "\\" + old_business_img);
					oldFile.delete();
				}
			}
			
			if (fileList != null && fileList.size() != 0) {	// 수정한 파일들들 차례대로 업로드함(temp폴더에서 이동시킴)
				for (int i = 0; i < fileList.size(); i++) {
					String fileName = fileList.get(i);
					
					if (i < pre_img_num) {
						if (fileName != null) {
							// 이동시킬 파일 선택
							File srcFile = new File(STAR_FIELD_IMAGE_REPO + "\\temp\\" + fileName);
							// 이동시킬 위치
							File destDir = new File(STAR_FIELD_IMAGE_REPO + "\\" + star_field_cd);
							FileUtils.moveFileToDirectory(srcFile, destDir, true);
							
							
							String[] oldNames = (String[]) starFieldMap.get("oldFileName");
							String oldFileName = oldNames[i];
							
							File oldFile = new File(STAR_FIELD_IMAGE_REPO + "\\" + star_field_cd + "\\" + oldFileName);
							oldFile.delete();
						}
					}
					else {
						if (fileName != null) {
							// 이동시킬 파일 선택
							File srcFile = new File(STAR_FIELD_IMAGE_REPO + "\\temp\\" + fileName);
							// 이동시킬 위치
							File destDir = new File(STAR_FIELD_IMAGE_REPO + "\\" + star_field_cd);
							FileUtils.moveFileToDirectory(srcFile, destDir, true);
						}
					}
				}
			}
			
			message += "<script>";
			message += "alert('수정을 완료했습니다.');";
			message += "location.href = '"+ multipartRequest.getContextPath() + "/starField/starFieldView.do?star_field_cd=" + star_field_cd + "';";
			message += "</script>"; 
			
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			
		} catch (Exception e) {
			
			// 오류 발생 시 temp 폴더에 업로드된 이미지 파일들을 삭제
			if (fileList != null && fileList.size() != 0) {
				for (int i = 0; i < fileList.size(); i++) {
					File srcFile = new File(STAR_FIELD_IMAGE_REPO + "\\temp\\" + fileList.get(i));
					srcFile.delete();
				}
			}
			
			e.printStackTrace();
			
			message = "<script>";
			message += "alert('오류가 발생했습니다.');";
			message += "location.href = '"+ multipartRequest.getContextPath() + "/starField/starFieldView.do?star_field_cd=" + star_field_cd + "';";
			message += "</script>";
			
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}
		
		return resEnt;
	}
	
	// 수정시 다중 이미지 업로드하기
	private Map<String, Object> uploadModImageFile(MultipartHttpServletRequest multipartRequest) throws Exception {
		
		Map<String, Object> imageFileMap = new HashMap<>();
		List<String> fileList = new ArrayList<>();
		
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while (fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName = mFile.getOriginalFilename();
			
			if (originalFileName != "" && originalFileName != null) {
				if (fileName.equals("profile_img")) {
					imageFileMap.put("profile_img", originalFileName);
				}
				else if (fileName.equals("business_img")) {
					imageFileMap.put("business_img", originalFileName);
				}
				else {
					fileList.add(originalFileName);
				}
				
				System.out.println("!!이미지 파일 이름: " + originalFileName);
				
				File file = new File(STAR_FIELD_IMAGE_REPO + "\\" + fileName);
				if (mFile.getSize() != 0) {	// File Null Check
					if (!file.exists()) {	// 경로상에 존재하지 않는 경우
						file.getParentFile().mkdirs();	// 경로에 해당하는 디렉토리를 생성
						
						// 임시 폴더로 mFile 이동
						mFile.transferTo(new File(STAR_FIELD_IMAGE_REPO + "\\temp\\" + originalFileName));
					}
				}
			}
			else {	// 첨부한 이미지가 없는 경우
				if (fileName.equals("profile_img")) {
					imageFileMap.put("profile_img", "");
				}
				else if (fileName.equals("business_img")) {
					imageFileMap.put("business_img", "");
				}
				else {
					fileList.add(null);
				}
				
				System.out.println("!!이미지 파일 이름: " + originalFileName);
			}
			
			
		}
		
		imageFileMap.put("fileList", fileList);
		
		return imageFileMap;
	}

	@Override
	public ResponseEntity removeStarField(String star_field_cd, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@RequestMapping(value = "/starField/removeModImage.do", method = {RequestMethod.POST, RequestMethod.GET})
	public void removeModImage(HttpServletRequest request,
							   HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		try {
			String career_img_cd = request.getParameter("career_img_cd");
			String star_field_cd = request.getParameter("star_field_cd");
			String imageFileName = request.getParameter("imageFileName");
			
			CareerImgVO careerImgVO = new CareerImgVO();
			careerImgVO.setStar_field_cd(star_field_cd);
			careerImgVO.setCareer_img_cd(career_img_cd);
			
			starFieldService.removeModImage(careerImgVO);
			
			if (imageFileName != null) {
				
				File removeFile = new File(STAR_FIELD_IMAGE_REPO + "\\" + star_field_cd + "\\" + imageFileName);
				removeFile.delete();
			}
			
			out.print("success");
			
			
			
		} catch (Exception e) {
			out.print("fail");
			e.printStackTrace();
		}
	}
	
}
