package com.thecar.client.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thecar.admin.reply.dao.ReplyDao;
import com.thecar.admin.reply.vo.ReplyVO;

@Service
@Transactional
public class ClientReplyServiceImpl implements ClientReplyService {

	@Autowired
	private ReplyDao replyDao;

	// 글목록 구현
	@Override
	public List<ReplyVO> replyList(Integer q_num) {
		List<ReplyVO> rp_List = null;
		rp_List = replyDao.replyList(q_num);
		return rp_List;
	}

}
