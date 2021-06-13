package com.thecar.client.product.dao;

import java.util.List;

import com.thecar.client.product.vo.ProductVO;

public interface ProductDao {
	// 예약 가능 차량 목록
	public  List<ProductVO>  productSelctList(ProductVO pvo);
	// 예약할 상품 정보
	public ProductVO productSelect(ProductVO pvo);
	
	
	// 차량 목록
	public List<ProductVO> productList(ProductVO pvo);
}
