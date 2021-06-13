package com.thecar.client.reservation.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thecar.client.reservation.dao.MyReservationDAO;
import com.thecar.client.reservation.vo.MyReservationVO;

@Service
public class MyReservationServiceImpl implements MyReservationService {

	@Autowired
	private MyReservationDAO reservateionDAO;

	@Override
	public int myReservationListCnt(Map<String, Object> paramMap) {
		return reservateionDAO.myReservationCnt(paramMap);
	}

	@Override
	public List<MyReservationVO> myReservationList(Map<String, Object> paramMap) {
		return reservateionDAO.myReservationList(paramMap);
	}

	@Override
	public int countSearchedArticles(MyReservationVO search) throws Exception {
		return reservateionDAO.countSearchedArticles(search);
	}

	// 취소요청
	@Override
	public int reservationCancel(MyReservationVO bvo) {
		return reservateionDAO.reservationCancel(bvo);
	}

}
