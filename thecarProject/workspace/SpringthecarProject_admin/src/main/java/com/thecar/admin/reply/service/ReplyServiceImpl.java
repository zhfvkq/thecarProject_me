package com.thecar.admin.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thecar.admin.reply.dao.ReplyDao;
import com.thecar.admin.reply.vo.ReplyVO;

@Service
@Transactional
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDao replyDao;

	// 답변목록 구현
	@Override
	public List<ReplyVO> replyList(Integer q_num) {
		List<ReplyVO> myList = null;
		myList = replyDao.replyList(q_num);
		return myList;
	}

	// 답변입력 구현
	@Override
	public int replyInsert(ReplyVO rpvo) {
		int result = 0;
		try {
			result = replyDao.replyInsert(rpvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	@Override
	public int pwdConfirm(ReplyVO rpvo) {
		int result = 0;
		result = replyDao.pwdConfirm(rpvo);
		return result;
	}

	// 답변수정 구현
	@Override
	public int replyUpdate(ReplyVO rpvo) {
		int result = 0;
		try {
			result = replyDao.replyUpdate(rpvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	// 답변삭제 구현
	@Override
	public int replyDelete(int rp_num) {
		int result = 0;
		try {
			result = replyDao.replyDelete(rp_num);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
}
