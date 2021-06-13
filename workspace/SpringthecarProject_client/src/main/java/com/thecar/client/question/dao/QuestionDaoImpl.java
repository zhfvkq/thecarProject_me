package com.thecar.client.question.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.thecar.client.question.vo.QuestionVO;

@Repository
public class QuestionDaoImpl implements QuestionDao {

	@Autowired
	private SqlSession session;

	// 문의글 목록 구현
	@Override
	public List<QuestionVO> questionList(QuestionVO qvo) {

		return session.selectList("questionList", qvo);
	}

	// 전체 레코드 건수 구현
	@Override
	public int questionListCnt(QuestionVO qvo) {
		return (Integer) session.selectOne("questionListCnt");
	}

	// 문의글 입력 구현
	@Override
	public int questionInsert(QuestionVO qvo) {

		return session.insert("questionInsert", qvo);
	}

	// 문의글 상세 구현
	@Override
	public QuestionVO questionDetail(QuestionVO qvo) {

		return (QuestionVO) session.selectOne("questionDetail", qvo);
	}

	// 비밀번호 확인 구현
	@Override
	public int questionPwdConfirm(QuestionVO qvo) {

		return (Integer) session.selectOne("questionPwdConfirm", qvo);
	}

	// 문의글 수정 구현
	@Override
	public int questionUpdate(QuestionVO qvo) {

		return session.update("questionUpdate", qvo);
	}

	// 문의글 삭제
	@Override
	public int questionDelete(int q_num) {

		return session.delete("questionDelete", q_num);
	}

	// 문의글 답변 상태 수정 구현
	@Override
	public int rpStateUpdate(QuestionVO qvo) {

		return session.update("rpStateUpdate", qvo);

	}

}
