package com.thecar.client.reply.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.thecar.admin.reply.vo.ReplyVO;
import com.thecar.client.reply.service.ClientReplyService;

/**************************************************************
 * 참고 : @RestController (@Controller + @ResponesBody) 기존의 특정한 JSP와 같은 뷰를 만들어 내는
 * 것이 목적이 아닌 REST 방식의 데이터 처리를 위해서 사용하는(데이터 자체를 반환) 어노테이션이다.
 **************************************************************/

@RestController
@RequestMapping(value = "/replies")
public class ClientReplyController {
	private Logger log = LoggerFactory.getLogger(ClientReplyController.class);

	@Autowired
	private ClientReplyService replyService;

	/*
	 * 댓글 글목록 구현하기
	 */
	@RequestMapping(value = "/all/{q_num}", method = RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> list(@PathVariable("q_num") Integer q_num) {

		log.info(q_num + " 답변 List 호출 성공");

		ResponseEntity<List<ReplyVO>> entity = null;
		try {
			entity = new ResponseEntity<List<ReplyVO>>(replyService.replyList(q_num), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<ReplyVO>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

}
