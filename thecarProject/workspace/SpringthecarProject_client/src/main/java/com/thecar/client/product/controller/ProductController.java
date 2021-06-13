package com.thecar.client.product.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.thecar.client.login.controller.LoginController;
import com.thecar.client.product.service.ProductService;
import com.thecar.client.product.vo.ProductVO;

@Controller
@RequestMapping(value="/product")
public class ProductController {
	private Logger log = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private ProductService productService;
	

	/**************************************************************
	 * 전체 차종 상품 목록
	 **************************************************************/
	@RequestMapping(value = {"/productList", "/smallProductList",
			"/miniProductList", "/midProductList", "/bigProductList"}, 
		method = RequestMethod.GET)
	public ModelAndView productList(@ModelAttribute ProductVO pvo, HttpServletRequest request) {
		log.info("product get 호출 성공");
		
		ModelAndView mav = new ModelAndView();
		List<ProductVO> productList = productService.productList(pvo);
		String r_prerentalDate = "";
		String search1="1";
		mav.addObject("list", productList);
		mav.addObject("r_prerentalDate",r_prerentalDate);
		mav.addObject("search1",search1);
		
		// 매핑명 확인
		if(request.getServletPath().equals("/product/productList")) {
			mav.setViewName("product/productList");
		}else if(request.getServletPath().equals("/product/smallProductList")) {
			mav.setViewName("product/smallProductList");
		}else if(request.getServletPath().equals("/product/miniProductList")) {
			mav.setViewName("product/miniProductList");
		}else if(request.getServletPath().equals("/product/midProductList")) {
			mav.setViewName("product/midProductList");
		}else if(request.getServletPath().equals("/product/bigProductList")) {
			mav.setViewName("product/bigProductList");
		}else {
			System.out.println("실행됨");
			mav.setViewName("product/productList");
		}

		return mav;
	}
	
	/**************************************************************
	 * 대여/반납 시간 지정 후 상품 검색 시 실행될 메서드
	 **************************************************************/
	@RequestMapping(value = {"/productSelectList", "/smallproductSelectList", 
			"/miniproductSelectList", "/midproductSelectList", "/bigproductSelectList"},
			method = RequestMethod.GET)
	public ModelAndView productSelectList(@ModelAttribute ProductVO pvo, HttpServletRequest request,
			@RequestParam("stTime") String stTime) {
		
		log.info("product post 호출 성공");
		
		ModelAndView mav = new ModelAndView();
		List<ProductVO> productList = productService.productSelectList(pvo);
		
		// 대여,반납 날짜 보내기
		String r_prerentalDate = pvo.getR_prerentalDate();
		r_prerentalDate = r_prerentalDate.substring(0,4)+"-"+r_prerentalDate.substring(4,6)+"-"+r_prerentalDate.substring(6,8);
		String r_prereturnDate = pvo.getR_prereturnDate();
		r_prereturnDate = r_prereturnDate.substring(0,4)+"-"+r_prereturnDate.substring(4,6)+"-"+r_prereturnDate.substring(6,8);
		
		// 검색시
		String search1 = "2";
		
		mav.addObject("list", productList);
		mav.addObject("r_prerentalDate",r_prerentalDate);
		mav.addObject("r_prereturnDate",r_prereturnDate);
		mav.addObject("stTime",stTime);
		mav.addObject("search1",search1);
		// 매핑명 확인
		if (request.getServletPath().equals("/product/productSelectList")) {
			mav.setViewName("product/productList");
		} else if (request.getServletPath().equals("/product/smallproductSelectList")) {
			mav.setViewName("product/smallProductList");
		} else if (request.getServletPath().equals("/product/miniproductSelectList")) {
			mav.setViewName("product/miniProductList");
		} else if (request.getServletPath().equals("/product/midproductSelectList")) {
			mav.setViewName("product/midProductList");
		} else if (request.getServletPath().equals("/product/bigproductSelectList")) {
			mav.setViewName("product/bigProductList");
		} else {
			System.out.println("실행됨");
			mav.setViewName("product/productList");
		}
		
		return mav;
	}
	


}
