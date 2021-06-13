package com.thecar.client.reservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thecar.client.member.vo.MemberVO;
import com.thecar.client.reservation.dao.ReservationDao;
import com.thecar.client.reservation.vo.ReservationVO;

@Service
@Transactional
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationDao reservationDao;

	// 예약
	@Override
	public int ReservationInsert(ReservationVO rvo) {

		try {
			reservationDao.reservationInsert(rvo);
			return 2;// insert 성공
		} catch (Exception e) {
			return 1;// insert 실패
		}
	}

	// 예약확인
	@Override
	public List<ReservationVO> selectSearch(String m_id) {
		List<ReservationVO> rvo = null;
		rvo = reservationDao.selectSearch(m_id);
		return rvo;
	}

	// 비로그인 예약 확인(이름, 전화번호)
	@Override
	public List<ReservationVO> searchNonMember(MemberVO mvo) {
		String m_id = reservationDao.searchNonMember(mvo);
		List<ReservationVO> rvo2 = selectSearch(m_id);
		return rvo2;
	}

}
