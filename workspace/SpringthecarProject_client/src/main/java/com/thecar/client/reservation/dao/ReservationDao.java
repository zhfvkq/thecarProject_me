package com.thecar.client.reservation.dao;

import java.util.List;

import com.thecar.client.member.vo.MemberVO;
import com.thecar.client.reservation.vo.ReservationVO;

public interface ReservationDao {
	public int reservationInsert(ReservationVO rvo);

	public List<ReservationVO> selectSearch(String m_id);

	public String searchNonMember(MemberVO mvo);

}
