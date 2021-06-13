package com.thecar.admin.reply.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.thecar.admin.reply.vo.ReplyVO;

@Repository
public class ReplyDaoImpl implements ReplyDao {

	@Autowired
	private SqlSession session;

	// 답변목록 구현
	@Override
	public List<ReplyVO> replyList(Integer q_num) {
		return session.selectList("replyList", q_num);

	}

	// 답변입력 구현
	@Override
	public int replyInsert(ReplyVO rpvo) {
		return session.insert("replyInsert");
	}

	// 비밀번호 확인
	@Override
	public int pwdConfirm(ReplyVO rpvo) {
		return (Integer) session.selectOne("pwdConfirm");
	}

	// 답변 수정 구현
	@Override
	public int replyUpdate(ReplyVO rpvo) {
		return session.update("replyUpdate");
	}

	// 답변 삭제 구현
	@Override
	public int replyDelete(int rp_num) {
		return session.delete("replyDelete", rp_num);
	}

	// 답변 삭제 구현(문의글 번호로 해당 문의글 전체 댓글 삭제)
	@Override
	public int replyChoiceDelete(int q_num) {
		return session.delete("replyChoiceDelete", q_num);
	}

}
