package com.thecar.client.reservation.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thecar.client.login.vo.LoginVO;
import com.thecar.client.reservation.service.MyReservationService;
import com.thecar.client.reservation.vo.MyReservationVO;
import com.thecar.common.vo.Paging;

@Controller
@RequestMapping(value = "/")
public class MyReservationController {

	/*
	 * private Logger log = LoggerFactory.getLogger(MemberController.class);
	 */

	// 내 예약목록, 취소요청 (예송)
	@Autowired
	private MyReservationService myReservationService;

	@RequestMapping(value = "/reservation/myReservationList", method = RequestMethod.GET)
	public String myReservationList(@ModelAttribute MyReservationVO bvo, Model model, HttpSession session,
			@RequestParam(defaultValue = "1") int curPage, HttpServletRequest request) throws Exception {

		System.out.println("MyReservatioinList - 내 예약목록 리스트 호출 성공");

		// HttpSession session = request.getSession();

		// 조회를 위한 회원로그인정보(아이디값) 받아오기
		LoginVO loginVO = (LoginVO) session.getAttribute("login");

		System.out.println("아이디 : " + loginVO.getM_id());

		MyReservationVO reservationVO = (MyReservationVO) session.getAttribute("reservationVO");
		if (reservationVO == null) {
			reservationVO = new MyReservationVO();
		}

		// 로그인창 연결후 주석처리
		// reservationVO.setM_id("a1"); // 테스트로 임시아이디값 넣어줌

		Paging pagination = new Paging(curPage, 10, 10);
		// pagination.setReservationVo(reservationVO);
		Map<String, Object> map = new HashMap<>();
		map.put("login", loginVO);
		map.put("reservation", reservationVO);
		map.put("paging", pagination);

		int listCnt = myReservationService.myReservationListCnt(map);
		pagination.setTotalRecordCount(listCnt);

		/* model.addAttribute("login", loginVO); */
		model.addAttribute("myReservationList", myReservationService.myReservationList(map));
		model.addAttribute("pagination", pagination);
		return "/reservation/myReservationList";
	}

	// 취소요청
	@ResponseBody
	@RequestMapping(value = "/reservation/myReservationCancel", method = RequestMethod.POST)
	public String rentalUpdate(@ModelAttribute MyReservationVO bvo) {

		int result = 0;
		String resultStr = "";
		result = myReservationService.reservationCancel(bvo);

		if (result == 1) {
			resultStr = "success";
		} else {
			resultStr = "fail";
		}

		/*
		 * log.info("result = " + result + " resultStr = " + resultStr);
		 */
		return resultStr;
	}
}