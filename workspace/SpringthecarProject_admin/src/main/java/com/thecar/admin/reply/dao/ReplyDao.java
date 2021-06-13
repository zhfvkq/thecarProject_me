package com.thecar.admin.reply.dao;

import java.util.List;

import com.thecar.admin.reply.vo.ReplyVO;

public interface ReplyDao {
	public List<ReplyVO> replyList(Integer q_num); // 답글 목록

	public int replyInsert(ReplyVO rpvo); // 답글 입력

	public int pwdConfirm(ReplyVO rpvo); // 비밀번호 확인

	public int replyUpdate(ReplyVO rpvo); // 답글 수정

	public int replyDelete(int rp_num); // 답글 삭제

	public int replyChoiceDelete(int q_num); // 답변 삭제 구현(문의글 번호로 해당 문의글 전체 댓글 삭제)
}
