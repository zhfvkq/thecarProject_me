package com.thecar.client.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() {
		return "index";
	}

	/************************************************************************************/
	
	@RequestMapping(value = "/template/info/info_contentLayout", method = RequestMethod.GET)
	public String info() {
		return "template/info/info_contentLayout";
	}

	@RequestMapping(value = "/template/infoPage/infoPage1", method = RequestMethod.GET)
	public String infoPage1() {
		return "template/infoPage/infoPage1";
	}

	@RequestMapping(value = "/template/infoPage/infoPage2", method = RequestMethod.GET)
	public String infoPage2() {
		return "template/infoPage/infoPage2";
	}

	@RequestMapping(value = "/template/infoPage/infoPage3", method = RequestMethod.GET)
	public String infoPage3() {
		return "template/infoPage/infoPage3";
	}

	@RequestMapping(value = "/template/infoPage/infoPage4", method = RequestMethod.GET)
	public String infoPage4() {
		return "template/infoPage/infoPage4";
	}

	@RequestMapping(value = "/template/infoPage/infoPage5", method = RequestMethod.GET)
	public String infoPage5() {
		return "template/infoPage/infoPage5";
	}

	/************************************************************************************/
	
	@RequestMapping(value = "/template/rentalInfo/rentalInfo_contentLayout", method = RequestMethod.GET)
	public String rentalInfo() {
		return "template/rentalInfo/rentalInfo_contentLayout";
	}
	
	@RequestMapping(value = "/template/rentalInfoPage/rentalInfo1", method = RequestMethod.GET)
	public String rentalInfo1() {
		return "template/rentalInfoPage/rentalInfo1";
	}

	@RequestMapping(value = "/template/rentalInfoPage/rentalInfo2", method = RequestMethod.GET)
	public String rentalInfo2() {
		return "template/rentalInfoPage/rentalInfo2";
	}

	@RequestMapping(value = "/template/rentalInfoPage/rentalInfo3", method = RequestMethod.GET)
	public String rentalInfo3() {
		return "template/rentalInfoPage/rentalInfo3";
	}

	@RequestMapping(value = "/template/rentalInfoPage/rentalInfo4", method = RequestMethod.GET)
	public String rentalInfo4() {
		return "template/rentalInfoPage/rentalInfo4";
	}

	@RequestMapping(value = "/template/rentalInfoPage/rentalInfo5", method = RequestMethod.GET)
	public String rentalInfo5() {
		return "template/rentalInfoPage/rentalInfo5";
	}


}
