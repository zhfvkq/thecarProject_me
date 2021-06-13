package com.thecar.admin.question.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thecar.client.question.dao.QuestionDao;
import com.thecar.client.question.vo.QuestionVO;

@Service
@Transactional
public class AdminQuestionServiceImpl implements AdminQuestionService {

	@Autowired
	private QuestionDao questionDao;

	// 문의글 목록 구현
	@Override
	public List<QuestionVO> questionList(QuestionVO qvo) {
		List<QuestionVO> q_List = null;

		q_List = questionDao.questionList(qvo);
		return q_List;
	}

	// 문의글 상세 구현
	@Override
	public QuestionVO questionDetail(QuestionVO qvo) {
		QuestionVO detail = null;
		detail = questionDao.questionDetail(qvo);
		return detail;
	}

	// 전체 레코드 수 구현
	@Override
	public int questionListCnt(QuestionVO qvo) {
		return questionDao.questionListCnt(qvo);
	}

	// 문의글 수정 구현
	@Override
	public int rpStateUpdate(QuestionVO qvo) {
		int result = 0;
		try {
			result = questionDao.rpStateUpdate(qvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

}
