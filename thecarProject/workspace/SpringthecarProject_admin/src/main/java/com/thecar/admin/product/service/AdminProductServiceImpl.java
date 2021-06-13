package com.thecar.admin.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thecar.admin.product.dao.AdminProductDao;
import com.thecar.admin.product.vo.AdminProductVO;

@Service
@Transactional
public class AdminProductServiceImpl implements AdminProductService {

	@Autowired
	private AdminProductDao adminProductDao;

	// 등록 차량 목록 구현
	@Override
	public List<AdminProductVO> adminProductList(AdminProductVO pvo) {
		List<AdminProductVO> myList = null;

		// 정렬에 대한 기본값 설정
		if (pvo.getOrder_by() == null)
			pvo.setOrder_by("c_no");
		if (pvo.getOrder_sc() == null)
			pvo.setOrder_sc("DESC");

		myList = adminProductDao.adminProductList(pvo);
		return myList;
	}

	// 전체 레코드 수
	@Override
	public int adminProductListCnt(AdminProductVO pvo) {
		return adminProductDao.adminProductListCnt(pvo);
	}

	// 차량 등록 구현
	@Override
	public int adminProductInsert(AdminProductVO pvo) {
		int result = 0;
		try {
			result = adminProductDao.adminProductInsert(pvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	// 등록 차량 상세 구현
	@Override
	public AdminProductVO adminProductDetail(AdminProductVO pvo) {
		AdminProductVO detail = null;
		detail = adminProductDao.adminProductDetail(pvo);
		return detail;
	}

	// 등록 차량 수정 구현
	@Override
	public int adminProductUpdate(AdminProductVO pvo) {
		int result = 0;
		try {
			result = adminProductDao.adminProductUpdate(pvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	// 등록 차량 삭제
	@Override
	public int adminProductDelete(int c_no) {
		int result = 0;

		result = adminProductDao.adminProductDelete(c_no);

		return result;
	}

}
