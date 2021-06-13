package com.thecar.client.reservation.service;

import java.util.List;

import com.thecar.client.member.vo.MemberVO;
import com.thecar.client.reservation.vo.ReservationVO;

public interface ReservationService {

	public int ReservationInsert(ReservationVO rvo);

	List<ReservationVO> selectSearch(String m_id);

	public List<ReservationVO> searchNonMember(MemberVO mvo);

}
