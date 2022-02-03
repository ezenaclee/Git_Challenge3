package com.ezen.develocket.starInfo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;



public interface StarInfoController {

	public ResponseEntity join(HttpServletRequest request,
							   HttpServletResponse response) throws Exception;
	
	public ResponseEntity joinExtra(@RequestParam(value = "cate_s", required = false) String cate_s,
									@RequestParam(value = "star_cd", required = false) String star_cd,
									HttpServletRequest request,
			   						HttpServletResponse response) throws Exception;
	
}
