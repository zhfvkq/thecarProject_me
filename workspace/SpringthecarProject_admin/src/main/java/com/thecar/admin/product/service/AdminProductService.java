package com.thecar.admin.product.service;

import java.util.List;

import com.thecar.admin.product.vo.AdminProductVO;

public interface AdminProductService {
	public List<AdminProductVO> adminProductList(AdminProductVO pvo); // 등록 차량 리스트

	public int adminProductInsert(AdminProductVO pvo); // 차량 등록

	public AdminProductVO adminProductDetail(AdminProductVO pvo); // 등록 차량 상세

	public int adminProductUpdate(AdminProductVO pvo); // 등록 차량 수정

	public int adminProductDelete(int c_no); // 등록 차량 삭제

	public int adminProductListCnt(AdminProductVO pvo); // 전체 레코드 건수 구현
}
