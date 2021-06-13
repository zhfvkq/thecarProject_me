package com.thecar.client.question.controller;

import java.io.IOException;
import java.util.List;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.thecar.client.login.vo.LoginVO;
import com.thecar.client.question.service.QuestionService;
import com.thecar.client.question.vo.QuestionVO;
import com.thecar.common.file.FileUploadUtil;
import com.thecar.common.page.Paging;
import com.thecar.common.vo.Util;

@Controller
@RequestMapping(value = "/question")
public class QuestionController {

	private static final Logger log = LoggerFactory.getLogger(QuestionController.class);

	@Autowired
	private QuestionService questionService;

	// 문의글 목록 구현하기
	@RequestMapping(value = "/questionList", method = RequestMethod.GET)
	public String questionList(@ModelAttribute QuestionVO qvo, Model model, HttpSession session) {
		log.info("questionList 호출 성공");

		// 페이지 세팅
		Paging.setPage(qvo);

		// 전체 레코드수 구현
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

		return "question/questionList";

	}

	// 문의글 쓰기 폼 출력하기
	@RequestMapping(value = "/questionWrite")
	public String questionWrite() {
		log.info("questionWrite 호출 성공");
		return "question/questionWrite";
	}

	// 문의글 쓰기 구현하기
	@RequestMapping(value = "questionInsert", method = RequestMethod.POST)
	public String questionInsert(@ModelAttribute QuestionVO qvo, Model model, HttpServletRequest request,
			HttpSession session) throws IllegalStateException, IOException {
		log.info("questionInsert 호출 성공");

		int result = 0;
		String url = "";

		// 로그인 세션 값 불러오기
		LoginVO login = (LoginVO) session.getAttribute("login");

		// session에 저장된 m_id를 writer에 저장
		String writer = (String) login.getM_id();

		// vo에 writer를 세팅
		qvo.setM_id(writer);

		if (qvo.getFile() != null) {
			String q_file = FileUploadUtil.fileUpload(qvo.getFile(), request, "question");
			qvo.setQ_file(q_file);
		}

		result = questionService.questionInsert(qvo);
		if (result == 1) {
			url = "/question/questionList";

		} else {
			model.addAttribute("code", 1);
			url = "/question/questionWrite";
		}

		return "redirect:" + url;
	}

	// 문의글 상세보기 구현하기
	@RequestMapping(value = "/questionDetail", method = RequestMethod.GET)
	public String questionDetail(@ModelAttribute QuestionVO qvo, Model model) {
		log.info("questionDetail 호출 성공");
		log.info("q_num = " + qvo.getQ_num());

		QuestionVO detail = new QuestionVO();
		detail = questionService.questionDetail(qvo);

		if (detail != null) {
			detail.setQ_content(detail.getQ_content().toString().replace("\n", "<br>"));
		}

		model.addAttribute("detail", detail);

		return "question/questionDetail";
	}

	// 문의글 비밀번호 확인
	@ResponseBody
	@RequestMapping(value = "/questionPwdConfirm", method = RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String questionPwdConfirm(@ModelAttribute QuestionVO qvo) {

		log.info("questionPwdConfirm 호출 성공 ");
		String value = "";

		// 아래 변수에는 입력 성공에 대한 상태값 저장 (1 or 0)
		int result = questionService.questionPwdConfirm(qvo);

		if (result == 1) {
			value = "성공";

		} else {
			value = "실패";

		}

		log.info("result = " + result);

		return value + "";

	}

	// 문의글 수정 폼 출력하기
	@RequestMapping(value = "/questionModify")
	public String questionModify(@ModelAttribute QuestionVO qvo, Model model) {

		log.info("questionModify 호출 성공 ");

		log.info("q_num = " + qvo.getQ_num());

		QuestionVO updateData = new QuestionVO();

		updateData = questionService.questionDetail(qvo);

		model.addAttribute("updateData", updateData);
		return "question/questionModify";

	}

	// 문의글 수정 구현하기
	@RequestMapping(value = "questionUpdate", method = RequestMethod.POST)
	public String questionUpdate(@ModelAttribute QuestionVO qvo, HttpServletRequest request)
			throws IllegalStateException, IOException {
		log.info("questionUpdate 호출 성공");

		int result = 0;
		String url = "";
		String q_file = "";

		if (!qvo.getFile().isEmpty()) {
			log.info("======== file = " + qvo.getFile().getOriginalFilename());
			if (!qvo.getQ_file().isEmpty()) {
				FileUploadUtil.fileDelete(qvo.getQ_file(), request);
			}

			q_file = FileUploadUtil.fileUpload(qvo.getFile(), request, "question");
			qvo.setQ_file(q_file);

		} else {
			log.info("첨부파일 없음");
			qvo.setQ_file("");
		}
		log.info("==========q_file = " + qvo.getQ_file());

		result = questionService.questionUpdate(qvo);

		if (result == 1) {
			// url="question/questionList"; 수정 후 목록으로 이동
			// 아래 url은 수정 후 상세 페이지로 이동
			url = "/question/questionDetail?q_num=" + qvo.getQ_num();

		} else {
			url = "/question/questionModify?q_num=" + qvo.getQ_num();

		}

		return "redirect:" + url;
	}

	// 문의글 삭제 구현하기
	@RequestMapping(value = "/questionDelete")
	public String questionDelete(@ModelAttribute QuestionVO qvo, HttpServletRequest request) throws IOException {

		log.info("questionDelete 호출 성공");

		// 아래 변수에는 입력 성공에 대한 상태값을 담는다. (1 or 0)
		int result = 0;
		String url = "";

		if (!qvo.getQ_file().isEmpty()) {
			FileUploadUtil.fileDelete(qvo.getQ_file(), request);
		}

		result = questionService.questionDelete(qvo.getQ_num());

		if (result == 1) {
			url = "/question/questionList?page=" + qvo.getPage() + "&pageSize=" + qvo.getPageSize();

		} else {
			url = "/question/questionDetail?q_num=" + qvo.getQ_num() + "&page=" + qvo.getPage() + "&pageSize="
					+ qvo.getPageSize();

		}

		return "redirect:" + url;
	}

}
