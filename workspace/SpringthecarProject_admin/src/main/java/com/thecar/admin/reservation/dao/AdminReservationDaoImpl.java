package com.thecar.admin.reservation.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.thecar.admin.member.vo.AdminMemberVO;
import com.thecar.admin.reservation.vo.AdminReservationVO;
import com.thecar.common.vo.PagingVO;

@Repository
public class AdminReservationDaoImpl implements AdminReservationDao {

	@Autowired
	private SqlSession session;

	// 예약완료 목록
	@Override
	public List<AdminReservationVO> selectReservationList(AdminReservationVO rvo) {
		return session.selectList("selectReservationList");
	}

	// 예약완료 카운트 목록
	@Override
	public int reservationCnt() {
		return session.selectOne("reservationCnt");
	}

	// 대여중 변경
	@Override
	public int rentalUpdate(AdminReservationVO rvo) {
		return session.update("rentalUpdate", rvo);
	}

	// 대여중 목록
	@Override
	public List<AdminReservationVO> selectRentalList(AdminReservationVO rvo) {
		return session.selectList("selectRentalList", rvo);
	}

	// 대여중 카운트 목록
	@Override
	public int countRentalCnt() {
		return session.selectOne("countRentalCnt");
	}

	// 반납완료 변경
	@Override
	public int returnUpdate(AdminReservationVO rvo) {
		return session.update("returnUpdate", rvo);
	}

	// 반납완료 카운트 목록
	@Override
	public int returnCnt() {
		return session.selectOne("returnCnt");
	}

	// 반납완료 리스트
	@Override
	public List<AdminReservationVO> selectReturnList(AdminReservationVO rvo) {
		return session.selectList("selectReturnList", rvo);
	}

	// 취소요청 리스트
	@Override
	public List<AdminReservationVO> cancelList(AdminReservationVO rvo) {
		return session.selectList("cancelList", rvo);
	}

	// 취소요청 게시물 카운트
	@Override
	public int cancelCnt() {
		return session.selectOne("cancelCnt");
	}

	// 취소완료 목록조회
	@Override
	public List<AdminReservationVO> cancelOkList(AdminReservationVO rvo) {
		return session.selectList("cancelOkList", rvo);
	}

	// 취소완료로 변경
	@Override
	public int cancelOk(AdminReservationVO rvo) {
		return session.update("cancelOk", rvo);
	}

	// 취소완료 게시물 카운트
	@Override
	public int cancelOkCnt() {
		return session.selectOne("cancelOkCnt");
	}

}
