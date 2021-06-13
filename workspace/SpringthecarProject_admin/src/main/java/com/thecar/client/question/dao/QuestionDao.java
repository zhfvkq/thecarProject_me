package com.thecar.client.question.dao;

import java.util.List;

import com.thecar.client.question.vo.QuestionVO;

public interface QuestionDao {
	public List<QuestionVO> questionList(QuestionVO qvo); // 문의글 목록

	public int questionListCnt(QuestionVO qvo); // 전체 레코드 수 구현

	public int questionInsert(QuestionVO qvo); // 문의글 작성

	public QuestionVO pwdCheck(QuestionVO qvo); // 상세 보기 전 비밀번호 확인

	public QuestionVO questionDetail(QuestionVO qvo); // 문의글 상세

	public int pwdConfirm(QuestionVO qvo); // 비밀번호 확인

	public int questionUpdate(QuestionVO qvo); // 문의글 수정

	public int questionDelete(int q_num); // 문의글 삭제

	public int rpStateUpdate(QuestionVO qvo); // 문의글 답변 상태 수정

}
