package com.thecar.client.reservation.service;

import java.util.List;
import java.util.Map;

import com.thecar.client.reservation.vo.MyReservationVO;
import com.thecar.common.vo.Paging;

public interface MyReservationService {

	public int myReservationListCnt(Map<String, Object> paramMap);

	public List<MyReservationVO> myReservationList(Map<String, Object> paramMap);

	int countSearchedArticles(MyReservationVO search) throws Exception;

	public static int myReservationCnt(Paging pagination) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 취소요청
	public int reservationCancel(MyReservationVO bvo);
}
