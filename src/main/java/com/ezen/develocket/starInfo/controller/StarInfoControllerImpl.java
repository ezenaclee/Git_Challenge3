package com.ezen.develocket.starInfo.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.develocket.rocketInfo.vo.RocketInfoVO;
import com.ezen.develocket.starInfo.service.StarInfoService;

@Controller("starInfoController")
public class StarInfoControllerImpl implements StarInfoController {

	@Autowired
	StarInfoService starInfoService;
	
	@RequestMapping(value = "/starInfo/*Form.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView form(HttpServletRequest request, 
							 HttpServletResponse response) throws Exception {
		
		String viewName = (String) request.getAttribute("viewName");
		
		HttpSession session = request.getSession();
		RocketInfoVO rocketInfoVO = (RocketInfoVO) session.getAttribute("rocketInfoVO");
		String rocket_cd = rocketInfoVO.getRocket_cd();
		System.out.println("rocket_cd!!!:" + rocket_cd);
		
		String star_cd = starInfoService.matchStarCD(rocket_cd);
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("star_cd", star_cd);
		
		return mav;
	}

	@Override
	@RequestMapping(value = "/starInfo/join.do*", method = RequestMethod.POST)
	public ResponseEntity join(HttpServletRequest request,
							   HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		RocketInfoVO rocketInfoVO = (RocketInfoVO) session.getAttribute("rocketInfoVO");
		String rocket_cd = rocketInfoVO.getRocket_cd();
		
		System.out.println("join:" + rocket_cd);
		
		String small_category = request.getParameter("small_category");
		String star_nickname = request.getParameter("star_nickname");
		
		String address = request.getParameter("address");
		//String detailAddress = request.getParameter("detailAddress");
		String area = address; //+ detailAddress
		
		Map<String, String> starInfoMap = new HashMap<>();
		starInfoMap.put("rocket_cd", rocket_cd);
		starInfoMap.put("star_nickname", star_nickname);
		starInfoMap.put("area", area);
		starInfoMap.put("small_category", small_category);
		
		String message = "";
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-type", "text/html; charset=utf-8");
		
		try {
			Map<String, String> codeMap = starInfoService.joinStarInfo(starInfoMap);
			String star_cd = codeMap.get("star_cd");
			String cate_cd = codeMap.get("cate_cd");
			
			message += "<script>";
			message += "alert('스타등록을 완료하였습니다. 프로필을 수정해주세요.');";
			message += "location.href = '"+ request.getContextPath() + "/starField/joinStarField.do?star_cd=" + star_cd + "&cate_cd=" + cate_cd + "';";
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

	@Override
	@RequestMapping(value = "/starInfo/joinExtra.do", method = RequestMethod.POST)
	public ResponseEntity joinExtra(@RequestParam(value = "cate_s", required = false) String cate_s,
									@RequestParam(value = "star_cd", required = false) String star_cd,
									HttpServletRequest request,
									HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		RocketInfoVO rocketInfoVO = (RocketInfoVO) session.getAttribute("rocketInfoVO");
		String rocket_cd = rocketInfoVO.getRocket_cd();
		
		String message = "";
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-type", "text/html; charset=utf-8");
		
		try {
			String cate_cd = starInfoService.selectCateCD(cate_s);
			
			message += "<script>";
			message += "alert('스타등록을 완료하였습니다. 프로필을 수정해주세요.');";
			message += "location.href = '"+ request.getContextPath() + "/starField/joinStarField.do?star_cd=" + star_cd + "&cate_cd=" + cate_cd + "';";
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
	
	
}
