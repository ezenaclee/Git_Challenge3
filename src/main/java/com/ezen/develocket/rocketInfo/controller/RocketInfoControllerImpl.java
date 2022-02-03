package com.ezen.develocket.rocketInfo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezen.develocket.rocketInfo.service.RocketInfoService;
import com.ezen.develocket.rocketInfo.vo.RocketInfoVO;

@Controller("rocketInfoController")
public class RocketInfoControllerImpl implements RocketInfoController {

	@Autowired
	private RocketInfoService rocketInfoService;
	@Autowired
	private RocketInfoVO rocketInfoVO;
	
	@RequestMapping(value = "/rocketInfo/*Form.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView form(@RequestParam(value = "result", required = false) String result,
			 				 @RequestParam(value = "action", required = false) String action,
			 				 @RequestParam(value = "parent_cd", required = false) String parent_cd,
			 				 @RequestParam(value = "group_cd", required = false) String group_cd,
			 				 HttpServletRequest request, 
							 HttpServletResponse response) throws Exception {
		
		String viewName = (String) request.getAttribute("viewName");
		
		HttpSession session = request.getSession();
		session.setAttribute("action", action);
		
		// 답글쓰기로 로그인 시
		if (parent_cd != null) {
			session.setAttribute("parent_cd", parent_cd);	// 답글쓰기 클릭시 부모글 번호를 세션에 저장
		}
		
		if (group_cd != null) {
			session.setAttribute("group_cd", group_cd);
		}
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("result", result);
		
		return mav;
	}
	
	
	@Override
	@RequestMapping(value = "/rocketInfo/join.do", method = RequestMethod.POST)
	public ModelAndView join(@ModelAttribute("RocketInfoVO") RocketInfoVO rocketInfoVO,
							 HttpServletRequest request, 
							 HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		rocketInfoService.joinRocketInfo(rocketInfoVO);
		
		ModelAndView mav = new ModelAndView("redirect:/rocketInfo/loginForm.do");
		
		return mav;
	}


	@Override
	@RequestMapping(value = "/rocketInfo/login.do", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("_rocketInfoVO") RocketInfoVO _rocketInfoVO, 
							  RedirectAttributes rAttr, 
							  HttpServletRequest request,
							  HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		
		rocketInfoVO = rocketInfoService.loginRocket(_rocketInfoVO);
		String rocket_cd = rocketInfoVO.getRocket_cd();
		List<String> starFieldCDList = rocketInfoService.selectAllStarFieldCD(rocket_cd);
		
		
		if (this.rocketInfoVO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("rocketInfoVO", rocketInfoVO);
			session.setAttribute("isLogOn", true);
			session.setAttribute("starFieldCDList", starFieldCDList);

			String action = (String) session.getAttribute("action");
			session.removeAttribute("action");
			
			if (action != null) {
				// 댓글인지 게시글인지 나누는 조건
				if (action.equals("/inquiry/inquiryReplyForm.do")) {	// 댓글을 작성할 경우
					mav.setViewName("redirect:" + action);
				}
				else if (action.equals("/inquiry/inquiryForm.do")) {	// 게시글 작성인 경우
					mav.setViewName("redirect:" + action);
				}
			}
			else {
				mav.setViewName("common/main");
			}
		}
		else {
			rAttr.addAttribute("result", "loginFailed");
			mav.setViewName("redirect:/rocketInfo/loginForm.do");
		}
		
		return mav;
	}


	@Override
	@RequestMapping(value = "/rocketInfo/logout.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		session.removeAttribute("isLogOn");
		session.removeAttribute("rocketInfoVO");
		session.removeAttribute("starFieldCDList");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("common/main");
		
		return mav;
	}
	
	 @RequestMapping(value = "/rocketInfo/searchID.do", method = RequestMethod.POST)
	   public ResponseEntity searchID(@RequestParam(value = "email", required = false) String email,
			   						  HttpServletRequest request, 
			   						  HttpServletResponse response) throws Exception {
		 
		  HttpHeaders responseHeaders = new HttpHeaders();
		  responseHeaders.add("Content-Type", "text/html;charset=UTF-8");
			
		  String message = "";
		  ResponseEntity resEnt = null;
	      
	      HttpSession session = request.getSession();
	   
	      
	      try {
	         session.setAttribute("email", email);
	         
	         message = "<script>";
			 message += "alert('새글을 추가했습니다.');";
			 message += "location.href = '"+ request.getContextPath() + "/rocketInfo/loginForm.do';";
			 message += "</script>";
	         
	         System.out.println("getContextPath2 : " +request.getContextPath().toString());
	         resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	         System.out.println("getContextPath3 : " +request.getContextPath().toString());
	         System.out.println(message);
	         
	      } catch (Exception e) {
	         message += "<script>";
	         message += "alert('에러.');";
	         message += "</script>";
	         
	         resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	         e.printStackTrace();
	      }
	      
	      return resEnt;
	   }

}
