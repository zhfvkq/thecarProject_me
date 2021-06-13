package com.thecar.admin.product.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.thecar.admin.product.vo.AdminProductVO;

@Repository
public class AdminProductDaoImpl implements AdminProductDao {

	@Autowired
	private SqlSession session;

	// 등록 차량 목록 구현
	@Override
	public List<AdminProductVO> adminProductList(AdminProductVO pvo) {
		return session.selectList("adminProductList", pvo);
	}

	// 등록 차량 상세 구현
	@Override
	public AdminProductVO adminProductDetail(AdminProductVO pvo) {
		return (AdminProductVO) session.selectOne("adminProductDetail", pvo);
	}

	// 차량 등록 구현
	@Override
	public int adminProductInsert(AdminProductVO pvo) {
		return session.insert("adminProductInsert", pvo);
	}

	// 등록 차량 수정 구현
	@Override
	public int adminProductUpdate(AdminProductVO pvo) {
		return session.update("adminProductUpdate", pvo);
	}

	// 등록 차량 삭제 구현
	@Override
	public int adminProductDelete(int c_no) {
		return session.delete("adminProductDelete", c_no);
	}

	// 전체 레코드 건수 구현
	@Override
	public int adminProductListCnt(AdminProductVO pvo) {
		return (Integer) session.selectOne("adminProductListCnt");
	}

}
