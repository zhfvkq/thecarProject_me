package com.thecar.admin.reservation.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.thecar.admin.reservation.service.AdminReservationService;
import com.thecar.admin.reservation.vo.AdminReservationVO;
import com.thecar.common.page.Paging;
import com.thecar.common.util.Util;
import com.thecar.common.vo.PagingVO;

@Controller
@RequestMapping(value = "/admin")
public class AdminReservationController {

	private Logger log = LoggerFactory.getLogger(AdminReservationController.class);

	@Autowired
	private AdminReservationService adminReservationService;

	/**************************************************************
	 * 예약목록조회하기
	 **************************************************************/
	@RequestMapping(value = "/reservation/reservationList", method = RequestMethod.GET)
	public ModelAndView selectReservationList(HttpSession session, HttpServletRequest request) {

		if (Util.checkAdminSession(session)) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("/admin/login/adminLogin");

			return mav;
		}

		log.info("/reservaion/reservationList 호출");

		ModelAndView mav = new ModelAndView();

		PagingVO pagingVO = adminReservationService.reservationCnt(request.getParameter("page"));
		AdminReservationVO adminReservationVO = new AdminReservationVO();
		adminReservationVO.setPage(pagingVO.getPage());
		List<AdminReservationVO> selectReservationList = adminReservationService
				.selectReservationList(adminReservationVO);

		mav.addObject("selectReservationList", selectReservationList);
		mav.addObject("pagingVO", pagingVO);

		mav.setViewName("/admin/reservation/reservationList");

