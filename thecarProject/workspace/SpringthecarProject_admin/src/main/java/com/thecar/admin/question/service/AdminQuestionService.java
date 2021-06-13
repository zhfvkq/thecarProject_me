package com.thecar.admin.question.service;

import java.util.List;

import com.thecar.client.question.vo.QuestionVO;

public interface AdminQuestionService {

	public List<QuestionVO> questionList(QuestionVO qvo); // 문의글 리스트

	public QuestionVO questionDetail(QuestionVO qvo); // 문의글 상세

	public int questionListCnt(QuestionVO qvo); // 전체 레코드 수 구현

	public int rpStateUpdate(QuestionVO qvo); // 문의글 답변상태 업데이트

}
