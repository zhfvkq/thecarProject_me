package com.thecar.client.reservation.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.thecar.client.login.controller.LoginController;
import com.thecar.client.login.vo.LoginVO;
import com.thecar.client.member.service.MemberService;
import com.thecar.client.member.vo.MemberVO;
import com.thecar.client.product.service.ProductService;
import com.thecar.client.product.vo.ProductVO;
import com.thecar.client.reservation.service.ReservationService;
import com.thecar.client.reservation.vo.ReservationVO;

@Controller
@RequestMapping(value = "/reservation")
public class ReservationController {
	private Logger log = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private ProductService productService;

	@Autowired
	private MemberService memberService;

	@Autowired
	private ReservationService reservationService;

	/**************************************************************
	 * 예약 페이지 화면 출력
	 **************************************************************/
	@RequestMapping(value = "/reservationView", method = RequestMethod.GET)
	public String reservationList(@ModelAttribute ProductVO pvo, Model model, HttpSession session) {
		log.info("reservation get 호출 성공");

		// 로그인 상태가 아니라면
		LoginVO login = (LoginVO) session.getAttribute("login");
		if (login == null) {
			return "member/login";
		}

		// 대여일 구하기
		String date1 = pvo.getR_prerentalDate();
		date1 = date1.substring(0, 4) + "-" + date1.substring(4, 6) + "-" + date1.substring(6, 8);
		String date2 = pvo.getR_prereturnDate();
		date2 = date2.substring(0, 4) + "-" + date2.substring(4, 6) + "-" + date2.substring(6, 8);
		System.out.println(date1);
		System.out.println(date2);

		try {

			SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
			Date FirstDate = format.parse(date1);
			Date SecondDate = format.parse(date2);

			long calDate = FirstDate.getTime() - SecondDate.getTime();

			long calDateDays = calDate / (24 * 60 * 60 * 1000);

			calDateDays = Math.abs(calDateDays);

			model.addAttribute("calDateDays", calDateDays);

			System.out.println("두 날짜의 날짜 차이: " + calDateDays);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		// 회원 정보
		MemberVO vo = memberService.memberSelect(login.getM_id());
		model.addAttribute("member", vo);
		// 차 정보
		ProductVO reservation = productService.productSelect(pvo);
		model.addAttribute("reservation", reservation);
		String r_prerentalDate = pvo.getR_prerentalDate();
		String r_prereturnDate = pvo.getR_prereturnDate();
		model.addAttribute("r_prerentalDate", r_prerentalDate);
		model.addAttribute("r_prereturnDate", r_prereturnDate);

		return "reservation/reservationView";
	}

	/**************************************************************
	 * 예약하기 버튼 클릭
	 **************************************************************/
	@RequestMapping(value = "/reservationView", method = RequestMethod.POST)
	public ModelAndView reservation(@ModelAttribute ReservationVO rvo, HttpSession session, Model model) {
		log.info("reservation get 호출 성공");
		ModelAndView mav = new ModelAndView();

		// 로그인 상태가 아니라면
		LoginVO login = (LoginVO) session.getAttribute("login");
		if (login == null) {
			mav.setViewName("member/login");
			return mav;
		}

		// 예약
		int errcode = 0;
		errcode = reservationService.ReservationInsert(rvo);
		switch (errcode) {
		case 1:// 실패
			mav.addObject("errCode", 1);
			mav.setViewName("reservation/reservationView");
			break;
		case 2:// 성공
			mav.addObject("errCode", 2);
			mav.setViewName("reservation/reservationView");
			break;
		default:
			mav.addObject("errCode", 3);
			mav.setViewName("reservation/reservationView");
			break;
		}
		return mav;
	}

	/******
	 * ===================================================================================
	 *****/

	/**************************************************************
	 * 예약 내역 확인창 출력
	 **************************************************************/
	@RequestMapping(value = "/reservationCheck1", method = RequestMethod.GET)
	public ModelAndView reservationCheck(HttpSession session) {

		ModelAndView mav = new ModelAndView();

		// 로그인 상태가 아니라면 회원이름, 전화번호 입력 받기
		LoginVO login = (LoginVO) session.getAttribute("login");
		if (login == null) {
			mav.setViewName("reservation/reservationCheck1");
			return mav;
		}
		// 회원정보
		MemberVO vo = memberService.memberSelect(login.getM_id());
		System.out.println(login.getM_id());
		mav.addObject("member", vo);
		// 예약정보
		String m_id = login.getM_id();
		List<ReservationVO> rvo = reservationService.selectSearch(m_id);
		if(rvo.isEmpty()) {
			String errCode = "1";
			mav.addObject("errCode", errCode);
		}
		mav.addObject("show", rvo);
		mav.setViewName("reservation/reservationCheck2");
		return mav;
	}

	/**************************************************************
	 * 예약 내역 확인
	 **************************************************************/

	@RequestMapping(value = "/reservationCheck1", method = RequestMethod.POST)
	public ModelAndView reservationCheckPost(@ModelAttribute("MemberVO") MemberVO mvo, HttpSession session,
			Model model) {
		System.out.println("reservation 호출");
		ModelAndView mav = new ModelAndView();

		// 예약정보리스트
		List<ReservationVO> rvo;

		// 로그인 상태가 아니라면 입력받은 회원이름, 전화번호 반환
		LoginVO login = (LoginVO) session.getAttribute("login");

		if (login == null) {

			System.out.println("로그인 정보 null");
			MemberVO vo = new MemberVO();
			vo.setM_name(mvo.getM_name());
			vo.setM_phone(mvo.getM_phone());
			model.addAttribute("member", vo);

			rvo = reservationService.searchNonMember(vo);

			// null 값 여부
			if (rvo.isEmpty()) {
				String errCode = "1";
				mav.addObject("errCode", errCode);
				mav.setViewName("reservation/reservationCheck1");
				return mav;
			} else {
				mav.addObject("show", rvo);
				mav.setViewName("reservation/reservationCheck2");
				return mav;
			}

		} else {

			String errCode = "1";
			mav.addObject("errCode", errCode);
			mav.setViewName("reservation/reservationCheck1");
			return mav;

		}

	}
}
