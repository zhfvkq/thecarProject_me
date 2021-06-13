package com.thecar.admin.notice.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.thecar.admin.notice.service.NoticeService;
import com.thecar.admin.notice.vo.NoticeVO;
import com.thecar.common.page.Paging;
import com.thecar.common.util.Util;

@Controller
@RequestMapping(value = "/admin")
public class NoticeController {
	private Logger log = LoggerFactory.getLogger(NoticeController.class);

	@Autowired
	private NoticeService noticeService;

	// 공지사항목록 구현하기
	@RequestMapping(value = "/notice/noticeList", method = RequestMethod.GET)
	public String noticeList(@ModelAttribute NoticeVO nvo, Model model, HttpSession session) {

		if (Util.checkAdminSession(session)) {
			return "redirect:/admin/login/adminLogin";
		}

		log.info("noticeList 호출 성공");

		// 페이지 세팅
		Paging.setPage(nvo);

		// 전체 레코드 수 구현
		int total = noticeService.noticeListCnt(nvo);
		log.info("total = " + total);

		// 글번호 재설정
		int count = total - (Util.nvl(nvo.getPage()) - 1) * Util.nvl(nvo.getPageSize());
		log.info("count = " + count);

		List<NoticeVO> noticeList = noticeService.noticeList(nvo);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("count", count);
		model.addAttribute("total", total);
		model.addAttribute("data", nvo);
		return "admin/notice/noticeList";
	}

	// 공지사항쓰기 폼 출력하기
	@RequestMapping(value = "/notice/noticeWrite")
	public String noticeWrite(HttpSession session) {

		if (Util.checkAdminSession(session)) {
			return "redirect:/admin/login/adminLogin";
		}

		log.info("noticeWrite 호출 성공");
		return "admin/notice/noticeWrite";
	}

	// 공지사항쓰기 구현하기
	@RequestMapping(value = "/notice/noticeInsert", method = RequestMethod.POST)
	public String noticeInsert(@ModelAttribute NoticeVO nvo, Model model, HttpSession session) {

		if (Util.checkAdminSession(session)) {
			return "redirect:/admin/login/adminLogin";
		}

		log.info("noticeInsert 호출 성공");

		int result = 0;
		String url = "";

		result = noticeService.noticeInsert(nvo);
		if (result == 1) {
			url = "/admin/notice/noticeList";
		} else {
			model.addAttribute("code", 1);
			url = "/admin/notice/noticeWrite";
		}
		return "redirect:" + url;
	}

	// 공지사항 상세보기 구현
	@RequestMapping(value = "/notice/noticeDetail", method = RequestMethod.GET)
	public String noticeDetail(@ModelAttribute NoticeVO nvo, Model model, HttpSession session) {

		if (Util.checkAdminSession(session)) {
			return "redirect:/admin/login/adminLogin";
		}

		log.info("noticeDetail 호출 성공");
		log.info("n_num=" + nvo.getN_num());

		NoticeVO detail = new NoticeVO();
		detail = noticeService.noticeDetail(nvo);

		if (detail != null) {
			detail.setN_content(detail.getN_content().toString().replaceAll("\n", "<br>"));
		}

		model.addAttribute("detail", detail);

		return "admin/notice/noticeDetail";
	}

	// 공지사항수정 폼 출력하기
	@RequestMapping(value = "/notice/noticeUpdate")
	public String noticeUpdate(@ModelAttribute NoticeVO nvo, Model model, HttpSession session) {

		if (Util.checkAdminSession(session)) {
			return "redirect:/admin/login/adminLogin";
		}

		log.info("noticeUpdate 호출 성공");

		log.info("n_num=" + nvo.getN_num());

		NoticeVO updateData = new NoticeVO();
		updateData = noticeService.noticeDetail(nvo);

		model.addAttribute("updateData", updateData);
		return "/admin/notice/noticeUpdate";
	}

	// 공지사항 수정 구현하기
	@RequestMapping(value = "/notice/noticeUpdateOk", method = RequestMethod.POST)
	public String noticeUpdateOk(@ModelAttribute NoticeVO nvo, HttpSession session) {

		if (Util.checkAdminSession(session)) {
			return "redirect:/admin/login/adminLogin";
		}

		log.info("noticeUpdateOk 호출 성공");

		int result = 0;
		String url = "";

		result = noticeService.noticeUpdateOk(nvo);

		if (result == 1) {
			// 수정 후 상세 페이지로 이동
			url = "/admin/notice/noticeList";
		} else {
			url = "/admin/notice/noticeUpdate?n_num=" + nvo.getN_num();
		}
		return "redirect:" + url;
	}

	// 공지사항삭제 구현하기
	@RequestMapping(value = "/notice/noticeDelete")
	public String noticeDelete(@ModelAttribute NoticeVO nvo, HttpSession session) {

		if (Util.checkAdminSession(session)) {
			return "redirect:/admin/login/adminLogin";
		}

		log.info("boardDelete 호출 성공");

		int result = 0;
		String url = "";

		result = noticeService.noticeDelete(nvo.getN_num());

		if (result == 1) {
			url = "/admin/notice/noticeList";
		} else {
			url = "/admin/notice/noticeDetail?n_num=" + nvo.getN_num();
		}
		return "redirect:" + url;
	}

}