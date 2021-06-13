package com.thecar.client.notice.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.thecar.admin.notice.vo.NoticeVO;
import com.thecar.client.notice.service.ClientNoticeService;
import com.thecar.common.page.Paging;
import com.thecar.common.vo.Util;

@Controller
@RequestMapping(value = "/notice")
public class ClientNoticeController {
	private Logger log = LoggerFactory.getLogger(ClientNoticeController.class);

	@Autowired
	private ClientNoticeService noticeService;

	// 공지사항목록 구현하기
	@RequestMapping(value = "/noticeList", method = RequestMethod.GET)
	public String noticeList(@ModelAttribute NoticeVO nvo, Model model) {
		log.info("client noticeList 호출 성공");

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
		return "notice/noticeList";
	}

	// 공지사항 상세보기 구현
	@RequestMapping(value = "/noticeDetail", method = RequestMethod.GET)
	public String noticeDetail(@ModelAttribute NoticeVO nvo, Model model) {
		log.info("noticeDetail 호출 성공");
		log.info("n_num=" + nvo.getN_num());

		NoticeVO detail = new NoticeVO();
		detail = noticeService.noticeDetail(nvo);

		if (detail != null) {
			detail.setN_content(detail.getN_content().toString().replaceAll("\n", "<br>"));
		}

		model.addAttribute("detail", detail);

		return "notice/noticeDetail";
	}

}