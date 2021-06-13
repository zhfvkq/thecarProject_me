package com.thecar.client.member.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.thecar.client.login.service.LoginService;
import com.thecar.client.login.vo.LoginVO;
import com.thecar.client.member.service.MemberService;
import com.thecar.client.member.vo.MemberVO;

@Controller
@RequestMapping(value = "/member")
public class MemberController {
	private Logger log = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;

	@Autowired
	private LoginService loginService;

	/**************************************************************
	 * 회원 가입 폼
	 **************************************************************/
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinForm(Model model) {
		log.info("join get 방식에 의한 메서드 호출 성공");
		return "member/join";
	}

	/*************************************************
	 * 사용자 아이디 중복 체크 메서드
	 *************************************************/
	@ResponseBody
	@RequestMapping(value = "/userIdConfirm", method = RequestMethod.POST)
	public String userIdConfirm(@RequestParam("m_id") String m_id) {
		int result = memberService.userIdConfirm(m_id);
		return result + "";
	}

	/**************************************************************
	 * 회원 가입 처리
	 **************************************************************/
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public ModelAndView memberInsert(@ModelAttribute MemberVO mvo) {
		System.out.println("join post 방식에 의한 메서드 호출 성공");
		System.out.println("m_id : " + mvo.getM_id());

		ModelAndView mav = new ModelAndView();

		int result = 0;
		result = memberService.memberInsert(mvo);

		switch (result) {
		/*
		 * case 1: mav.addObject("errCode", 1); // 오류 mav.setViewName("member/join");
		 * break;
		 */
		case 2:
			mav.addObject("errCode", 2); // 회원가입 성공
			mav.setViewName("member/join_success");
			break;
		default:
			mav.addObject("errCode", 3); // failed to add new member
			mav.setViewName("member/join");
			break;
		}
		return mav;
	}

	/**************************************************************
	 * 회원 정보 수정
	 **************************************************************/
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public ModelAndView memberModify(HttpSession session) {
		log.info("modify get 방식에 의한 메서드 호출 성공");
		ModelAndView mav = new ModelAndView();

		LoginVO login = (LoginVO) session.getAttribute("login");

		if (login == null) {
			mav.setViewName("member/login");
			return mav;
		}

		MemberVO vo = memberService.memberSelect(login.getM_id());
		mav.addObject("member", vo);
		mav.setViewName("member/modify");
		return mav;
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public ModelAndView memberModifyProcess(@ModelAttribute("MemberVO") MemberVO mvo, HttpSession session) {
		log.info("modify post 방식에 의한 메서드 호출 성공");

		ModelAndView mav = new ModelAndView();

		// 로그인 상태인지 확인
		LoginVO login = (LoginVO) session.getAttribute("login");
		if (login == null) {
			mav.setViewName("member/login");
			return mav;
		}

		mvo.setM_id(login.getM_id());
		MemberVO vo = memberService.memberSelect(mvo.getM_id());

		if (loginService.loginSelect(mvo.getM_id(), mvo.getOldUserPw()) == null) {
			mav.addObject("errCode", 1);
			mav.addObject("member", vo);
			mav.setViewName("member/modify");
			return mav;
		}

		if (memberService.memberUpdate(mvo)) {
			// 회원 수정 완료! alert 창 띄우기
			mav.addObject("errCode", 3);
			mav.addObject("member", vo);
			mav.setViewName("member/modify");
			return mav;
		} else {
			mav.addObject("errCode", 2);
			mav.addObject("member", vo);
			mav.setViewName("member/modify");
			return mav;
		}
	}

	@RequestMapping("/delete")
	public ModelAndView memberDelete(HttpSession session) {
		log.info("delete get방식에 의한 메서드 호출 성공");

		ModelAndView mav = new ModelAndView();
		LoginVO login = (LoginVO) session.getAttribute("login");

		if (login == null) {
			mav.setViewName("member/login");
			return mav;
		}

		int errCode = memberService.memberDelete(login.getM_id());
		switch (errCode) {
		case 2:
			mav.setViewName("redirect:/member/logout");
			break;
		case 3:
			mav.addObject("errCode", 3);
			mav.setViewName("member/login");
			break;
		}
		return mav;
	}
}
