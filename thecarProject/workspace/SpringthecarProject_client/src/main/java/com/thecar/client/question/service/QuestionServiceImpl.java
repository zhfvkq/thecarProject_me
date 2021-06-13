package com.thecar.client.question.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thecar.client.question.dao.QuestionDao;
import com.thecar.client.question.vo.QuestionVO;

@Service
@Transactional
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	private QuestionDao questionDao;

	// 문의글 목록 구현
	@Override
	public List<QuestionVO> questionList(QuestionVO qvo) {
		List<QuestionVO> q_List = null;

		q_List = questionDao.questionList(qvo);
		return q_List;
	}

	// 전체 레코드 수 구현
	@Override
	public int questionListCnt(QuestionVO qvo) {
		return questionDao.questionListCnt(qvo);
	}

	// 문의글 입력 구현
	@Override
	public int questionInsert(QuestionVO qvo) {
		int result = 0;

		try {
			result = questionDao.questionInsert(qvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}

		return result;
	}

	// 문의글 상세 구현
	@Override
	public QuestionVO questionDetail(QuestionVO qvo) {
		QuestionVO detail = null;
		detail = questionDao.questionDetail(qvo);
		return detail;
	}

	// 비밀번호 확인 구현
	@Override
	public int questionPwdConfirm(QuestionVO qvo) {
		int result = 0;
		result = questionDao.questionPwdConfirm(qvo);
		return result;
	}

	// 문의글 수정 구현
	@Override
	public int questionUpdate(QuestionVO qvo) {
		int result = 0;
		try {
			result = questionDao.questionUpdate(qvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	// 문의글 삭제 구현
	@Override
	public int questionDelete(int q_num) {

		int result = 0;

		try {
			result = questionDao.questionDelete(q_num);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

}
