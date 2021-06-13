package com.thecar.admin.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.thecar.admin.product.service.AdminProductService;
import com.thecar.admin.product.vo.AdminProductVO;
import com.thecar.common.file.FileUploadUtil;
import com.thecar.common.page.Paging;
import com.thecar.common.util.Util;

@Controller
@RequestMapping(value = "/admin")
public class AdminProductController {
	private Logger log = LoggerFactory.getLogger(AdminProductController.class);

	@Autowired
	private AdminProductService adminProductService;

	/**************************************************************
	 * 등록 차량목록 구현하기
	 **************************************************************/
	@RequestMapping(value = "/product/productList", method = RequestMethod.GET)
	public String adminProductList(@ModelAttribute AdminProductVO pvo, Model model) {
		log.info("productList 호출 성공");

		// 페이지 세팅
		Paging.setPage(pvo);

		// 전체 레코드수 구현
		int total = adminProductService.adminProductListCnt(pvo);
		log.info("total = " + total);

		// 등록 차량번호 재설정
		int count = total - (Util.nvl(pvo.getPage()) - 1) * Util.nvl(pvo.getPageSize());
		log.info("count = " + count);

		List<AdminProductVO> productList = adminProductService.adminProductList(pvo);

		model.addAttribute("productList", productList);
		model.addAttribute("count", count);
		model.addAttribute("total", total);
		model.addAttribute("data", pvo);

		return "/admin/product/productList";
	}

	/**************************************************************
	 * 차량 등록 폼 출력하기
	 **************************************************************/
	@RequestMapping(value = "/product/productWrite")
	public String productWrite() {
		log.info("productWrite 호출 성공");
		return "/admin/product/productWrite";
	}

	/**************************************************************
	 * 차량 등록 구현하기
	 **************************************************************/
	@RequestMapping(value = "/product/productInsert", method = RequestMethod.POST)
	public String adminProductInsert(@ModelAttribute AdminProductVO pvo, Model model, HttpServletRequest request)
			throws IllegalStateException, IOException {

		log.info("productInsert 호출 성공");

		int result = 0;
		String url = "";

		if (pvo.getFile() != null) {

			String c_image = FileUploadUtil.fileUpload(pvo.getFile(), request, "product");
			pvo.setC_image(c_image);
		}

		result = adminProductService.adminProductInsert(pvo);
		if (result == 1) {
			url = "/admin/product/productList";
		} else {
			model.addAttribute("code", 1);
			url = "/admin/product/productWrite";
		}
		return "redirect:" + url;
	}

	/**************************************************************
	 * 등록 차량 상세보기 구현
	 **************************************************************/
	@RequestMapping(value = "/product/productDetail", method = RequestMethod.GET)
	public String productDetail(@ModelAttribute AdminProductVO pvo, Model model) {
		log.info("productDetail 호출 성공");
		log.info("c_no = " + pvo.getC_no());

		AdminProductVO detail = new AdminProductVO();
		detail = adminProductService.adminProductDetail(pvo);

		if (detail != null) {
			detail.setC_det(detail.getC_det().toString().replaceAll("\n", "<br>"));
		}

		model.addAttribute("detail", detail);

		return "/admin/product/productDetail";
	}

	/**************************************************************
	 * 등록 차량 수정 폼 출력하기
	 * 
	 * @param : c_no
	 * @return : ProductVO
	 **************************************************************/
	@RequestMapping(value = "/product/productModify")
	public String updateForm(@ModelAttribute AdminProductVO pvo, Model model) {
		log.info("productModify 호출 성공");

		log.info("c_no = " + pvo.getC_no());

		AdminProductVO updateData = new AdminProductVO();
		updateData = adminProductService.adminProductDetail(pvo);

		model.addAttribute("updateData", updateData);
		return "/admin/product/productModify";
	}

	// 등록 차량 수정 구현하기
	@RequestMapping(value = "/product/productUpdate", method = RequestMethod.POST)
	public String productUpdate(@ModelAttribute AdminProductVO pvo, HttpServletRequest request)
			throws IllegalStateException, IOException {
		log.info("productUpdate 호출 성공");

		int result = 0;
		String url = "";
		String c_image = "";

		if (!pvo.getFile().isEmpty()) {
			log.info("======== file = " + pvo.getFile().getOriginalFilename());
			if (!pvo.getC_image().isEmpty()) {
				FileUploadUtil.fileDelete(pvo.getC_image(), request);
			}

			c_image = FileUploadUtil.fileUpload(pvo.getFile(), request, "product");
			pvo.setC_image(c_image);

		} else {
			log.info("첨부파일 없음");
			pvo.setC_image("");
		}
		log.info("==========c_image = " + pvo.getC_image());

		result = adminProductService.adminProductUpdate(pvo);

		if (result == 1) {

			url = "/admin/product/productDetail?c_no=" + pvo.getC_no();

		} else {
			url = "/admin/product/productModify?c_no=" + pvo.getC_no();

		}

		return "redirect:" + url;
	}

	/**************************************************************
	 * 등록 차량삭제 구현하기
	 * 
	 * @throws IOException
	 **************************************************************/
	@RequestMapping(value = "/product/productDelete")
	public String productDelete(@ModelAttribute AdminProductVO pvo, HttpServletRequest request) throws IOException {
		log.info("productDelete 호출 성공");

		// 아래 변수에는 입력 성공에 대한 상태값 담습니다.(1 or 0)
		int result = 0;
		String url = "";

		if (!pvo.getC_image().isEmpty()) {
			FileUploadUtil.fileDelete(pvo.getC_image(), request);
		}

		result = adminProductService.adminProductDelete(pvo.getC_no());
		if (result == 1) {
			url = "/admin/product/productList?page=" + pvo.getPage() + "&pageSize=" + pvo.getPageSize();
		} else {
			url = "/admin/product/productDetail?c_no=" + pvo.getC_no() + "&page=" + pvo.getPage() + "&pageSize="
					+ pvo.getPageSize();
		}
		return "redirect:" + url;
	}
}
