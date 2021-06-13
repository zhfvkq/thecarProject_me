package com.thecar.admin.reservation.dao;

import java.util.List;

import com.thecar.admin.reservation.vo.AdminReservationVO;
import com.thecar.common.vo.PagingVO;

public interface AdminReservationDao {

	// 예약목록 조회
	public List<AdminReservationVO> selectReservationList(AdminReservationVO rvo);

	// 예약완료 게시물 총 갯수
	public int reservationCnt();

	// 대여중 변경
	public int rentalUpdate(AdminReservationVO rvo);

	// 페이징 처리 대여중 조회
	public List<AdminReservationVO> selectRentalList(AdminReservationVO rvo);

	// 대여중 게시물 총 갯수
	public int countRentalCnt();

	// 반납완료 변경
	public int returnUpdate(AdminReservationVO rvo);

	// 반납완료 게시물 총 갯수
	public int returnCnt();

	// 반납완료 목록 조회
	public List<AdminReservationVO> selectReturnList(AdminReservationVO rvo);

	// 취소요청 목록 조회
	public List<AdminReservationVO> cancelList(AdminReservationVO rvo);

	// 취소요청 게시물 총 갯수
	public int cancelCnt();

	// 취소완료 목록 조회
	public List<AdminReservationVO> cancelOkList(AdminReservationVO rvo);

	// 취소완료로 변경
	public int cancelOk(AdminReservationVO rvo);

	// 취소완료 게시물 총 갯수
	public int cancelOkCnt();

}