		return mav;

	}

	/**************************************************************
	 * 대여중으로 변경하기
	 **************************************************************/
	@ResponseBody
	@RequestMapping(value = "/reservation/rental", method = RequestMethod.POST)
	public String rentalUpdate(@ModelAttribute AdminReservationVO rvo) {
		log.info("updateRental 호출 성공");
		int result = 0;
		String resultStr = "";
		result = adminReservationService.rentalUpdate(rvo);

		if (result == 1) {
			resultStr = "success";
		} else {
			resultStr = "fail";
		}

		log.info("result = " + result + " resultStr = " + resultStr);

		return resultStr;
	}

	/**************************************************************
	 * 대여목록 조회하기
	 **************************************************************/
	@RequestMapping(value = "/reservation/rentalList", method = RequestMethod.GET)
	public ModelAndView selectrentalList(HttpSession session, HttpServletRequest request) {

		if (Util.checkAdminSession(session)) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("/admin/login/adminLogin");

			return mav;
		}

		log.info("/reservaion/rentalList 호출");

		ModelAndView mav = new ModelAndView();

		PagingVO pagingVO = adminReservationService.countRentalCnt(request.getParameter("page"));
		AdminReservationVO adminReservationVO = new AdminReservationVO();
		adminReservationVO.setPage(pagingVO.getPage());
		List<AdminReservationVO> selectRentalList = adminReservationService.selectRentalList(adminReservationVO);

		mav.addObject("selectRentalList", selectRentalList);
		mav.addObject("pagingVO", pagingVO);

		mav.setViewName("/admin/reservation/rentalList");

		return mav;

	}
	/*
	 * @RequestMapping(value = "/admin/reservation/rentalList", method =
	 * RequestMethod.GET) public String selectrentalList(@ModelAttribute
	 * AdminReservationVO rvo, Model model, HttpServletRequest request) {
	 * log.info("rentalList 호출 성공"); model.addAttribute("rentalList",
	 * adminReservationService.selectRentalList(rvo)); return
	 * "admin/reservation/rentalList";
	 * 
	 * }
	 */

	/**************************************************************
	 * 반납완료로 변경하기
	 **************************************************************/
	@ResponseBody
	@RequestMapping(value = "/reservation/return", method = RequestMethod.POST)
	public String returnUpdate(@ModelAttribute AdminReservationVO rvo) {
		log.info("returnUpdate 호출 성공");
		int result = 0;
		String resultStr = "";
		result = adminReservationService.returnUpdate(rvo);

		if (result == 1) {
			resultStr = "success";
		} else {
			resultStr = "fail";
		}

		log.info("result = " + result + " resultStr = " + resultStr);

		return resultStr;
	}

	/**************************************************************
	 * 반납완료목록 조회하기
	 **************************************************************/
	@RequestMapping(value = "/reservation/returnList", method = RequestMethod.GET)
	public ModelAndView selectreturnList(HttpSession session, HttpServletRequest request) {

		if (Util.checkAdminSession(session)) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("/admin/login/adminLogin");

			return mav;
		}

		log.info("/reservaion/selectreturnList 호출");

		ModelAndView mav = new ModelAndView();

		PagingVO pagingVO = adminReservationService.returnCnt(request.getParameter("page"));
		AdminReservationVO adminReservationVO = new AdminReservationVO();
		adminReservationVO.setPage(pagingVO.getPage());
		List<AdminReservationVO> selectReturnList = adminReservationService.selectReturnList(adminReservationVO);

		mav.addObject("selectReturnList", selectReturnList);
		mav.addObject("pagingVO", pagingVO);

		mav.setViewName("/admin/reservation/returnList");

		return mav;

	}

	/**************************************************************
	 * 취소요청목록 조회하기
	 **************************************************************/
	@RequestMapping(value = "/reservation/cancelList", method = RequestMethod.GET)
	public ModelAndView cancelList(HttpSession session, HttpServletRequest request) {

		if (Util.checkAdminSession(session)) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("/admin/login/adminLogin");

			return mav;
		}

		log.info("/reservaion/cancelList 호출");

		ModelAndView mav = new ModelAndView();

		PagingVO pagingVO = adminReservationService.cancelCnt(request.getParameter("page"));
		AdminReservationVO adminReservationVO = new AdminReservationVO();
		adminReservationVO.setPage(pagingVO.getPage());
		List<AdminReservationVO> cancelList = adminReservationService.cancelList(adminReservationVO);

		mav.addObject("cancelList", cancelList);
		mav.addObject("pagingVO", pagingVO);

		mav.setViewName("/admin/reservation/cancelList");

		return mav;

	}

	/**************************************************************
	 * 취소완료로 변경하기
	 **************************************************************/
	@ResponseBody
	@RequestMapping(value = "/reservation/cancelOk", method = RequestMethod.POST)
	public String cancelOk(@ModelAttribute AdminReservationVO rvo) {
		log.info("cancelOk 호출 성공");
		int result = 0;
		String resultStr = "";
		result = adminReservationService.cancelOk(rvo);

		if (result == 1) {
			resultStr = "success";
		} else {
			resultStr = "fail";
		}

		log.info("result = " + result + " resultStr = " + resultStr);

		return resultStr;
	}

	/**************************************************************
	 * 취소완료목록 조회하기
	 **************************************************************/
	@RequestMapping(value = "/reservation/cancelOkList", method = RequestMethod.GET)
	public ModelAndView cancelOkList(HttpSession session, HttpServletRequest request) {

		if (Util.checkAdminSession(session)) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("/admin/login/adminLogin");

			return mav;
		}

		log.info("/reservaion/cancelOkList 호출");

		ModelAndView mav = new ModelAndView();

		PagingVO pagingVO = adminReservationService.cancelOkCnt(request.getParameter("page"));
		AdminReservationVO adminReservationVO = new AdminReservationVO();
		adminReservationVO.setPage(pagingVO.getPage());
		List<AdminReservationVO> cancelOkList = adminReservationService.cancelOkList(adminReservationVO);

		mav.addObject("cancelOkList", cancelOkList);
		mav.addObject("pagingVO", pagingVO);

		mav.setViewName("/admin/reservation/cancelOkList");

		return mav;

	}
}
