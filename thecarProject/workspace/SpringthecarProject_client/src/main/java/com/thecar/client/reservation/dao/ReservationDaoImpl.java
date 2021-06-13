package com.thecar.client.reservation.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.thecar.client.member.vo.MemberVO;
import com.thecar.client.reservation.vo.ReservationVO;

@Repository
public class ReservationDaoImpl implements ReservationDao {

	@Autowired
	private SqlSession session;

	@Override
	public int reservationInsert(ReservationVO rvo) {
		return session.insert("reservationInsert", rvo);
	}

	@Override
	public List<ReservationVO> selectSearch(String m_id) {
		return session.selectList("selectSearch", m_id);
	}

	@Override
	public String searchNonMember(MemberVO mvo) {
		return session.selectOne("searchNonMember", mvo);
	}

}
