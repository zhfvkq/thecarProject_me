package com.thecar.client.reservation.dao;

import java.util.List;
import java.util.Map;

import com.thecar.client.reservation.vo.MyReservationVO;

public interface MyReservationDAO {

	
	public int myReservationCnt(Map<String,Object> paramMap);

	
	public List<MyReservationVO> myReservationList(Map<String,Object> paramMap);
	

	int countSearchedArticles(MyReservationVO search) throws Exception;


	// 취소요청
	public int reservationCancel(MyReservationVO bvo);

}
