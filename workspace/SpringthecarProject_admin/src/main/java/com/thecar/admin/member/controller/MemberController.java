package com.thecar.admin.member.controller;

import javax.servlet.http.HttpServletRequest;
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

import com.thecar.admin.member.service.MemberService;
import com.thecar.admin.member.vo.AdminMemberVO;
import com.thecar.common.util.Util;
import com.thecar.common.vo.Paging;

@Controller
@RequestMapping(value = "/admin")

public class MemberController {

	private Logger log = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;

	// 회원 리스트 구현하기

	@RequestMapping(value = "/member/memberList", method = RequestMethod.GET)
	public String selectmemberList(@ModelAttribute AdminMemberVO bvo, Model model,
			@RequestParam(defaultValue = "1") int curPage, HttpServletRequest request, HttpSession session)
			throws Exception {

		if (Util.checkAdminSession(session)) {
			return "redirect:/admin/login/adminLogin";
		}

		Paging pagination = new Paging(curPage, 10, 10);// 현제 페이지, 출력할 데이터 갯수, 화면 하단 페이지 갯수

		// 전체리스트 개수
		int listCnt = memberService.selectMemberListCnt(pagination);
		pagination.setTotalRecordCount(listCnt);

		log.info("memberList 호출 성공");

		model.addAttribute("memberList", memberService.selectMemberList(pagination));
		model.addAttribute("pagination", pagination);
		return "admin/member/memberList";

	}

	/**************************************************************
	 * 회원통계 화면 보여주기 위한 메서드
	 **************************************************************/
	@RequestMapping(value = "/member/memberChart", method = RequestMethod.GET)

	public String login(HttpSession session) {
		log.info("memberChart get 호출 성공");
		if (Util.checkAdminSession(session)) {
			return "redirect:/admin/login/adminLogin";
		}

		return "admin/member/memberChart";
	}
}
