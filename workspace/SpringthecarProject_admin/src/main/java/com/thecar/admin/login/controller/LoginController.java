package com.thecar.admin.login.controller;

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

import com.thecar.admin.login.service.LoginService;
import com.thecar.admin.login.vo.LoginVO;

@Controller
@RequestMapping(value = "/")
public class LoginController {

	private Logger log = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private LoginService loginService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() {
		return "/admin/login/adminLogin";
	}

	/**************************************************************
	 * 로그인 화면 보여주기 위한 메서드
	 **************************************************************/
	@RequestMapping(value = "/admin/login/adminLogin", method = RequestMethod.GET)
	public String login() {
		log.info("adminLogin get 호출 성공");

		return "admin/login/adminLogin";
	}

	/**************************************************************
	 * 로그인 처리 메서드
	 **************************************************************/
	@RequestMapping(value = "/admin/login/adminLogin", method = RequestMethod.POST)
	public ModelAndView loginProc(@ModelAttribute("LoginVO") LoginVO lvo, HttpSession session,
			HttpServletRequest request) {

		log.info("adminLogin post 호출 성공");

		ModelAndView mav = new ModelAndView();
		System.out.println(lvo.getA_id() + ", " + lvo.getA_pw());
		LoginVO a_loginSession = loginService.adminLoginSelect(lvo.getA_id(), lvo.getA_pw());

		if (a_loginSession == null) {
			mav.addObject("errCode", 1);
			mav.setViewName("redirect:/admin/login/adminLogin");
			return mav;
		} else {
			a_loginSession.setA_id(lvo.getA_id());
			session.setAttribute("a_loginSession", a_loginSession);
			System.out.println("관리자 로그인 성공");
			mav.setViewName("redirect:/admin/member/memberList");
			return mav;
		}

	}

	/**************************************************************
	 * 로그아웃 처리 메서드
	 **************************************************************/
	@RequestMapping("/admin/adminLogout")
	public String logout(HttpSession session, HttpServletRequest request) {
		session.invalidate();
		session = request.getSession(true);
		return "redirect:/admin/login/adminLogin";
	}
}
