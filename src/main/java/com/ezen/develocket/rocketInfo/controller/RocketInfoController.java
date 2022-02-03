package com.ezen.develocket.rocketInfo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezen.develocket.rocketInfo.vo.RocketInfoVO;


public interface RocketInfoController {

	public ModelAndView join(@ModelAttribute("RocketInfoVO") RocketInfoVO rocketInfoVO ,
			 				 HttpServletRequest request,
			 				 HttpServletResponse response) throws Exception;
	
	public ModelAndView login(@ModelAttribute("_rocketInfoVO") RocketInfoVO _rocketInfoVO,
							  RedirectAttributes rAttr,
							  HttpServletRequest request,
							  HttpServletResponse response) throws Exception;

	public ModelAndView logout(HttpServletRequest request,
			   				   HttpServletResponse response) throws Exception;

}
