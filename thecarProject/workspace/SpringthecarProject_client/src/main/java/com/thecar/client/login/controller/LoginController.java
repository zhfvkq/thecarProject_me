package com.thecar.client.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.thecar.client.login.service.LoginService;
import com.thecar.client.login.vo.LoginVO;


@Controller
@RequestMapping("/member")
public class LoginController {
	
	private Logger log = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private LoginService loginService;
	

	/**************************************************************
	 * 로그인 화면 보여주기 위한 메서드
	 **************************************************************/
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login() {		
		log.info("login get 호출 성공");
		

		return "member/login";
	}
	
	/**************************************************************
	 * 로그인 처리 메서드
	 * 참고 : 로그인 실패시 처리 내용 포함.
	 **************************************************************/
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public ModelAndView loginProc(@ModelAttribute("LoginVO") LoginVO lvo, HttpSession session, HttpServletRequest request) {
		
		log.info("login post 호출 성공");
		
		ModelAndView mav = new ModelAndView();
		
		LoginVO userVO = loginService.loginSelect(lvo.getM_id(),lvo.getM_pw());
		
		if (userVO == null) {
			mav.addObject("errCode", 1);
			mav.setViewName("member/login");
			return mav;
		} else {
			
			if (session.getAttribute("login") != null) {
				// 기존에 login이란 세션 값이 존재한다면 기존값을 제거해 준다.
				session.removeAttribute("login");
			}
			
			session.setAttribute("login", userVO);
			mav.setViewName("index");
			return mav;
		
		}
		
	}
	
	/**************************************************************
	 * 아이디/비밀번호 찾기 화면을 보여주기 위한 메서드
	 **************************************************************/
	@RequestMapping(value="/find", method = RequestMethod.GET)
	public String find() {		
		log.info("find get 호출 성공");
		

		return "member/find";
	}
	
	/**************************************************************
	 * 아이디 찾기													  *
	 **************************************************************/
	@RequestMapping(value="/findId", method = RequestMethod.POST)
	public ModelAndView FindId(@ModelAttribute("LoginVO") LoginVO lvo, HttpSession session, HttpServletRequest request) {
		
		log.info("login post 호출 성공");
		
		ModelAndView mav = new ModelAndView();
		
		LoginVO userVO = loginService.loginFindIdSelect(lvo.getM_name(),lvo.getM_email());
		
		if (userVO == null) {
			mav.addObject("errCode", 1);
			mav.setViewName("member/find");
			return mav;
		} else {
			mav.addObject("errCode", 2);
			mav.addObject("find",userVO);
			mav.setViewName("member/find");
			return mav;
		}
		
	}
	
	/**************************************************************
	 * 비밀번호 찾기												  *
	 **************************************************************/
	@RequestMapping(value="/findPw", method = RequestMethod.POST)
	public ModelAndView FindPw(@ModelAttribute("LoginVO") LoginVO lvo, HttpSession session, HttpServletRequest request) {
		
		log.info("login post 호출 성공");
		
		ModelAndView mav = new ModelAndView();
		
		LoginVO userVO = loginService.loginFindPwSelect(lvo.getM_id(),lvo.getM_name(),lvo.getM_email());
		
		if (userVO == null) {
			mav.addObject("errCode", 1);
			mav.setViewName("member/find");
			return mav;
		} else {
			mav.addObject("errCode", 4);
			mav.addObject("find",userVO);
			mav.setViewName("member/find");
			return mav;
		}
		
	}
	
	/**************************************************************
	 * 로그아웃 처리 메서드
	 **************************************************************/
	@RequestMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest request){
		session.invalidate();
		session = request.getSession(true);
		return "redirect:/member/login";
	}
}

