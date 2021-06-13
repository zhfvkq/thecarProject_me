package com.thecar.client.reservation.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.thecar.client.reservation.vo.MyReservationVO;

@Repository
public class MyReservationDAOImpl implements MyReservationDAO {

	@Autowired
	private SqlSession session;

	@Override
	public int myReservationCnt(Map<String, Object> paramMap) {
		return (Integer) session.selectOne("myReservationCnt", paramMap);

	}

	@Override
	public List<MyReservationVO> myReservationList(Map<String, Object> paramMap) {
		List<MyReservationVO> list = session.selectList("myReservationList", paramMap);
		return list;
	}

	@Override
	public int countSearchedArticles(MyReservationVO search) throws Exception {
		return session.selectOne("Search", search);
	}

	// 취소요청
	@Override
	public int reservationCancel(MyReservationVO bvo) {
		return session.update("reservationCancel", bvo);
	}

}
