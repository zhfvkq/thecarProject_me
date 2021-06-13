package com.thecar.client.product.service;

import java.util.List;

import com.thecar.client.product.vo.ProductVO;

public interface ProductService {
	
	public List<ProductVO> productList(ProductVO pvo);
	public List<ProductVO> productSelectList(ProductVO pvo);
	
	/* 리스트 출력 */
	public ProductVO productSelect(ProductVO pvo);

}
