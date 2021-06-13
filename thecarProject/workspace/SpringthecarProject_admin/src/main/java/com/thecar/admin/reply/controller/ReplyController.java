package com.thecar.admin.reply.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.thecar.admin.reply.service.ReplyService;
import com.thecar.admin.reply.vo.ReplyVO;

/**************************************************************
 * 참고 : @RestController (@Controller + @ResponesBody) 기존의 특정한 JSP와 같은 뷰를 만들어 내는
 * 것이 목적이 아닌 REST 방식의 데이터 처리를 위해서 사용하는(데이터 자체를 반환) 어노테이션이다.
 **************************************************************/

@RestController
@RequestMapping(value = "/admin/replies")
public class ReplyController {
	private Logger log = LoggerFactory.getLogger(ReplyController.class);

	@Autowired
	private ReplyService replyService;

	/**************************************************************
	 * 답변 글목록 구현하기
	 * 
	 * @return List<ReplyVO> 참고 : @PathVariable는 URI의 경로에서 원하는 데이터를 추출하는 용도의 어노테이션.
	 *         현재 요청 URL : http://localhost:8080/replies/all/문의글글번호 예전 요청 URL :
	 *         http://localhost:8080/admin/replies/replyList?q_num=문의글글번호
	 **************************************************************/
	@RequestMapping(value = "/all/{q_num}", method = RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> list(@PathVariable("q_num") Integer q_num) {
		ResponseEntity<List<ReplyVO>> entity = null;
		try {
			entity = new ResponseEntity<List<ReplyVO>>(replyService.replyList(q_num), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<ReplyVO>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	/**************************************************************
	 * 답변 글쓰기 구현하기
	 * 
	 * @return String 참고 : @RequestBody
	 **************************************************************/
	@RequestMapping(value = "/replyInsert")
	public ResponseEntity<String> replyInsert(@RequestBody ReplyVO rpvo) {
		log.info("replyInsert 호출 성공");
		ResponseEntity<String> entity = null;
		int result;
		try {
			result = replyService.replyInsert(rpvo);
			if (result == 1) {
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	/**************************************************************
	 * 비밀번호 확인
	 **************************************************************/
	@RequestMapping(value = "/pwdConfirm")
	public ResponseEntity<Integer> pwdConfirm(@ModelAttribute ReplyVO rpvo) {
		log.info("pwdConfirm 호출 성공");
		ResponseEntity<Integer> entity = null;
		int result = 0;
		try {
			result = replyService.pwdConfirm(rpvo);
			entity = new ResponseEntity<Integer>(result, HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Integer>(result, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	/**************************************************************
	 * 답변 수정 구현하기
	 * 
	 * @return 참고 : REST 방식에서 UPDATE 작업은 PUT,PATCH방식을 이용해서 처리. 전체 데이터를 수정하는 경우에는
	 *         PUT을 이용하고, 일부의 데이터를 수정하는 경우에는 PATCH를 이용.
	 **************************************************************/
	@RequestMapping(value = "/{rp_num}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> replyUpdate(@PathVariable("rp_num") Integer rp_num, @RequestBody ReplyVO rpvo) {
		log.info("replyUpdate 호출 성공");
		ResponseEntity<String> entity = null;
		try {
			rpvo.setRp_num(rp_num);
			replyService.replyUpdate(rpvo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	/**************************************************************
	 * 답변 삭제 구현하기
	 * 
	 * @return 참고 : REST 방식에서 DELETE 작업은 DELETE방식을 이용해서 처리.
	 **************************************************************/
	@RequestMapping(value = "/{rp_num}", method = RequestMethod.DELETE)
	public ResponseEntity<String> replyDelete(@PathVariable("rp_num") Integer rp_num) {
		log.info("replyDelete 호출 성공");
		ResponseEntity<String> entity = null;
		try {
			replyService.replyDelete(rp_num);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
