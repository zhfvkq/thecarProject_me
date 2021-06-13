package com.thecar.admin.question.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.thecar.admin.question.service.AdminQuestionService;
import com.thecar.client.question.vo.QuestionVO;
import com.thecar.common.page.Paging;
import com.thecar.common.util.Util;

@Controller
@RequestMapping(value = "/admin")
public class AdminQuestionController {
	private Logger log = LoggerFactory.getLogger(AdminQuestionController.class);

	@Autowired
	private AdminQuestionService questionService;

	// 문의글목록 구현하기
	@RequestMapping(value = "/question/questionList", method = RequestMethod.GET)
	public String questionList(@ModelAttribute QuestionVO qvo, Model model) {
		log.info("questionList 호출 성공");

		// 페이지 세팅
		Paging.setPage(qvo);

		// 전체 레코드 수 구현
		int total = questionService.questionListCnt(qvo);
		log.info("total = " + total);

		// 글번호 재설정
		int count = total - (Util.nvl(qvo.getPage()) - 1) * Util.nvl(qvo.getPageSize());
		log.info("count = " + count);

		List<QuestionVO> questionList = questionService.questionList(qvo);
		model.addAttribute("questionList", questionList);
		model.addAttribute("count", count);
		model.addAttribute("total", total);
		model.addAttribute("data", qvo);
		return "admin/question/questionList";
	}

	// 문의글 상세보기 구현
	@RequestMapping(value = "/question/questionDetail", method = RequestMethod.GET)
	public String questionDetail(@ModelAttribute QuestionVO qvo, Model model) {
		log.info("questionDetail 호출 성공");
		log.info("q_num=" + qvo.getQ_num());

		QuestionVO detail = new QuestionVO();
		detail = questionService.questionDetail(qvo);

		if (detail != null) {
			detail.setQ_content(detail.getQ_content().toString().replaceAll("\n", "<br>"));
		}

		model.addAttribute("detail", detail);

		return "admin/question/questionDetail";
	}

	// 문의글 답변상태 수정 구현하기
	@RequestMapping(value = "/question/rpStateUpdate", method = RequestMethod.POST)
	public String rpStateUpdate(@ModelAttribute QuestionVO qvo, HttpServletRequest request)
			throws IllegalStateException, IOException {
		
		log.info("rpStateUpdate 호출 성공");

		int result = 0;
		String url = "";

		result = questionService.rpStateUpdate(qvo);

		if (result == 1) {
			// url="question/questionList"; 수정 후 목록으로 이동
			// 아래 url은 수정 후 상세 페이지로 이동
			url = "/admin/question/questionDetail?q_num=" + qvo.getQ_num();

		} else {
			url = "/admin/login/adminLogin";

		}

		return "redirect:" + url;
	}

}