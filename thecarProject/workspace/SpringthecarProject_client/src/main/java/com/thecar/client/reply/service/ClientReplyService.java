package com.thecar.client.reply.service;

import java.util.List;

import com.thecar.admin.reply.vo.ReplyVO;

public interface ClientReplyService {
	public List<ReplyVO> replyList(Integer q_num);

}
