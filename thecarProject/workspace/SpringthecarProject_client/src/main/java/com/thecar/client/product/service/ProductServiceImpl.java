package com.thecar.client.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thecar.client.product.dao.ProductDao;
import com.thecar.client.product.vo.ProductVO;

@Service
@Transactional
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductDao productDao;

	@Override
	public List<ProductVO> productSelectList(ProductVO pvo) {
		List<ProductVO> productList = null;
		productList = productDao.productSelctList(pvo);
		return productList;
	}

	// 예약할 상품 정보
	@Override
	public  ProductVO productSelect(ProductVO pvo) {
		pvo = productDao.productSelect(pvo);
		return pvo;
	}

	/**************************************************************
	 * 상품 리스트
	 **************************************************************/
	@Override
	public List<ProductVO> productList(ProductVO pvo) {
		List<ProductVO> productList = null;
		productList = productDao.productList(pvo);
		return productList;
	}
	


}
